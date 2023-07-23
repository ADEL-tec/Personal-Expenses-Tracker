import 'package:flutter/material.dart';
import 'package:flutter_app_2_preview/models/transaction.dart';
import 'package:flutter_app_2_preview/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart(this.recentTransactions, {super.key});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: 6 - index));
      var totalSum = 0.0;
      for (var transaction in recentTransactions) {
        if (transaction.date.day == weekDay.day &&
            transaction.date.month == weekDay.month &&
            transaction.date.year == weekDay.year) {
          totalSum += transaction.amount;
        }
      }
      print(totalSum);
      print(DateFormat.E().format(weekDay));
      return {
        'amount': totalSum.toStringAsFixed(2),
        'day': DateFormat.E().format(weekDay).substring(0, 1),
      };
    });
  }

  double get totalSum {
    return groupedTransactionValues.fold(
        0.0,
        (previousValue, element) =>
            previousValue + double.parse(element['amount'].toString()));
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: groupedTransactionValues
                .map((tx) => Flexible(
                      fit: FlexFit.tight,
                      child: ChartBar(
                          label: tx['day'].toString(),
                          spendingAmount: double.parse(tx['amount'].toString()),
                          spendingPctOfTotal: totalSum),
                    ))
                .toList()),
      ),
    );
  }
}
