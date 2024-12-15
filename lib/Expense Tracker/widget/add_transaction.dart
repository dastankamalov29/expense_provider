import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/Expense%20Tracker/provider/transaction_provider.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  bool _isIncome = true;

  void submitData() {
    final title = _titleController.text;
    final amount = double.tryParse(_amountController.text) ?? 0;

    if (title.isEmpty || amount <= 0) {
      return;
    }
    Provider.of<TransactionProvider>(context, listen: false)
        .addTransaction(title, amount, _isIncome);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            maxLength: 10,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp('[a-zA-Zа-яА-ЯёЁ]'),
              ), // Только буквы (русские и латинские)
            ],
            controller: _titleController,
            decoration: const InputDecoration(labelText: "Title"),
          ),
          TextField(
            maxLength: 10,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly, // Только цифры
            ],
            controller: _amountController,
            decoration: const InputDecoration(labelText: "Sum"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Income",
                style: TextStyle(
                    color: _isIncome == true ? Colors.green : Colors.black),
              ),
              Switch(
                value: _isIncome,
                onChanged: (val) {
                  setState(() {
                    _isIncome = val;
                  });
                },
              ),
              Text(
                "Expense",
                style: TextStyle(
                    color: _isIncome == false ? Colors.red : Colors.black),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: submitData,
            child: const Text("Transaction"),
          ),
        ],
      ),
    );
  }
}