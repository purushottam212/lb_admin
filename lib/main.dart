import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lb_admin/helpers/handle_responsiveness.dart';

void main() {
  
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LB-Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          textTheme:
              GoogleFonts.mulishTextTheme(Theme.of(context).textTheme).apply(),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
          })),
      home: HandleResponsiveness(
        context: context,
      ),
    );
  }
}
