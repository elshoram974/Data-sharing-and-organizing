import 'package:flutter/material.dart';

class FullScreenWidget extends StatelessWidget {
  const FullScreenWidget({
    super.key,
    required this.child,
    this.backgroundColor = Colors.black,
    this.backgroundIsTransparent = true,
    this.disposeLevel = DisposeLevel.medium,
    this.widgetInFullScreen,
    this.appBar,
    this.openFullPage = true,
    required this.imageLink,
  });

  final String? imageLink;
  final PreferredSizeWidget? appBar;
  final bool openFullPage;
  final Widget child;
  final Widget? widgetInFullScreen;
  final Color backgroundColor;
  final bool backgroundIsTransparent;
  final DisposeLevel disposeLevel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !openFullPage
          ? null
          : () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  opaque: false,
                  barrierColor: backgroundIsTransparent
                      ? Colors.white.withOpacity(0)
                      : backgroundColor,
                  pageBuilder: (BuildContext context, _, __) {
                    return FullScreenPage(
                      appBar: appBar,
                      imageLink: imageLink,
                      backgroundColor: backgroundColor,
                      backgroundIsTransparent: backgroundIsTransparent,
                      disposeLevel: disposeLevel,
                      child: widgetInFullScreen ?? child,
                    );
                  },
                ),
              );
            },
      child: child,
    );
  }
}

enum DisposeLevel { high, medium, low }

class FullScreenPage extends StatefulWidget {
  const FullScreenPage({
    super.key,
    required this.child,
    this.backgroundColor = Colors.black,
    this.backgroundIsTransparent = true,
    this.disposeLevel = DisposeLevel.medium,
    this.appBar,
    this.imageLink,
  });

  final Widget child;
  final String? imageLink;
  final Color backgroundColor;
  final bool backgroundIsTransparent;
  final DisposeLevel disposeLevel;
  final PreferredSizeWidget? appBar;

  @override
  State<FullScreenPage> createState() => _FullScreenPageState();
}

class _FullScreenPageState extends State<FullScreenPage>
    with SingleTickerProviderStateMixin {
  double initialPositionY = 0;

  double currentPositionY = 0;

  double positionYDelta = 0;

  double opacity = 1;

  double disposeLimit = 150;

  Duration animationDuration = Duration.zero;

  bool canExit = true;

  late final TransformationController controller;
  late final AnimationController _animation;

  @override
  void initState() {
    super.initState();
    setDisposeLevel();
    controller = TransformationController();
    _animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    // controller.addIgnorableListener(() {
    //   print(controller.value.scale);
    //   print(controller.scale);
    //   print("----------------");
    // });
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  setDisposeLevel() {
    setState(() {
      if (widget.disposeLevel == DisposeLevel.high) {
        disposeLimit = 300;
      } else if (widget.disposeLevel == DisposeLevel.medium) {
        disposeLimit = 200;
      } else {
        disposeLimit = 100;
      }
    });
  }

  void _startVerticalDrag(details) {
    setState(() {
      initialPositionY = details.globalPosition.dy;
    });
  }

  void _whileVerticalDrag(details) {
    setState(() {
      currentPositionY = details.globalPosition.dy;
      positionYDelta = currentPositionY - initialPositionY;
      setOpacity();
    });
  }

  setOpacity() {
    double tmp = positionYDelta < 0
        ? 1 - ((positionYDelta / 1000) * -1)
        : 1 - (positionYDelta / 1000);

    if (tmp > 1) {
      opacity = 1;
    } else if (tmp < 0) {
      opacity = 0;
    } else {
      opacity = tmp;
    }

    if (positionYDelta > disposeLimit || positionYDelta < -disposeLimit) {
      opacity = 0.5;
    }
  }

  _endVerticalDrag(DragEndDetails details) {
    if (positionYDelta > disposeLimit || positionYDelta < -disposeLimit) {
      Navigator.of(context).pop();
    } else {
      setState(() {
        animationDuration = const Duration(milliseconds: 300);
        opacity = 1;
        positionYDelta = 0;
      });

      Future.delayed(animationDuration).then((_) {
        setState(() {
          animationDuration = Duration.zero;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = widget.backgroundIsTransparent
        ? Colors.transparent
        : widget.backgroundColor;
    return Scaffold(
      appBar: widget.appBar,
      bottomNavigationBar: widget.appBar == null
          ? null
          : SizedBox.fromSize(size: widget.appBar!.preferredSize),
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: GestureDetector(
        onDoubleTapDown: (details) async {
          if (controller.value != Matrix4.identity()) {
            resetController();
          } else {
            zoomIn2Scale(details);
          }
          canExitFn();
        },
        onVerticalDragStart:
            !canExit ? null : (details) => _startVerticalDrag(details),
        onVerticalDragUpdate:
            !canExit ? null : (details) => _whileVerticalDrag(details),
        onVerticalDragEnd:
            !canExit ? null : (details) => _endVerticalDrag(details),
        child: Container(
          color: widget.backgroundColor.withOpacity(opacity),
          constraints: BoxConstraints.expand(
            height: MediaQuery.sizeOf(context).height,
          ),
          child: InteractiveViewer(
            minScale: 1,
            maxScale: 4,
            transformationController: controller,
            onInteractionUpdate: (details) => canExitFn(),
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: animationDuration,
                  curve: Curves.fastOutSlowIn,
                  top:
                      widget.appBar?.preferredSize.height ?? 0 + positionYDelta,
                  bottom:
                      widget.appBar?.preferredSize.height ?? 0 - positionYDelta,
                  left: 0,
                  right: 0,
                  child: Hero(
                    tag: widget.imageLink ?? UniqueKey(),
                    child: widget.child,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void canExitFn() {
    if (controller.value.getMaxScaleOnAxis() <= 1) {
      if (canExit) return;
      canExit = true;
      setState(() {});
    } else {
      canExit = false;
    }
  }

  void resetController() {
    final Animation<Matrix4> reset = Matrix4Tween(
      begin: controller.value,
      end: Matrix4.identity(),
    ).animate(_animation);
    reset.addListener(() {
      controller.value = reset.value;
      setState(() {});
    });
    _animation.reset();
    _animation.forward();
  }

  void zoomIn2Scale(TapDownDetails details) {
    final Offset position = details.localPosition;

    final Animation<Matrix4> reset = Matrix4Tween(
      begin: controller.value,
      end: Matrix4.identity()
        ..translate(-position.dx, -position.dy)
        ..scale(2.0),
    ).animate(_animation);
    reset.addListener(() {
      controller.value = reset.value;
      setState(() {});
    });
    _animation.reset();
    _animation.forward();
  }
}
