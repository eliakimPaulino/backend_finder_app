// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'package:dart_frog/dart_frog.dart';
import 'package:uuid/uuid.dart';

import '../data/fake_db.dart';
import '../models/user.dart';
import '../utils/crypto.dart';


Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: 405, body: 'Use POST');
  }

  final body = await context.request.body();
  final data = jsonDecode(body);

  final email = data['email'].toString();
  final password = data['password'].toString();

  if (email == null || password == null) {
    return Response.json(
      statusCode: 400,
      body: {'error': 'Email e senha são obrigatórios'},
    );
  }

  final hashed = hashPassword(password);
  final user = User(
    id: const Uuid().v4(),
    email: email,
    passwordHash: hashed,
  );

  fakeUsers.add(user);

  return Response.json(
    statusCode: 201,
    body: {'message': 'Usuário cadastrado', 'user': user.toJson()},
  );
}
