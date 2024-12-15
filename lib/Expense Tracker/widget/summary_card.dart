import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/Expense%20Tracker/provider/transaction_provider.dart';
import '../provider/transaction_provider.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Monthly Summary",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total income:  \$${transactionProvider.totalIncome.toStringAsFixed(2)}",
                ),
                const SizedBox(height: 10),
              ],
            ),
            Row(
              children: [
                Text(
                  "Total Expence:  \$${transactionProvider.totalExpenses.toStringAsFixed(2)}",
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Remaining balance: \$${transactionProvider.remainingBalance.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
