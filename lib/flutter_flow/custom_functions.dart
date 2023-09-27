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

double getProgressBarForTime(
  int currentTime,
  int targetTime,
) {
  if (targetTime == null || currentTime == null) {
    return 0;
  }
  DateTime currentDate = DateTime.fromMicrosecondsSinceEpoch(currentTime);
  DateTime targetDate = DateTime.fromMicrosecondsSinceEpoch(targetTime);

  double differenceInHours =
      targetDate.difference(currentDate).inHours.toDouble();

  double result = (1500.0 - differenceInHours) / 1500.0;
  // return currentTime.toDouble() / targetTime.toDouble();
  return result > 1 || result < 0 ? 1.0 : result;
}

double getProgressBarForTimeInMinutes(
  int currentTime,
  int targetTime,
) {
  if (targetTime == null || currentTime == null) {
    return 0;
  }
  DateTime currentDate = DateTime.fromMicrosecondsSinceEpoch(currentTime);
  DateTime targetDate = DateTime.fromMicrosecondsSinceEpoch(targetTime);

  double differenceInHours =
      targetDate.difference(currentDate).inMinutes.toDouble();

  double result = (88200.0 - differenceInHours) / 88200.0;
  return result > 1 || result < 0 ? 1.0 : result;
  // return differenceInHours;
}
