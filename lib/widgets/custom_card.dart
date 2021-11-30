import 'package:flutter/material.dart';
import 'package:lb_admin/constants/colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key? key, this.color, this.label, this.count, this.icon, this.onTap})
      : super(key: key);
  final Color? color;
  final String? label;
  final String? count;
  final IconData? icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: InkWell(
        splashColor: Colors.red,
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: card,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  icon,
                  size: 30,
                  color: color,
                ),
                title: Text('$label',
                    style: TextStyle(color: color, fontSize: 16)),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text('$count',
                      style: const TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
