import 'package:flutter/material.dart';
import 'package:lb_admin/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, this.label, this.controller})
      : super(key: key);
  final String? label;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18.0,
        right: 18.0,
        top: 22,
      ),
      child: Container(
        height: 42,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            color: lightGrey,
            width: 0.3,
          ),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12.5),
            labelText: '  $label',
            labelStyle: const TextStyle(
              fontSize: 12,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
