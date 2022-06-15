import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:g4m_website/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_storage_web/firebase_storage_web.dart';

class InfoOfGames extends StatelessWidget {
  //when card press, it will show this widget
  String imageURL = ''; //thumbnail from firebase cloud storage
  String titleText = '';
  String gameid = '';
  String desc = '';
  String pdfLink = '';
  var pageImage;
  String preview = '';
  InfoOfGames(
      {Key? key,
      required this.imageURL,
      required this.titleText,
      required this.gameid,
      required this.desc,
      required this.pdfLink,
      required this.preview})
      : super(key: key);
  Widget build(BuildContext context) {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    final deviceWidth = data.size.shortestSide;
    final deviceHeight = data.size.longestSide;
    return DraggableScrollableSheet(
        initialChildSize: 0.55,
        maxChildSize: 0.6,
        minChildSize: 0.45,
        expand: false,
        builder: (_, controller) => Container(
              width: deviceWidth,
              padding: EdgeInsets.all(16),
              child: ListView(controller: controller, children: [
                Text(
                  titleText,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Helvetica",
                      fontSize: 25),
                ),
                Text(
                  desc,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "HelveticaRegular",
                      fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    child: Ink.image(
                  image: NetworkImage(preview),
                  height: 150,
                  fit: BoxFit.contain,
                )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 214, 212, 212),
                      borderRadius: BorderRadius.all(
                        Radius.circular(45.0),
                      ),
                    ),
                    child: TextButton.icon(
                        icon: Icon(Icons.play_arrow),
                        onPressed: () async {
                          if (await canLaunch(pdfLink)) {
                            await launch(pdfLink, forceSafariVC: false);
                          }

                          print('pressed');
                        },
                        label: Text(
                          "Play Now",
                          style: TextStyle(fontSize: 23),
                        ))),
              ]),
            ));
  }
}
