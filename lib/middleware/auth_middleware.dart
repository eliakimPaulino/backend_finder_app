// ignore_for_file: lines_longer_than_80_chars

import 'package:dart_frog/dart_frog.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:my_project/auth/utils/env.dart';

Handler authMiddleware(Handler handler) {
  return (context) async {
    final authHeader = context.request.headers['Authorization'];

    if (authHeader == null || !authHeader.startsWith('Bearer ')) {
      return Response.json(statusCode: 401, body: {'error': 'Token ausente ou inválido'});
    }

    final token = authHeader.substring(8); // Remove o prefixo "Bearer "
    try {
      final key = env['JWT_SECRET'];
      final claims = verifyJwtHS256Signature(token, key!);
      claims.validate(); // valida expiração, etc.

      final userId = claims.subject;
      return handler(context.provide<String>(() => userId!));
    } catch (e) {
      return Response.json(statusCode: 401, body: {'error': 'Token inválido'});
    }
  };
}
