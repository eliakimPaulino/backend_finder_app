import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final userId = context.read<String>(); // userId injetado pelo middleware
  return Response.json(body: {
    'message': 'Acesso autorizado',
    'userId': userId,
  });
}
