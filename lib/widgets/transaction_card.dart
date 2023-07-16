import 'package:flutter/material.dart';
import 'package:flutter_app_2_preview/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Text(
                transaction.amount.toStringAsFixed(2),
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          DateFormat("yyyy/MM/dd").format(transaction.date),
          style: const TextStyle(color: Colors.red),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {},
        ),
      ),
    );

    // Card(
    //   color: Colors.white,
    //   child: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Row(
    //       children: [
    //         Container(
    //           padding: const EdgeInsets.all(5.0),
    //           margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    //           decoration: BoxDecoration(
    //               border: Border.all(
    //             color: Colors.red,
    //             width: 2,
    //           )),
    //           child: Text(
    //             transaction.amount.toStringAsFixed(2),
    //           ),
    //         ),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               transaction.title,
    //               style: const TextStyle(
    //                   fontSize: 16, fontWeight: FontWeight.bold),
    //             ),
    //             Text(
    //               DateFormat("yyyy/MM/dd").format(transaction.date),
    //               style: const TextStyle(color: Colors.red),
    //             ),
    //           ],
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
