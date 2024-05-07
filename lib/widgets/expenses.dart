import 'package:flutter/material.dart';
import 'package:tracker/widgets/expenses_list/expenses_list.dart';
import 'package:tracker/models/expense.dart';
import 'package:tracker/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registredExpenses = [
    Expense(
        title: 'Flutter course',
        amount: 39.9,
        date: DateTime.now(),
        category: Category.work),
        Expense(
        title: 'Networks course',
        amount: 49.9,
        date: DateTime.now(),
        category: Category.leisure),
         Expense(
        title: 'Palestine',
        amount: 100,
        date: DateTime.now(),
        category: Category.travel),
         Expense(
        title: 'Rewsturant',
        amount: 35.5,
        date: DateTime.now(),
        category: Category.food),
  ];

  void _openAddExpenseOverlay(){
    showModalBottomSheet<void>(
      context: context,
      builder: (ctx)=> const NewExpense(),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),)
        ],
      ),
      body: Column(
        children:[
          const Text('The chart'),
          Expanded(child: ExpensesList(expenses:_registredExpenses)),
        ],
      ),
    );
  }
}
