import 'package:flutter/material.dart';
import 'package:lb_admin/constants/colors.dart';
import 'package:lb_admin/helpers/handle_responsiveness.dart';
import 'package:lb_admin/widgets/authentication_form.dart';

class AdminAuth extends StatelessWidget {
  const AdminAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  //stops: const [0.3, 0.2, 0, 3],
                  colors: [lightGrey, light, active],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              !HandleResponsiveness.isSmallScreen(context)
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.38,
                      width: MediaQuery.of(context).size.width * 0.28,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: light,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3.4,
                                spreadRadius: 6.6,
                                color: lightGrey)
                          ]),
                      child: const AuthForm(),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.56,
                      width: MediaQuery.of(context).size.width * 0.55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: light,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3.4,
                                spreadRadius: 6.6,
                                color: lightGrey)
                          ]),
                      child: const AuthForm(),
                    )
            ],
          )),
    );
  }
}
