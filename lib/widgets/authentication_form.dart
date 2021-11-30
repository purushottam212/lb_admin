import 'package:flutter/material.dart';
import 'package:lb_admin/pages/app_home.dart';
import 'package:lb_admin/widgets/custom_button.dart';
import 'package:lb_admin/widgets/nav_bar/custom_textfield.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Welcome Admin!!',
          style: TextStyle(fontSize: 22),
        ),
        const CustomTextField(
          label: 'Enter Username',
        ),
        const CustomTextField(label: 'Enter Password'),
        const SizedBox(
          height: 12,
        ),
        CustomButton(
          maxWidth: 140,
          minHeight: 50,
          nameOnButton: 'Login',
          icon: Icons.login,
          onTap: () async {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return const HomePage();
            }));
          },
        )
      ],
    );
  }
}
