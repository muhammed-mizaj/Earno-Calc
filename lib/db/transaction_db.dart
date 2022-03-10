import 'package:earno_calc/models/transactions/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

const TRANSACTION_DB_NAME = 'transaction-db';
abstract class TransactionDBFunctions
{
  Future<void> addTransaction(TransactionModel obj);
  Future<void> RefreshTransactionUI();
  Future<void> deleteTransaction(String Id);
  Future<List<TransactionModel>>getAllTransaction();
}
class TransactionDB implements TransactionDBFunctions
{
  TransactionDB._internal();
  static TransactionDB instance = TransactionDB._internal();
  factory TransactionDB()
  {
    return instance;
  }
  ValueNotifier <List<TransactionModel>> transactionListNotifier= ValueNotifier([]);
  @override
  Future<void> addTransaction(TransactionModel obj)
  async{
    final _db= await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await _db.put(obj.Id,obj);

  }
  Future<void> RefreshTransactionUI ()async
  {
      final _list = await getAllTransaction();
      _list.sort((first,second)=>second.date.compareTo(first.date));
      transactionListNotifier.value.clear();
      transactionListNotifier.value.addAll(_list);
      transactionListNotifier.notifyListeners();
  }

  @override
  Future<List<TransactionModel>> getAllTransaction() async{
    final _db =await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    return _db.values.toList();
  }

  @override
  Future<void> deleteTransaction(String Id) async{
    final _db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await _db.delete(Id);
    RefreshTransactionUI();

  }
}