

import 'package:flutter/material.dart';

import 'models/transaction.dart';

class TransactionList extends StatelessWidget {
   final List<Transaction> transactions;
   final Function deleteTx;

   TransactionList(this.transactions, this.deleteTx);

  
  @override
  Widget build(BuildContext context) {
    return   Container(
              height: 400,
                child: transactions.isEmpty ? Column(children: <Widget>[
                  Text(
                    "No transactions added yet!",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                  height: 10,
                  ),
                  Container(
                  height: 300,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,)
                       ),
                ],
                )
                    : ListView(

                  children: transactions.map((tx) {
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 59,
                            horizontal: 54,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple),

                          ),
                          child: Text(
                            '\$${tx.amount.toStringAsFixed(2)}',
                            style:
                            TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  tx.title,
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    tx.date.toString(),
                                    style: TextStyle(color: Colors.grey)),

                              ],
                            ),
                            IconButton(icon: Icon(Icons.delete),
                              color: Theme.of(context).errorColor,
                              onPressed: () => deleteTx(tx.id),
                            ),
                          ]
                        )

                      ],

                    ),
                  );
                }).toList(),

                )
              );
  }
}
