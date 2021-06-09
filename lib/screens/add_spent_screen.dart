import 'package:flutter/material.dart';
import 'package:flutter_budget_ui/data/data.dart';
import 'package:flutter_budget_ui/models/category_model.dart';
import 'package:flutter_budget_ui/models/expense_model.dart';

class AddSpentScreen extends StatefulWidget {
  final List<Expense> list;
  AddSpentScreen({Key key, @required this.list}) : super(key: key);
  @override
  _AddSpentScreenState createState() => _AddSpentScreenState();
}

class _AddSpentScreenState extends State<AddSpentScreen> {
  String name;
  double amount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a spent"),
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
                  autofocus: true,
                  onChanged: (value) => name = value),
              TextField(
                  decoration: InputDecoration(
                    labelText: "Value of spent",
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => amount = double.parse(value)),
              TextButton(
                  onPressed: () {
                    if (name == null ||
                        amount == null ||
                        amount.isNaN ||
                        amount.isNegative) {
                      print("Err");
                    } else {
                      widget.list.add(Expense(name: name, cost: amount));
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Insert"))
            ],
          ),
        ),
      ),
    );
  }
}
