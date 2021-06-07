import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  final List<double> expenses;
  BarChartWidget({Key key, @required this.expenses}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            'Weekly Spending',
            style: TextStyle(
                letterSpacing: 1.2,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.arrow_back), iconSize: 30),
              Text(
                'Nov 10, 2019 - Nov 16, 2019',
                style: TextStyle(
                    letterSpacing: 1.2,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward),
                  iconSize: 30),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BarWidget(
                  label: 'Su',
                  amountSpent: expenses[0],
                  mostExpensive: mostExpensive),
              BarWidget(
                  label: 'Mo',
                  amountSpent: expenses[1],
                  mostExpensive: mostExpensive),
              BarWidget(
                  label: 'Tu',
                  amountSpent: expenses[2],
                  mostExpensive: mostExpensive),
              BarWidget(
                  label: 'We',
                  amountSpent: expenses[3],
                  mostExpensive: mostExpensive),
              BarWidget(
                  label: 'Th',
                  amountSpent: expenses[4],
                  mostExpensive: mostExpensive),
              BarWidget(
                  label: 'Fr',
                  amountSpent: expenses[5],
                  mostExpensive: mostExpensive),
              BarWidget(
                  label: 'Sa',
                  amountSpent: expenses[6],
                  mostExpensive: mostExpensive),
            ],
          )
        ],
      ),
    );
  }
}

class BarWidget extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;

  final double _maxBarHeight = 150;
  BarWidget(
      {Key key,
      @required this.label,
      @required this.amountSpent,
      @required this.mostExpensive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: [
        Text(
          '\$${amountSpent.toStringAsFixed(2)}',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          height: barHeight,
          width: 18,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).primaryColor),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        )
      ],
    );
  }
}
