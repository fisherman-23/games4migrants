import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:g4m_website/infoOfGames.dart';
import 'package:firebase_storage_web/firebase_storage_web.dart';

class ImageCard extends StatelessWidget {
  // for displaying pdf games
  String imageURL = ''; //thumbnail from firebase cloud storage
  String titleText = '';
  String gameid = '';
  String desc = '';
  String pdfLink = '';
  String preview = '';
  ImageCard(
      {Key? key,
      required this.imageURL,
      required this.titleText,
      required this.gameid,
      required this.desc,
      required this.pdfLink,
      required this.preview})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        width: 330,
        child: Card(
          elevation: 7,
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: InkWell(
              onTap: () async {
                showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Color.fromARGB(231, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(24))),
                    context: context,
                    builder: (context) => InfoOfGames(
                        titleText: titleText,
                        desc: desc,
                        pdfLink: pdfLink,
                        imageURL: imageURL,
                        gameid: gameid,
                        preview: preview));
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Ink.image(
                      image: NetworkImage(imageURL),
                      height: 240,
                      fit: BoxFit.cover),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    left: 16,
                    child: Text(titleText,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18, fontFamily: 'ProductSansBold')),
                  )
                ],
              )),
        ));
  }
}

class ImageCard2 extends StatelessWidget {
  // for displaying website games
  String imageURL = ''; //thumbnail from firebase cloud storage
  String titleText = '';
  ImageCard2({Key? key, required this.imageURL, required this.titleText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        width: 330,
        child: Card(
          elevation: 7,
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Ink.image(
                image: NetworkImage(imageURL),
                height: 240,
                fit: BoxFit.cover,
                child: InkWell(onTap: () {}),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: Text(titleText,
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 18, fontFamily: 'ProductSansBold')),
              )
            ],
          ),
        ));
  }
}
