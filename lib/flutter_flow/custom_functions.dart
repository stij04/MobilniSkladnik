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

int? renumerIndexInList(int? indexInList) {
  if (indexInList == null || indexInList < 0) {
    return null;
  }

  return indexInList + 4;
}

int getCurrentPozitionByUziId(
  List<UsersRecord> items,
  int uziId,
) {
  for (int i = 0; i < items.length; i++) {
    if (items[i].uziId == uziId) {
      return i + 1;
    }
  }

  return -1;
}

List<UsersRecord>? removeFirstItems(
  List<UsersRecord>? items,
  int numberOfItems,
) {
  if (items == null) {
    return null;
  }

  if (items.length <= numberOfItems) {
    return null;
  } else {
    return items.sublist(numberOfItems);
  }
}

UsersRecord getItemFromIndex(
  List<UsersRecord> items,
  int index,
) {
  if (index >= 0 && index < items.length) {
    return items[index];
  } else {
    return items.first;
  }
}
