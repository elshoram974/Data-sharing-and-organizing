import 'package:data_sharing_organizing/core/shared/back_button_leading.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';

import '../../../user_home/domain/entities/group_home_entity.dart';
import '../widgets/group_details/media_docs/docs_widget.dart';
import '../widgets/group_details/media_docs/media_widget.dart';

class GroupMediaScreen extends StatefulWidget {
  const GroupMediaScreen(this.messages, {super.key});
  final List<Message> messages;

  @override
  State<GroupMediaScreen> createState() => _GroupMediaScreenState();
}

class _GroupMediaScreenState extends State<GroupMediaScreen> {
  final GroupHomeEntity group = ProviderDependency.group.group;
  List<ImageMessage> imageMessages = [];
  List<FileMessage> fileMessages = [];

  @override
  void initState() {
    super.initState();
    getMessages();
  }

  Future<void> getMessages() async {
    imageMessages = [];
    fileMessages = [];
    loop:
    for (Message e in widget.messages) {
      switch (e.type) {
        case MessageType.text:
          continue loop;
        case MessageType.image:
          imageMessages.add(e as ImageMessage);
          break;
        default:
          fileMessages.add(e as FileMessage);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 205,
              pinned: true,
              floating: true,
              leadingWidth: 90,
              backgroundColor: AppColor.background(context),
              leading: const BackButtonLeading(showBackButton: true),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.pin,
                background: Center(
                  child: Text(
                    ProviderDependency.group.group.groupName,
                    textAlign: TextAlign.center,
                    style: AppStyle.styleBoldInika24.copyWith(
                      fontSize: 36,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                ),
              ),
              bottom: TabBar(
                labelColor: AppColor.primary,
                indicatorColor: AppColor.primary,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: AppStyle.styleBoldInika24.copyWith(fontSize: 20),
                dividerColor: Colors.transparent,
                unselectedLabelColor:
                    Theme.of(context).textTheme.bodySmall?.color,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConst.defaultPadding,
                ),
                tabs: [
                  Tab(text: S.of(context).media),
                  Tab(text: S.of(context).docs),
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  MediaWidget(imageMessages),
                  DocsWidget(fileMessages),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


