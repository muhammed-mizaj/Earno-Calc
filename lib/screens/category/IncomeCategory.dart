import 'package:flutter/material.dart';
import 'package:earno_calc/db/category_db.dart';
import 'package:earno_calc/models/categories/category_model.dart';

class Income_Category extends StatefulWidget {
  const Income_Category({Key? key}) : super(key: key);

  @override
  _Income_CategoryState createState() => _Income_CategoryState();
}

class _Income_CategoryState extends State<Income_Category> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: CategoryDB().incomeCategoryListListener,
        builder: (BuildContext ctx,List<Categorymodel> newList,Widget? _){
          return ListView.separated(
              padding: EdgeInsets.all(5),
              itemBuilder: (ctx, index) {
                final category = newList[index];
                return Card(
                  elevation: 25,
                  color: Color.fromRGBO(200, 248, 255, 0.7),

                  child: ListTile(
                    leading: Icon(Icons.games_sharp,color: Colors.green[700]),
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
