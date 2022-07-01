import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:g4m_website/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_storage_web/firebase_storage_web.dart';
import 'package:ndialog/ndialog.dart';
import 'package:flutter/cupertino.dart';

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
        initialChildSize: 0.57,
        maxChildSize: 0.72,
        minChildSize: 0.47,
        expand: false,
        builder: (_, controller) => Container(
              width: deviceWidth,
              padding: EdgeInsets.all(16),
              child: ListView(controller: controller, children: [
                Text(
                  titleText,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "ProductSansBold",
                      fontSize: 25),
                ),
                Text(
                  desc,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "ProductSans",
                      fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  "tap to enlarge",
                  style: TextStyle(
                      color: Colors.black54, fontFamily: 'ProductSans'),
                )),
                SizedBox(
                    child: InkWell(
                        onTap: () {
                          DialogBackground(
                            dialog: AlertDialog(
                              content: Image.network(preview),
                              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              insetPadding: EdgeInsets.zero,
                            ),
                            blur: 2,
                          ).show(context,
                              transitionType: DialogTransitionType.Bubble);
                        },
                        child: Image.network(preview,
                            height: 150,
                            fit: BoxFit.contain, frameBuilder: (context, child,
                                frame, wasSynchronouslyLoaded) {
                          return child;
                        }, loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.red)),
                            );
                          }
                        }))),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 54, 167, 77),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    child: TextButton.icon(
                        icon: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          if (await canLaunch(pdfLink)) {
                            await launch(pdfLink, forceSafariVC: false);
                          }
                          print('pressed');
                        },
                        label: Text(
                          "Play Now",
                          style: TextStyle(
                              fontSize: 23,
                              fontFamily: 'ProductSansBold',
                              color: Colors.white),
                        ))),
              ]),
            ));
  }
}
