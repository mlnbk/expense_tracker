import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onDismiss,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onDismiss;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onDismiss(expenses[index]);
        },
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.8),
        ),
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
