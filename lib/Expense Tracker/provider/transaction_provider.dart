import 'package:flutter/material.dart';
import 'package:provider_learn/Expense%20Tracker/model/transaction.dart';

class TransactionProvider with ChangeNotifier {
  final List<Transaction> _transactions = [];
  List<Transaction> get transaction => _transactions;

  //for calculate totalIncome
  double get totalIncome => _transactions
      .where((tx) => tx.isIncome)
      .fold(0, (sum, tx) => sum + tx.amount);

  //for calculate totalExpenses
  double get totalExpenses => _transactions
      .where((tx) => !tx.isIncome)
      .fold(0, (sum, tx) => sum + tx.amount);

  //For remaining balance
  double get remainingBalance => totalIncome - totalExpenses;

  //method for add new transaction

  void addTransaction(String title, double amount, bool isIncome) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
      isIncome: isIncome,
    );
    _transactions.insert(0, newTransaction);
    notifyListeners();
  }

  //method to remove
  void removeTransaction(String id) {
    _transactions.removeWhere((tx) => tx.id == id);
    notifyListeners();
  }
}
