import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class GroupMediaScreen extends StatelessWidget {
  const GroupMediaScreen({super.key, required this.results});

  final ListResult results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(ProviderDependency.group.group.groupName),
          ),
        ],
      ),
    );
  }
}
