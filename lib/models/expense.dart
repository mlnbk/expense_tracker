import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

enum Category { food, travel, leisure, work, other }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
  Category.other: Icons.category,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = const Uuid().v4(); // initializer list

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  get categoryIcon {
    return categoryIcons[category];
  }

  get formattedDate {
    return DateFormat.yMd().format(date);
  }
}

class ExpenseSummary {
  const ExpenseSummary({
    required this.category,
    required this.expenses,
  });

  // custom alternative constructor
  ExpenseSummary.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
