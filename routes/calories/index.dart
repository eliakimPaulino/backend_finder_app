
import 'package:dart_frog/dart_frog.dart';
 
Response onRequest(RequestContext context) {
 return Response.json(
   body: {'fats': '46', 'carbohydrates': '133', 'protein': '159'},
 );
}

// This code defines a Dart Frog route that responds to HTTP requests with a JSON object