import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseData {
  //data manager for Firestore Data
  String id;
  String title;
  String desc;
  String thumbnail;
  String material;
  String preview;
  FirebaseData(
      {this.id = '',
      this.title = '',
      this.desc = '',
      this.thumbnail = '',
      this.material = '',
      this.preview = ''});

  static FirebaseData fromJson(Map<String, dynamic> json) => FirebaseData(
      id: json['id'],
      title: json['title'],
      desc: json['desc'],
      thumbnail: json['thumbnail'],
      material: json['material'],
      preview: json['preview']);
}
