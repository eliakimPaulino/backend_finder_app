import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';

import '../../models/food_item.dart';

Response onRequest(RequestContext context) {
  final request = context.request;
  final params = request.uri.queryParameters;

  if (params.isNotEmpty && request.method == HttpMethod.get) {
    final category = params['category'];
    final categoryBasedFoodList = <FoodItem>[];

    for (final foodItem in mealsOfTheDay) {
      if (foodItem.category == category) {
        categoryBasedFoodList.add(foodItem);
      }
    }
    return Response(
        body:
            jsonEncode(categoryBasedFoodList.map((e) => e.toJson()).toList()));
  }
  return Response(body: jsonEncode(mealsOfTheDay.map((e) => e.toJson()).toList()));
}
