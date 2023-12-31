import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBar({
    Key? key,
    required this.label,
    required this.spendingAmount,
    required this.spendingPctOfTotal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text('\$$spendingAmount')),
        Container(
          clipBehavior: Clip.antiAlias,
          height: 60,
          width: 10,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: spendingPctOfTotal == 0.0
                ? 0.0
                : spendingAmount / spendingPctOfTotal,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
        Text(label),
      ],
    );
  }
}
