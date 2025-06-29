// user/index.dart file:
// ignore_for_file: avoid_print

import 'package:dart_frog/dart_frog.dart';

class User {
  User({this.id, this.name, this.weight, this.age});
  final String? id;
  final String? name;
  final int? weight;
  final int? age;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'weight': weight,
        'age': age,
      };
}

Response onRequest(RequestContext context) {
  final url = context.request.uri;
  final headers = context.request.headers;

  print(url);
  print(headers);

  final user = User(
    id: 'dsdf234nk-32kmndsv-23 k4ksdf',
    name: 'Alice Ray',
    age: 27,
    weight: 75,
  );

  return Response.json(
    body: user.toJson(),
  );
}
