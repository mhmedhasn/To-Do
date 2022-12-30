import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../models/Task1.dart';

CollectionReference<Task> getTaskCollection() {
  return FirebaseFirestore.instance.collection('task').withConverter<Task>(
        fromFirestore: (snapshot, options) => Task.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toJson(),
      );
}

Future<void> addTaskToFirebase(Task task) {
  var collection = getTaskCollection();
  var docRef = collection.doc();
  task.id = docRef.id;
  return docRef.set(task);
}

Stream<QuerySnapshot<Task>> getTaskFromFirestore(DateTime dateTime) {
  return getTaskCollection()
      .where('date',
          isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
      .snapshots();
}

Future<void> deleteTaskeToFireStore(id) {
  return getTaskCollection().doc(id).delete();
}

Future<void> updateTaskToFireStore(Task task) {
  return getTaskCollection().doc(task.id).update(task.toJson());
}



void isDone(Task task) {
  CollectionReference todoRef = getTaskCollection();

  todoRef.doc(task.id).update({
    "isDone": task.isDone! ? false : true,
  });
}
