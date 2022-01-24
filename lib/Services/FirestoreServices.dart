// ignore_for_file: unused_import, file_names

import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //making FirestoreService a private constructor and singleton service
  FirestoreService._();

  static final instance = FirestoreService._();

  final firebasestore = FirebaseFirestore.instance;

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final documentRefrence = firebasestore.doc(path);
    print('$path: $data');
    await documentRefrence.set(data);
  }

  Future<void> deledata({required String path}) async {
    final deleteddata = firebasestore.doc(path);
    await deleteddata.delete();
  }

  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentId) builder,
  }) {
    final refrence = firebasestore.collection(path);
    final snapShot = refrence.snapshots();

    return snapShot.map(
      (snapshot) => snapshot.docs
          .map((snapshot) => builder(snapshot.data(), snapshot.id))
          .toList(),
    );
  }
}
