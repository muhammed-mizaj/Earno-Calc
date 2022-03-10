
import 'package:earno_calc/db/category_db.dart';
import 'package:earno_calc/db/transaction_db.dart';
import 'package:earno_calc/models/categories/category_model.dart';
import 'package:earno_calc/models/transactions/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.RefreshTransactionUI();
    CategoryDB.instance.refreshUI();
    return ValueListenableBuilder(
        valueListenable: TransactionDB.instance.transactionListNotifier,
        builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _){
         return  ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: (ctx,index){
                final _value = newList[index];
                return Slidable(
                  key: Key(_value.Id!),
                  startActionPane: ActionPane(
                    motion:BehindMotion(),
                    children: [
                      SlidableAction(label :"Delete" ,icon:Icons.delete,backgroundColor: Colors.red,onPressed: (ctx){
                                        TransactionDB.instance.deleteTransaction(_value.Id!);
                      })
                    ],

                  ),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(child: Text(parseDate(_value.date)),radius: 50,
                      backgroundColor: _value.type==CategoryType.income? Colors.green[200]:Colors.red[200],
                      ),
                      title: Text('Rs ${_value.amount}'),
                      subtitle: Text(_value.category.name),
                    ),
                  ),
                );
              },
              separatorBuilder:(ctx,index){
                return SizedBox(height: 10);
              }
              , itemCount: newList.length);
        }
    );
    
  }
  String parseDate(DateTime date)
  {
    final _date = DateFormat.MMMd().format(date);
    final _formatedDate = _date.split(' ');
    return '  ${_formatedDate.last}\n${_formatedDate.first}';
  }
}
