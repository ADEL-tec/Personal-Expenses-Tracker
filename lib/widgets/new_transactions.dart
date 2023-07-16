import 'package:flutter/material.dart';

class NewTransactions extends StatefulWidget {
  const NewTransactions(
    this.add, {
    super.key,
  });

  final Function(String, double) add;

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(BuildContext context) {
    final title = titleController.text;

    if (title.isEmpty || amountController.text.isEmpty) return;

    final amount = double.parse(amountController.text);

    if (amount <= 0) return;

    widget.add(title, amount);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
                labelText: "Title", hintText: "enter a title"),
          ),
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                labelText: "Amount", hintText: "enter an amount"),
            onSubmitted: (_) => submitData(context),
          ),
          FilledButton(
              onPressed: () {
                submitData(context);
              },
              child: const Text("Add"))
        ]),
      ),
    );
  }
}
