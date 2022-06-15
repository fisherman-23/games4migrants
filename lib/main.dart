import 'package:flutter/material.dart';
import 'package:g4m_website/customWidget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:g4m_website/firebaseData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ui';
import 'package:g4m_website/main.dart';
import 'package:aurora/aurora.dart';
import 'package:g4m_website/navigation_drawer_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
      apiKey: "AIzaSyDZZTMQbR0JniJ5rvsColFlrGEJWOyoBxM",
      appId: "1:254119905380:web:9976032539026ade2b7771",
      messagingSenderId: "254119905380",
      projectId: "g4m-website",
    ),
  );
  runApp(MyApp());
}

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class MyApp extends StatelessWidget {
  Widget buildGame(FirebaseData games) => ImageCard(
      imageURL: games.thumbnail,
      titleText: games.title,
      desc: games.desc,
      pdfLink: games.material,
      gameid: games.id,
      preview: games.preview);

  Stream<List<FirebaseData>> gameData() => FirebaseFirestore.instance
      .collection('games')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => FirebaseData.fromJson(doc.data()))
          .toList());

  Stream<List<FirebaseData>> webGameData() => FirebaseFirestore.instance
      .collection('webGames')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => FirebaseData.fromJson(doc.data()))
          .toList());
  Stream<List<FirebaseData>> gotwData() =>
      FirebaseFirestore.instance //game of the week
          .collection('gotw')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => FirebaseData.fromJson(doc.data()))
              .toList());

  @override
  Widget build(BuildContext context) {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    final deviceWidth = data.size.shortestSide;
    final deviceHeight = data.size.longestSide;

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
                "Browse Games",
                style: TextStyle(
                    color: Colors.black, fontFamily: 'Helvetica', fontSize: 29),
              ),
            ),
            body: Container(
                child: Row(children: [
              SizedBox(width: 10),
              Container(
                  width: deviceWidth - 10,
                  child: ListView(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(' Game of the Week:',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 23,
                                fontFamily: 'Helvetica',
                                color: Colors.black)),
                        StreamBuilder<List<FirebaseData>>(
                            stream: gotwData(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                print("error");
                                return Text(
                                  "Something went wrong! ${snapshot.error}",
                                  style: TextStyle(color: Colors.black),
                                );
                              } else if (snapshot.hasData) {
                                final games = snapshot.data!;
                                print(games);
                                return Container(
                                    height: 200,
                                    width: (MediaQuery.of(context).size.width) -
                                        10,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: games.map(buildGame).toList(),
                                    ));
                              } else {
                                print("loading");
                                print(deviceWidth);
                                return Center(
                                    child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.red)));
                              }
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          ' Website Games',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 23,
                              fontFamily: 'Helvetica',
                              color: Colors.black),
                        ),
                        StreamBuilder<List<FirebaseData>>(
                            stream: webGameData(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                print("error");
                                return Text(
                                  "Something went wrong! ${snapshot.error}",
                                  style: TextStyle(color: Colors.black),
                                );
                              } else if (snapshot.hasData) {
                                final games = snapshot.data!;
                                print(games);
                                return Container(
                                    height: 200,
                                    width: (MediaQuery.of(context).size.width) -
                                        10,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: games.map(buildGame).toList(),
                                    ));
                              } else {
                                print("loading");
                                print(deviceWidth);
                                return Center(
                                    child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.red)));
                              }
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          ' PDF Games',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 23,
                              fontFamily: 'Helvetica',
                              color: Colors.black),
                        ),
                        StreamBuilder<List<FirebaseData>>(
                            stream: gameData(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                print("error");
                                return Text(
                                  "Something went wrong! ${snapshot.error}",
                                  style: TextStyle(color: Colors.black),
                                );
                              } else if (snapshot.hasData) {
                                final games = snapshot.data!;
                                print(games);
                                return Container(
                                    height: 200,
                                    width: (MediaQuery.of(context).size.width) -
                                        10,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: games.map(buildGame).toList(),
                                    ));
                              } else {
                                print("loading");
                                print(deviceWidth);
                                return Center(
                                    child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.red)));
                              }
                            }),
                      ],
                    )
                  ]))
            ])),
          )
        ]));
  }
}
