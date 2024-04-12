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

String getCurrentLevelName(
  List<UrovenRecord>? levels,
  double? uziBody,
) {
  if (levels == null || uziBody == null || levels.isEmpty) {
    return "–";
  }

  levels.sort((a, b) => a.uroHranice.compareTo(b.uroHranice));

  if (uziBody <= levels.first.uroHranice) {
    return levels.first.uroNazev;
  }

  if (uziBody >= levels.last.uroHranice) {
    return levels.last.uroNazev;
  }

  for (int i = 0; i < levels.length - 1; i++) {
    if (uziBody >= levels[i].uroHranice && uziBody < levels[i + 1].uroHranice) {
      return levels[i].uroNazev;
    }
  }

  return "–";
}

String getNextLevel(
  List<UrovenRecord>? levels,
  double? uziBody,
) {
  if (levels == null || uziBody == null || levels.isEmpty) {
    return "–";
  }

  levels.sort((a, b) => a.uroHranice.compareTo(b.uroHranice));

  if (uziBody <= levels.first.uroHranice) {
    return levels.first.uroPoradi.toString() + " – " + levels.first.uroNazev;
  }

  if (uziBody >= levels.last.uroHranice) {
    return "dosažena maximální úroveň";
  }

  for (int i = 0; i < levels.length - 1; i++) {
    if (uziBody >= levels[i].uroHranice && uziBody < levels[i + 1].uroHranice) {
      return levels[i + 1].uroPoradi.toString() +
          " – " +
          levels[i + 1].uroNazev;
    }
  }

  return "–";
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

double getSeasonProgressValue(List<SezonaRecord>? seasons) {
  if (seasons == null || seasons.isEmpty) {
    return 0;
  }

  DateTime now = DateTime.now();

  for (SezonaRecord season in seasons) {
    if (season.sezStart == null || season.sezKonec == null) {
      continue;
    }

    if (now.isAfter(season.sezStart!) && now.isBefore(season.sezKonec!)) {
      DateTime start = season.sezStart!;
      DateTime end = season.sezKonec!;
      Duration totalDuration = end.difference(start);
      Duration progressDuration = now.difference(start);

      if (totalDuration.inDays == 0) {
        return 0;
      }

      return progressDuration.inDays / totalDuration.inDays;
    }
  }

  return 0;
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

double getRemainingPoints(
  List<UrovenRecord>? levels,
  double? uziBody,
) {
  if (levels == null ||
      uziBody == null ||
      levels.isEmpty ||
      uziBody <= levels.first.uroHranice ||
      uziBody >= levels.last.uroHranice) {
    return 0;
  }

  for (int i = 0; i < levels.length - 1; i++) {
    if (uziBody >= levels[i].uroHranice && uziBody < levels[i + 1].uroHranice) {
      return levels[i + 1].uroHranice - uziBody;
    }
  }

  return 0;
}

int getCurrentLevelNumber(
  List<UrovenRecord>? levels,
  double? uziBody,
) {
  if (levels == null || uziBody == null || levels.isEmpty) {
    return 1;
  }

  levels.sort((a, b) => a.uroHranice.compareTo(b.uroHranice));

  if (uziBody <= levels.first.uroHranice) {
    return levels.first.uroPoradi;
  }

  if (uziBody >= levels.last.uroHranice) {
    return levels.last.uroPoradi;
  }

  for (int i = 0; i < levels.length - 1; i++) {
    if (uziBody >= levels[i].uroHranice && uziBody < levels[i + 1].uroHranice) {
      return levels[i].uroPoradi;
    }
  }

  return 1;
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

double getProgressValue(
  List<UrovenRecord>? levels,
  double? uziBody,
) {
  if (levels == null || uziBody == null || levels.isEmpty) {
    return 0;
  }

  levels.sort((a, b) => a.uroHranice.compareTo(b.uroHranice));

  if (uziBody <= levels.first.uroHranice) {
    return 0;
  }

  if (uziBody >= levels.last.uroHranice) {
    return 1;
  }

  for (int i = 0; i < levels.length - 1; i++) {
    if (uziBody >= levels[i].uroHranice && uziBody < levels[i + 1].uroHranice) {
      double differenceBetweenLimits =
          levels[i + 1].uroHranice - levels[i].uroHranice;
      double progressFromLastLimit = uziBody - levels[i].uroHranice;

      return progressFromLastLimit / differenceBetweenLimits;
    }
  }

  return 0;
}

SezonaRecord? getCurrentSeason(List<SezonaRecord>? seasons) {
  if (seasons == null || seasons.isEmpty) {
    return null;
  }

  DateTime now = DateTime.now();

  for (SezonaRecord season in seasons) {
    if (season.sezStart == null || season.sezKonec == null) {
      continue;
    }

    if (now.isAfter(season.sezStart!) && now.isBefore(season.sezKonec!)) {
      return season;
    }
  }

  return null;
}

String generateNewAvatar() {
  const baseUrl = 'https://api.dicebear.com/7.x/personas/svg?seed=';
  const avatarStyle =
      '&mouth=bigSmile,lips,smile,smirk&body=rounded,checkered,squared';

  final seed = math.Random().nextInt(1000000).toString();

  return baseUrl + seed + avatarStyle;
}

bool isNicknameUnique(
  String? nickname,
  List<UsersRecord>? users,
) {
  if (nickname == null || users == null) {
    return true;
  }

  for (UsersRecord user in users) {
    if (user.displayName == nickname) {
      return false;
    }
  }

  return true;
}
