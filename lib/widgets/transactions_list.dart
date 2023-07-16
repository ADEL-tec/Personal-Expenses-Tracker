import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_card.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList(
    this.transactions, {
    super.key,
  });

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemBuilder: (context, index) =>
            TransactionCard(transaction: transactions[index]),
        itemCount: transactions.length,
        shrinkWrap: true,
        // children: transactions.map((transaction) {
        //   return TransactionCard(transaction: transaction);
        // }).toList(),
      ),
    );
  }
}
