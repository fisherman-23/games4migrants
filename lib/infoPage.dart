import 'package:flutter/material.dart';
import 'package:g4m_website/navigation_drawer_widget.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: Colors.transparent),
        home: Stack(children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                  Color.fromARGB(255, 203, 227, 247),
                  Color.fromARGB(255, 246, 233, 247),
                ])),
          ),
          Scaffold(
            endDrawer: NavigationDrawerWidget(),
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              centerTitle: false,
              title: Text(
                "Project Info",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'ProductSansBold',
                    fontSize: 29),
              ),
            ),
            body: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(
                    "We are a group of students from the School of Science and Technology, we aim to make our migrant workers here in Singapore feel more included and appreaciated through online learning materials/games that introduce them to various Singaporean cultures. We are collaborating with the Migrant Worker's Centre to make this possible.",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'ProductSans',
                        fontSize: 20),
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
