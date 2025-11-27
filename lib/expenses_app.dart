import 'package:expense_tracker1/widgets/expenses_list.dart';
import 'models/expense.dart';
import 'package:flutter/material.dart';
import 'widgets/new_expense.dart';

class ExpensesApp extends StatefulWidget {
  const ExpensesApp({super.key});

  @override
  State<ExpensesApp> createState() => _ExpensesAppState();
}

class _ExpensesAppState extends State<ExpensesApp> {
  final List<Expense> _registeredExpensesList = [
    Expense(
      title: 'burger',
      amount: 5,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'laptop',
      amount: 750.0,
      date: DateTime(2023, 2, 3),
      category: Category.work,
    ),

    Expense(
      title: 'bags',
      amount: 4,
      date: DateTime.now(),
      category: Category.travel,
    ),

    Expense(
      title: 'tennis',
      amount: 2,
      date: DateTime(2025, 11, 19),
      category: Category.leisure,
    ),
  ];

  // ignore: unused_element
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add)),
        ],
      ),
      body: ExpensesList(expensesList: _registeredExpensesList),
    );
  }
}
