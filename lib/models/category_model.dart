import 'dart:convert';

import 'package:flutter_budget_ui/models/expense_model.dart';

class Category {
  final String name;
  final double maxAmount;
  final List<Expense> expenses;

  Category({this.name, this.maxAmount, this.expenses});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'maxAmount': maxAmount,
      'expenses': expenses?.map((x) => x.toMap())?.toList(),
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'],
      maxAmount: map['maxAmount'],
      expenses:
          List<Expense>.from(map['expenses']?.map((x) => Expense.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));
}
