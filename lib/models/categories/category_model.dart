import 'package:hive_flutter/adapters.dart';
part 'category_model.g.dart';
@HiveType(typeId: 2)
enum CategoryType
{
  @HiveField(0)
  income,
  @HiveField(1)
  expense
}
@HiveType(typeId: 1)
class Categorymodel
{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final bool isDeleted;
  @HiveField(3)
  final CategoryType type;
  Categorymodel({ required this.name, this.isDeleted=false,required this.type,required this.id});

  @override
  String toString() {
    return '{$name $type}';
  }
}