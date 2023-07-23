import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_card.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList(
    this.transactions,
    this.onDelete, {
    super.key,
  });

  final List<Transaction> transactions;
  final Function(int) onDelete;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // controller: ScrollController(),
      padding: const EdgeInsets.only(bottom: 75, left: 10, right: 10),
      itemBuilder: (context, index) => TransactionCard(
          transaction: transactions[index],
          onDelete: () {
            onDelete(index);
          }),
      itemCount: transactions.length,
      shrinkWrap: true,
      // children: transactions.map((transaction) {
      //   return TransactionCard(transaction: transaction);
      // }).toList(),
    );
  }
}
