import 'package:flutter/material.dart';
class ExpenseCategory extends StatefulWidget {
  const ExpenseCategory({Key? key}) : super(key: key);

  @override
  _ExpenseCategoryState createState() => _ExpenseCategoryState();
}

class _ExpenseCategoryState extends State<ExpenseCategory> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.all(5),
        itemBuilder: (ctx, index) {
          return Card(

            child: ListTile(
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete),)
              , title: Text("Salary"),

            ),
          );
        },
        separatorBuilder: (ctx, index) {
          return SizedBox(height: 10);
        },
        itemCount: 10);
  }
}
