import 'package:flutter/material.dart';
import 'package:lb_admin/pages/authentication.dart';

class LargeScreenWidget extends StatelessWidget {
  const LargeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const AdminAuth(),
    );
  }
}
