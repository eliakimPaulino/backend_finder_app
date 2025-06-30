// ignore_for_file: lines_longer_than_80_chars

import 'package:jaguar_jwt/jaguar_jwt.dart';

import 'package:my_project/auth/utils/env.dart';

String generateJwt(String userId) {
  final key = env['JWT_SECRET'];
  final claimSet = JwtClaim(
    subject: userId, // o ID do usuário
    issuer: 'auth_backend',// o emissor do token
    expiry: DateTime.now().add(const Duration(hours: 1)), // validade do token
    issuedAt: DateTime.now(),
    notBefore: DateTime.now(),
  );

  return issueJwtHS256(claimSet, key!); // Usa o jaguar_jwt para assinar esse token com a chave JWT_SECRET (do .env).
}
