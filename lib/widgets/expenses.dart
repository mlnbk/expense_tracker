import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Todo',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.other),
    Expense(
        title: 'Todo 1',
        amount: 29.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Todo 2',
        amount: 39.99,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'Todo 3',
        amount: 9.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Todo 4',
        amount: 49.99,
        date: DateTime.now(),
        category: Category.other),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
