// Import necessary packages and files
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';


// Transaction class definition
class Transaction {
  String title;
  double amount;
  DateTime date;

  Transaction({
    required this.title,
    required this.amount,
    required this.date,
  });
}

// TransactionModulePage class definition
class TransactionModulePage extends StatelessWidget {
  // Transaction history data (replace with your data source)
  final List<Transaction> transactions = [
    Transaction(title: 'Transaction 1', amount: 50.0, date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(title: 'Transaction 2', amount: 30.0, date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(title: 'Transaction 3', amount: 25.0, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Module'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Your transaction module content goes here
          // ...

          // Button to navigate to TransactionHistoryPage
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TransactionHistoryPage(transactions)),
              );
            },
            child: Text('View Transaction History'),
          ),
        ],
      ),
    );
  }
}


// Import necessary packages and files


// TransactionHistoryPage class definition
class TransactionHistoryPage extends StatelessWidget {
  // List of transactions to display
  final List<Transaction> transactions;

  // Constructor to receive transactions
  TransactionHistoryPage(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          Transaction transaction = transactions[index];
          return ListTile(
            title: Text(transaction.title),
            subtitle: Text('Amount: \$${transaction.amount.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}