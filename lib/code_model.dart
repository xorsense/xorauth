import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
// import 'package:objectdb/objectdb.dart';

class Code {
  late String challenge;
  String? url;
  String? email;
  String? public_key;
  Code(this.challenge);
  Code.generate() {
    challenge = Random.secure() as String;
  }
}

List<Code>? GetList() {
  final path = "${Directory.current.path}/app.db";
  try {
    final fileStat = FileStat.statSync(path);
  } catch (e){
    if (kDebugMode) {
      print(e);
    }
    return null;
  }
  // final db = ObjectDB(File(path));
  // List<Code> codes =
}