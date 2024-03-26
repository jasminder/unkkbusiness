import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int stringToInt(String stringValue) {
  // convert string value to integers
// create string value to integer value.
  return int.parse(stringValue);
}

DocumentReference clientServiceIDtoRef(String clientServiceID) {
  // convert serviceId to document referance
  return FirebaseFirestore.instance
      .collection('clientServices')
      .doc(clientServiceID);
}

DocumentReference docIDtoRef(String serviceID) {
  // convert serviceId to document referance
  return FirebaseFirestore.instance.collection('services').doc(serviceID);
}

DocumentReference userIdtoRef(String userID) {
  // user ID  refferance to document reffreance
// convert userId to document reference
  return FirebaseFirestore.instance.collection('users').doc(userID);
}

DateTime todayDate() {
  return DateTime.now();
}

DateTime getNextDateWithDays(
  DateTime startDate,
  int days,
) {
  // return next date by adding days in startDate
  return startDate.add(Duration(days: days));
}

String createURL(
  DocumentReference clientRef,
  DocumentReference clientTrack,
  String appUrl,
) {
  // create URl with parameters values clientRef and trackRef
  String clientRefId = clientRef.id;
  String clientTrackId = clientTrack.id;
  return '$appUrl' + 'clientRef=$clientRefId&trackRef=$clientTrackId ';
}

List<ClubbedTasksStruct>? clubTasks(List<TasksRecord>? tasks) {
  if (tasks == null || tasks.isEmpty) return [];
  List<ClubbedTasksStruct> clubbedTasks = [];
  for (var task in tasks) {
    final taskIndex = clubbedTasks
        .indexWhere((element) => element.clientRef == task.clientRef);
    if (taskIndex == -1) {
      clubbedTasks.add(ClubbedTasksStruct(
          clientRef: task.clientRef, tasks: [task.reference]));
    } else {
      final clientTasks = clubbedTasks[taskIndex].tasks;
      clientTasks.add(task.reference);
      clubbedTasks[taskIndex] =
          ClubbedTasksStruct(clientRef: task.clientRef, tasks: clientTasks);
    }
  }
  return clubbedTasks;
}

TasksRecord? getTaskFromRef(
  List<TasksRecord> tasks,
  DocumentReference? taskRef,
) {
  return tasks.firstWhere(
    (element) => element.reference == taskRef,
  );
}
