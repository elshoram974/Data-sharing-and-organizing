import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../user_home/domain/entities/group_home_entity.dart';
import '../widgets/group_app_bar.dart';
import 'group_chat_screen.dart';

class UserGroupScreen extends StatefulWidget {
  const UserGroupScreen({super.key, required this.group});

  final GroupHomeEntity group;

  @override
  State<UserGroupScreen> createState() => _UserGroupScreenState();
}

class _UserGroupScreenState extends State<UserGroupScreen> {
  bool isOpened = false;

  int currentScreen = 0;

  final List<Widget> screens = [
    const Center(child: Text('Bot screen')),
    const GroupChatScreen(),
  ];

  double _dragPositionX = 0.0;
  double _top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GroupAppBar(group: widget.group),
      body: Stack(
        children: [
          screens[currentScreen],
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: isOpened ? 0 : -118,
            top: _top,
            child: GestureDetector(
              onTap: () => setState(() => isOpened = !isOpened),
              onHorizontalDragStart: (d) => _dragPositionX = d.localPosition.dx,
              onHorizontalDragUpdate: (d) => onHorizontalDrag(_dragPositionX, d),
              onPanUpdate: (details) {
                setState(() {
                  _top += details.delta.dy;
                  final height = MediaQuery.of(context).size.height - 180;
                  if (_top < 0) _top = 0;
                  if (_top > height) _top = height;
                });
              },
              child: FloatingSelectingScreenButton(
                isOpened: isOpened,
                currentScreen: currentScreen,
                onChooseScreen: onChooseScreen,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onHorizontalDrag(double dragPositionX, DragUpdateDetails d) {
    final double delta = dragPositionX - d.localPosition.dx;
    if (delta < 0) {
      // drag to right
      if (isOpened) return;
      isOpened = true;
    } else {
      // drag to left
      if (!isOpened) return;
      isOpened = false;
    }
    setState(() {});
    return;
  }

  void onChooseScreen(int chosenScreen) {
    currentScreen = chosenScreen;
    isOpened = false;
    setState(() {});
  }
}

class FloatingSelectingScreenButton extends StatelessWidget {
  const FloatingSelectingScreenButton({
    super.key,
    required this.isOpened,
    required this.currentScreen,
    required this.onChooseScreen,
  });

  final bool isOpened;
  final int currentScreen;
  final void Function(int chosenScreen) onChooseScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: 134,
      decoration: const BoxDecoration(
        color: AppColor.active,
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(AppConst.borderRadius),
        ),
      ),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isOpened ? 1 : 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SelectBotButton(
              text: 'BOT',
              onPressed: isOpened ? () => onChooseScreen(0) : null,
              backgroundColor: currentScreen == 0
                  ? AppColor.primary
                  : AppColor.grayLightDark(context),
            ),
            SelectBotButton(
              text: 'Chat',
              onPressed: isOpened ? () => onChooseScreen(1) : null,
              backgroundColor: currentScreen == 1
                  ? AppColor.primary
                  : AppColor.grayLightDark(context),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectBotButton extends StatelessWidget {
  const SelectBotButton({
    super.key,
    this.onPressed,
    this.backgroundColor,
    required this.text,
  });

  final void Function()? onPressed;
  final Color? backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          minimumSize: const Size(double.maxFinite, 27),
          backgroundColor: backgroundColor,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConst.borderRadius),
          ),
        ),
        child: Text(
          text,
          style: AppStyle.styleBoldInika13.copyWith(fontSize: 14),
        ),
      ),
    );
  }
}
