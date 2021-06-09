import 'dart:convert';

class Expense {
  final String name;
  final double cost;

  Expense({this.name, this.cost});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cost': cost,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      name: map['name'],
      cost: map['cost'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Expense.fromJson(String source) =>
      Expense.fromMap(json.decode(source));
}
