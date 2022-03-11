import 'package:earno_calc/db/transaction_db.dart';
import 'package:flutter/material.dart';

class Total extends StatelessWidget {
  const Total({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Text('${TransactionDB.instance.getAllIncomeTransaction()}')
        ],
      ),
    );
  }
}
