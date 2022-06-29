import 'package:flutter/material.dart';
import 'package:g4m_website/navigation_drawer_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FeedbackPage extends StatelessWidget {
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
                "Feedback",
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
                    'We want to give you the best possible experience. As such, we need your feedback, if you have any, kindly fill in the form below. Thank you!',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'ProductSans',
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    child: Text(
                      "Feedback Form",
                      style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'ProductSans',
                          fontSize: 20),
                    ),
                    onTap: () =>
                        launchUrlString('https://forms.gle/XDhjN26qHnndyBKJ9'),
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
