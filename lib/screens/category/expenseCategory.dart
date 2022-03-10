import 'package:earno_calc/db/category_db.dart';
import 'package:earno_calc/models/categories/category_model.dart';
import 'package:flutter/material.dart';
class ExpenseCategory extends StatefulWidget {
  const ExpenseCategory({Key? key}) : super(key: key);

  @override
  _ExpenseCategoryState createState() => _ExpenseCategoryState();
}

class _ExpenseCategoryState extends State<ExpenseCategory> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: CategoryDB().expenseCategoryListListener,
        builder: (BuildContext ctx,List<Categorymodel> newList,Widget? _){
      return ListView.separated(
          padding: EdgeInsets.all(5),
          itemBuilder: (ctx, index) {
            final category = newList[index];
            return Card(
              color: Colors.blueAccent,

              child: ListTile(
                leading: Icon(Icons.wrong_location_outlined,color: Colors.red),
                trailing: IconButton(onPressed: () {
                  CategoryDB.instance.deleteCategory(category.id);
                }, icon: Icon(Icons.delete),)
                , title: Text(category.name),

              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return SizedBox(height: 10);
          },
          itemCount: newList.length);
    });
  }
}
