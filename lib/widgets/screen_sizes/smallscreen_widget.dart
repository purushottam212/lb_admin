import 'package:flutter/material.dart';
import 'package:lb_admin/pages/authentication.dart';

class SmallScreenWidget extends StatelessWidget {
  const SmallScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const AdminAuth(),
    );
  }
}
