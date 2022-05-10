library gw.globals;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

var currentUser = FirebaseAuth.instance.currentUser;

String currentUsername = '';
String currentUid = '';
String currentEmail = '';
String friendUid = '';
String friendName = '';
String friendEmail = '';
int friendNum = 0;

void initGlobals() {
  currentUsername = '';
  currentUid = '';
  currentEmail = '';
  friendUid = '';
  friendName = '';
  friendEmail = '';
  friendNum = 0;
}

List<String> tasks = ["공부", "운동", "잠자기", "일하기", "놀기", "이동", "밥먹기", "직접 추가"];

int actionKey = 8;
List<String> action = [
  "공부하는 중..",
  "운동하는 중..",
  "잠자는 중..",
  "일하는 중..",
  "노는 중..",
  "이동하는 중..",
  "밥 먹는 중..",
  "다른 거 하는 중..",
  "숨 쉬는 중.."
];

int statusKey = 8;
