import 'dart:math';

import 'package:earno_calc/models/categories/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
const CATEGGORY_DB_NAME = 'category-db-name';
abstract class CategoryDbFunctions
{
  Future <List<Categorymodel>> getCategories();
  Future <void> insertCategory(Categorymodel value);
  Future <void> deleteCategory(String CategoryID);

}
class CategoryDB implements  CategoryDbFunctions
{
  CategoryDB._internal();
  static CategoryDB instance = CategoryDB._internal();
  factory CategoryDB()
  {
    return instance;
  }
  ValueNotifier<List<Categorymodel>> incomeCategoryListListener = ValueNotifier([]);
  ValueNotifier<List<Categorymodel>> expenseCategoryListListener = ValueNotifier([]);
  @override
  Future<void> insertCategory(Categorymodel value) async{
    final _categoryDB = await Hive.openBox<Categorymodel>(CATEGGORY_DB_NAME);
    await _categoryDB.put(value.id,value);
    refreshUI();
  }
  @override
  Future<List<Categorymodel>> getCategories()async{
    final _categoryDB = await Hive.openBox<Categorymodel>(CATEGGORY_DB_NAME);
    return _categoryDB.values.toList();
  }
  Future <void> refreshUI() async{
    incomeCategoryListListener.value.clear();
    expenseCategoryListListener.value.clear();
    final _all_categories = await getCategories();
    await Future.forEach(
      _all_categories,(
    Categorymodel category){
        if(category.type==CategoryType.income)
          incomeCategoryListListener.value.add(category);
        else
          expenseCategoryListListener.value.add(category);
    }
    );
    incomeCategoryListListener.notifyListeners();
    expenseCategoryListListener.notifyListeners();
  }

  @override
  Future<void> deleteCategory(String CategoryID) async{
    final _CategoryDB = await Hive.openBox<Categorymodel>(CATEGGORY_DB_NAME);
    await _CategoryDB.delete(CategoryID);
    refreshUI();
  }
}
