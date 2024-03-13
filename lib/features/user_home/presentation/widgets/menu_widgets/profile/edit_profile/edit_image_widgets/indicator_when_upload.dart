import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../cubit/menu_cubits/change_photo/change_photo_cubit.dart';

class IndicatorWhenUpload extends StatelessWidget {
  const IndicatorWhenUpload({super.key, required this.cubit, this.value});

  final double? value;
  final ChangePhotoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 105,
      backgroundColor: Colors.white.withOpacity(0.8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(value: value),
          const SizedBox(height: AppConst.defaultPadding),
          IconButton(
            onPressed: cubit.cancelUploading,
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
