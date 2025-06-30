// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dart_frog/dart_frog.dart';
import 'package:my_project/auth/jwt_service.dart';
import 'package:my_project/auth/utils/crypto.dart';

import '../data/fake_db.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: 405, body: 'Use POST');
  }

  // Lê o corpo da requisição
  final body = await context.request.body();

  Map<String, dynamic> data;

  // Faz o jsonDecode
  try {
    data = jsonDecode(body) as Map<String, dynamic>;
  } catch (_) {
    return Response.json(statusCode: 400, body: {'error': 'JSON inválido'});
  }

  final email = data['email'];
  final password = data['password'] as String?;

  // Valida se email e password existem.
  if (email == null || password == null) {
    return Response.json(statusCode: 400, body: {'error': 'Credenciais ausentes'});
  }

  // Consulta o “banco de dados” (neste caso, uma lista fake fakeUsers).
  final user = fakeUsers.where((u) => u.email == email).isNotEmpty
      ? fakeUsers.firstWhere((u) => u.email == email)
      : null;

  // Valida se a senha bate (comparando hashPassword(password) com o passwordHash salvo).
  if (user == null || user.passwordHash != hashPassword(password)) {
    return Response.json(statusCode: 401, body: {'error': 'Email ou senha inválidos'});
  }

  // Se tudo estiver certo, chama:
  final token = generateJwt(user.id);

  return Response.json(
    body: {'token': token, 'user': user.toJson()},
  );
}
