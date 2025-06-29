// Food items object with a constructor
// ignore_for_file: sort_constructors_first

class FoodItem {
  
  FoodItem({
    required this.id,
    required this.name,
    required this.calories,
    required this.category,
  });

  final String id;
  final String name;
  final int calories;
  final String category;

  FoodItem.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        id = json['id'] as String,
        category = json['category'] as String,
        calories = json['calories'] as int;

  // this method is required to send data across as JSON
  // it just converts the object to a map
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'calories': calories,
        'category': category,
      };
}

final pizza = FoodItem(
 id: '1',
 name: 'Pizza',
 calories: 450,
 category: 'Fast Food',
);
final chickenRoast = FoodItem(
 id: '2',
 name: 'Chicken Roast',
 calories: 140,
 category: 'Healthy',
);

final donut = FoodItem(
 id: '3',
 name: 'Donut',
 calories: 340,
 category: 'Dessert',
);
final icecream = FoodItem(
 id: '4',
 name: 'Ice Cream',
 calories: 240,
 category: 'Dessert',
);

// List of meals for the day
// This is a list of FoodItems
List<FoodItem> mealsOfTheDay = [
 pizza,
 chickenRoast,
 donut,
 icecream,
];
