import 'package:flutter/material.dart';
import 'package:lb_admin/widgets/screen_sizes/largescreen_widget.dart';
import 'package:lb_admin/widgets/screen_sizes/smallscreen_widget.dart';

const largeScreenSize = 1360;
const mediumScreenSize = 768;
const smallScreenSize = 360;
const customScreenSize = 928;

class HandleResponsiveness extends StatelessWidget {
  const HandleResponsiveness({Key? key, this.context}) : super(key: key);
  final BuildContext? context;

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < mediumScreenSize;
  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeScreenSize;
  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > mediumScreenSize &&
      MediaQuery.of(context).size.width < customScreenSize;
  static bool isCustomScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > customScreenSize &&
      MediaQuery.of(context).size.width < largeScreenSize;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > largeScreenSize) {
      return const LargeScreenWidget();
    } else if (width > mediumScreenSize && width < largeScreenSize) {
      return const LargeScreenWidget();
    } else if (width > smallScreenSize && width < mediumScreenSize) {
      return const SmallScreenWidget();
    } else {
      return const LargeScreenWidget();
    }
  }
}
