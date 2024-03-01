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
import '/auth/firebase_auth/auth_util.dart';

int stringToInt(String stringValue) {
  // convert string value to integers
// create string value to integer value.
  return int.parse(stringValue);
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
