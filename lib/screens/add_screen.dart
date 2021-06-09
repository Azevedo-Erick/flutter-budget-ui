import 'package:flutter/material.dart';
import 'package:flutter_budget_ui/data/data.dart';
import 'package:flutter_budget_ui/models/category_model.dart';
import 'package:flutter_budget_ui/models/expense_model.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String name;
  double maxAmount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a category"),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                  decoration: InputDecoration(labelText: "Spent name"),
                  onChanged: (value) => name = value),
              TextField(
                  decoration: InputDecoration(
                    labelText: "Max Value to spent",
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => maxAmount = double.parse(value)),
              TextButton(
                  onPressed: () {
                    categories.add(Category(
                        name: name,
                        maxAmount: maxAmount,
                        expenses: [Expense(name: "Void", cost: 0)]));
                    Navigator.pop(context);
                  },
                  child: Text("Insert"))
            ],
          ),
        ),
      ),
    );
  }
}
