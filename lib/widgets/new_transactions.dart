import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  const NewTransactions(
    this.add, {
    super.key,
  });

  final Function(String, double, DateTime) add;

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData(BuildContext context) {
    final title = _titleController.text;

    if (title.isEmpty ||
        _amountController.text.isEmpty ||
        _selectedDate == null) return;

    final amount = double.parse(_amountController.text);

    if (amount <= 0) return;

    widget.add(title, amount, _selectedDate!);

    Navigator.pop(context);
  }

  Future<void> _presentDatePicker() async {
    await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(
              labelText: "Title", hintText: "enter a title"),
        ),
        TextField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              labelText: "Amount", hintText: "enter an amount"),
          onSubmitted: (_) => _submitData(context),
        ),
        SizedBox(
          height: 70,
          child: Row(
            children: [
              Text(_selectedDate == null
                  ? 'No Date Chosen!'
                  : DateFormat.yMd().format(_selectedDate!)),
              TextButton(
                  onPressed: () {
                    _presentDatePicker();
                  },
                  child: const Text('Chose date')),
            ],
          ),
        ),
        FilledButton(
            onPressed: () {
              _submitData(context);
            },
            child: const Text("Add"))
      ]),
    );
  }
}
