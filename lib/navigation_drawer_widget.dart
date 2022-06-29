import 'package:flutter/material.dart';
import 'package:g4m_website/feedbackPage.dart';
import 'package:g4m_website/infoPage.dart';
import 'package:g4m_website/main.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Material(
        color: Color.fromARGB(240, 255, 255, 255),
        child: ListView(
          padding: padding,
          children: [
            const SizedBox(height: 48),
            Text(
              "Games 4 Migrants",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'ProductSansBold',
                  fontSize: 30),
            ),
            SizedBox(height: 20),
            buildMenuItem(
                text: 'Browse Games',
                icon: Icons.games_outlined,
                onClicked: () => selectedItem(context, 0)),
            SizedBox(height: 10),
            buildMenuItem(
                text: 'Project Info',
                icon: Icons.info_outline_rounded,
                onClicked: () => selectedItem(context, 1)),
            SizedBox(height: 10),
            buildMenuItem(
                text: 'Feedback',
                icon: Icons.feedback_outlined,
                onClicked: () => selectedItem(context, 2)),
            SizedBox(height: 10),
            Divider(color: Colors.black87, thickness: 1),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black;
    final hoverColor = Colors.white60;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text,
          style: TextStyle(
              fontFamily: "ProductSans", fontSize: 20, color: Colors.black)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyApp(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => InfoPage(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FeedbackPage(),
        ));
        break;
    }
  }
}
