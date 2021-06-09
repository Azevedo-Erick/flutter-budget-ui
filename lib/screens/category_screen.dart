import 'package:flutter/material.dart';
import 'package:flutter_budget_ui/helpers/color_helper.dart';
import 'package:flutter_budget_ui/models/category_model.dart';
import 'package:flutter_budget_ui/models/expense_model.dart';
import 'package:flutter_budget_ui/widgets/radial_painter_widget.dart';

import 'add_spent_screen.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;
  CategoryScreen({Key key, @required this.category}) : super(key: key);
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  _buildExpenses() {
    List<Widget> expenseList = [];
    widget.category.expenses.forEach((Expense expense) {
      expenseList.add(Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 2), blurRadius: 6.0)
            ]),
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                expense.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.,
                  children: [
                    Text(
                      '-\$${expense.cost.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.red),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            // print(widget.category.expenses.indexOf(expense));
                            widget.category.expenses.remove(expense);
                          });
                        },
                        child: Icon(Icons.delete)),
                  ],
                ),
              )
            ],
          ),
        ),
      ));
    });
    return Column(children: expenseList);
  }

  @override
  Widget build(BuildContext context) {
    double totalAmountSpent = 0;
    widget.category.expenses.forEach((Expense expense) {
      totalAmountSpent += expense.cost;
    });

    final double amountLeft = widget.category.maxAmount - totalAmountSpent;
    final double percent = amountLeft / widget.category.maxAmount;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name, style: TextStyle()),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => AddSpentScreen(
                            list: widget.category.expenses,
                          )));
            },
            icon: Icon(Icons.add),
            iconSize: 30,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, offset: Offset(0, 2), blurRadius: 6)
              ],
            ),
            child: CustomPaint(
              foregroundPainter: RadialPainterWidget(
                  backgroundColor: Colors.grey[200],
                  lineColor: getColor(context, percent),
                  percent: percent,
                  width: 15),
              child: Center(
                child: Text(
                  '\$${(amountLeft).toStringAsFixed(2)}/\$${(widget.category.maxAmount).toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          _buildExpenses(),
        ]),
      ),
    );
  }
}
