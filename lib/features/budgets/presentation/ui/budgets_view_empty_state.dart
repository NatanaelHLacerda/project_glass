import 'package:flutter/material.dart';

class BudgetsViewEmptyState extends StatefulWidget {
  const BudgetsViewEmptyState({super.key});

  @override
  State<BudgetsViewEmptyState> createState() => _BudgetsViewEmptyStateState();
}

class _BudgetsViewEmptyStateState extends State<BudgetsViewEmptyState> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Lista vazia'),
      ),
    );
  }
}
