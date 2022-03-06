import 'package:earno_calc/models/categories/category_model.dart';
import 'package:hive/hive.dart';
const CATEGGORY_DB_NAME = 'category-db-name';
abstract class CategoryDbFunctions
{
  Future <List<Categorymodel>> getCategories();
  Future <void> insertCategory(Categorymodel value);

}
class CategoryDB implements  CategoryDbFunctions
{

  @override
  Future<void> insertCategory(Categorymodel value) async{
    final _categoryDB = await Hive.openBox<Categorymodel>(CATEGGORY_DB_NAME);
    await _categoryDB.add(value);
  }
  @override
  Future<List<Categorymodel>> getCategories()async{
    final _categoryDB = await Hive.openBox<Categorymodel>(CATEGGORY_DB_NAME);
    return _categoryDB.values.toList();
  }
}
