import 'package:flutter/material.dart';
import 'package:lb_admin/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.onTap,
      required this.nameOnButton,
      required this.minHeight,
      required this.maxWidth,
      this.icon})
      : super(key: key);
  final Function()? onTap;
  final String nameOnButton;
  final IconData? icon;
  final double maxWidth;
  final double minHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      margin: const EdgeInsets.all(10),
      child: RaisedButton(
        onPressed: onTap,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, active, lightGrey.withOpacity(.5)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints:
                BoxConstraints(maxWidth: maxWidth, minHeight: minHeight),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  nameOnButton,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
                const SizedBox(width: 8),
                Icon(
                  icon,
                  size: 22,
                  color: light,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
