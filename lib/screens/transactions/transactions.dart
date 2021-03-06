
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
    // final double Income = TransactionDB.instance.getAllExpenseTransaction() as double;

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
                    color:Color.fromRGBO(180, 248, 255, 0.7),
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(child: Text(parseDate(_value.date),style: TextStyle(fontWeight: FontWeight.bold),),foregroundColor: Colors.black,radius: 25,
                      backgroundColor: _value.type==CategoryType.income? Colors.green[700]:Colors.red[700],
                      ),
                      title: Text('Rs ${_value.amount}'),
                      subtitle: Text(_value.category.name+" : "+_value.Purpose),
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
