import 'package:jaguar_jwt/jaguar_jwt.dart';

import 'utils/env.dart';

String generateJwt(String userId) {
  final key = env['JWT_SECRET'];
  final claimSet = JwtClaim(
    subject: userId,
    issuer: 'auth_backend',
    expiry: DateTime.now().add(const Duration(hours: 1)),
    issuedAt: DateTime.now(),
    notBefore: DateTime.now(),
  );

  return issueJwtHS256(claimSet, key!);
}
