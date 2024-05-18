import 'package:flutter/material.dart';

import '../../utils/constants/app_color.dart';
import '../../utils/constants/app_constants.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key, this.onChanged, required this.value});
  final bool value;
  final void Function(bool)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AbstractCustomSwitch(
        onChanged: onChanged,
        value: value,
      ),
    );
  }
}

class AbstractCustomSwitch extends StatelessWidget {
  const AbstractCustomSwitch({
    super.key,
    required this.onChanged,
    required this.value,
  });

  final void Function(bool p1)? onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged == null ? null : () => onChanged!(!value),
      child: AnimatedContainer(
        height: 20,
        width: 52,
        alignment: value ? Alignment.centerRight : Alignment.centerLeft,
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: onChanged == null
              ? Colors.grey.shade600
              : value
                  ? AppColor.primary
                  : const Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(AppConst.borderRadius),
        ),
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: onChanged == null ? Colors.grey.shade400 : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(),
          ),
        ),
      ),
    );
  }
}
