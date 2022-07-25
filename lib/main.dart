import 'package:flutter/material.dart';
import 'package:trial/new_transaction.dart';
import 'chart.dart';
import 'models/transaction.dart';
import 'transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        errorColor: Colors.red,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: 'QuickSand',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          button: TextStyle(color: Colors.white),
        ),

      ),

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

    final List<Transaction> _userTransaction = [
      // Transaction(
      //     id: "t1",
      //     title: "New socks",
      //     amount: 748.84,
      //     date: DateTime.now()
      // ),
      // Transaction(
      //     id: "t2",
      //     title: "New kicks",
      //     amount: 8.84,
      //     date: DateTime.now()
      // ),
    ];


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            title: Text('Flutter Demo'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context),
              ),
            ]
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Chart(_recentTransactions),
                TransactionList(_userTransaction, _deleteTransaction),

              ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation
            .centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
      );
    }

    List <Transaction> get _recentTransactions {
      return _userTransaction.where((tx) {
        return tx.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      }).toList();
    }
    void _addNewTransaction(String title, double amount, DateTime chosenDate) {
      final newTx = Transaction(
        title: title,
        amount: amount,
        date: chosenDate,
        id: DateTime.now().toString(),
      );

      setState(() {
        _userTransaction.add(newTx);
      });
    }
    
    
      void _deleteTransaction(String id){
      setState(() {
        _userTransaction.removeWhere((tx) {
          return tx.id == id;
        });
      });
      }
      void _startAddNewTransaction(BuildContext ctx) {
        showModalBottomSheet(context: ctx, builder: (_) {
          return NewTransaction(_addNewTransaction);

        },);
      }

  }
      
