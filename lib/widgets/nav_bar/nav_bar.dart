import 'package:flutter/material.dart';
import 'package:lb_admin/constants/colors.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key, this.scaffoldkey}) : super(key: key);
  final GlobalKey<ScaffoldState>? scaffoldkey;

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int? _value = 1;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appbar,
      automaticallyImplyLeading: false,
      elevation: 6,
      title: Text(
        'DashBoard',
        maxLines: 1,
        style: TextStyle(color: light),
      ),

      /*Image.network(
        'data:image/png;base64,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',
        // 'https://th.bing.com/th/id/OIP.IfZ0tayzbVuwCfxceflhIwHaHa?pid=ImgDet&rs=1',
        color: Colors.transparent,
      ),*/

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Align(
            alignment: Alignment.topRight,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                alignment: Alignment.bottomCenter,
                items: const [
                  DropdownMenuItem(
                    child: Text("Manage Slot"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Logout"),
                    value: 2,
                  )
                ],
                onChanged: (val) {
                  setState(() {
                    _value = val as int?;
                  });
                },
                icon: Icon(Icons.settings, color: light, size: 28),
              ),
            ),
          ),
        )
      ],
    );
  }
}
