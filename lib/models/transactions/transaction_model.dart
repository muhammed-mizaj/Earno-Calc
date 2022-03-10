import 'package:earno_calc/models/categories/category_model.dart';
import 'package:hive_flutter/adapters.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 3)
class TransactionModel
{
  @HiveField(0)
  final String Purpose;
  @HiveField(1)
  final double? amount;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final CategoryType type;
  @HiveField(4)
  final Categorymodel category;
  @HiveField(5)
  String? Id;
  TransactionModel(
  {required this.Purpose, required this.amount,required this.date,required this.type,required this.category}){
    Id=DateTime.now().microsecondsSinceEpoch.toString();
  }
}
