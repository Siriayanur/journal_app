import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:journal_app/src/models/entry.dart';

class FirestoreService {
  FirebaseFirestore  _db  = FirebaseFirestore.instance;

  //Get entries
  Stream<List<Entry>> getEntries(){
    return _db
        .collection('entries')
        //.where('date',isGreaterThan: DateTime.now().add(Duration(days: -30)).toIso8601String())
        // query : give entries of the last 30 days

        .snapshots()  //return a stream
        .map((snapshot) => snapshot.docs
        .map((doc) => Entry.fromJson(doc.data()))
        .toList());
  }

  //Insert + Update
  //Upsert
  Future<void> setEntry(Entry entry){
    var options = SetOptions(merge: true);
    return _db
        .collection('entries')
        .doc(entry.entryId)
        .set(entry.toMap(),options);
  }


  //Delete
  Future<void> removeEntry(String entryId){
    return _db
        .collection('entries')
        .doc(entryId)
        .delete();
  }

}