import 'package:flutter/cupertino.dart';

class Entry{

  final String entryId;
  final String date;
  final String entry;

  Entry({this.date,@required this.entryId,this.entry});

  //Convert to and from Dart to json to send and recieve from the db

  //From Firestore to our 'Entry' object format
  factory Entry.fromJson(Map<String,dynamic> json){
    return Entry(
      date: json['date'],
      entry: json['entry'],
      entryId: json['entryId']
    );
  }


  //To convert from DART object to json and send it to the firestore
  Map<String,dynamic> toMap(){
    return {
      'date': date,
      'entry' : entry,
      'entryId' : entryId
    };
  }
}