import 'package:flutter/material.dart';
import 'package:provider_learn/Expense%20Tracker/widget/add_transaction.dart';
import 'package:provider_learn/Expense%20Tracker/widget/summary_card.dart';
import 'package:provider_learn/Expense%20Tracker/widget/transaction_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
      ),
      body: const Column(
        children: [
          SummaryCard(),
          Expanded(
            child: TransactionList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => const AddTransaction(),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
