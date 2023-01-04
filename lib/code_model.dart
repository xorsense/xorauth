import 'dart:io';
import 'dart:math';
import 'package:hive/hive.dart';
import 'box_collections.dart';

enum CodeStatus {
  pending,
  accepted,
  declined,
}

class Code {
  late String challenge;
  late CodeStatus status;

  String? url;
  String? email;
  String? publicKey;

  Code(this.challenge, {this.status=CodeStatus.pending});
  Code.generate() {
    status = CodeStatus.pending;
    challenge = Random.secure() as String;
  }

  static Stream<Code> list() async* {
    BoxCollection db = await BoxCollection.open(dbName, boxes);
    var collection = await db.openBox<Code>("codes");
    var results = await collection.getAllValues();
    for (var r in results.values) {
      yield r;
    }
  }
}