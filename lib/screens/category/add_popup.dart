import 'package:earno_calc/db/category_db.dart';
import 'package:earno_calc/models/categories/category_model.dart';
import 'package:flutter/material.dart';
ValueNotifier<CategoryType> selectedCategoryNotifier = ValueNotifier(CategoryType.income);
Future <void> CategoryAddPopup(BuildContext context) async{
  final _nameController = TextEditingController();
  showDialog(context: context,
      builder:(ctx){
        return SimpleDialog(

          title: const Text("Add Category"),
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  RadioButton(
                    title: "Income",
                    type: CategoryType.income,
                  ),
                  RadioButton(
                    title: "Expense",
                    type: CategoryType.expense,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Category Name',
                  border: OutlineInputBorder(
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(onPressed: (){
                final _name = _nameController.text;
                if(_name.isEmpty)
                  {
                    return;
                  }
                final _type= selectedCategoryNotifier.value;
                final _category = Categorymodel(name: _name, type: _type, id: DateTime.now().microsecondsSinceEpoch.toString(),
                );
                CategoryDB.instance.insertCategory(_category);
                Navigator.of(ctx).pop();

              }, child: Text("Add")),
            )
          ],
        );
      }
  );
}
class RadioButton extends StatelessWidget {

  final String title;
  final CategoryType type;
  // final CategoryType selectedCategorytype;
  const RadioButton({Key? key, required this.title, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(valueListenable: selectedCategoryNotifier,
            builder: (BuildContext ctx,CategoryType newCatgory,Widget? _){
              return Radio<CategoryType>(
                  value: type,
                  groupValue: selectedCategoryNotifier.value,
                  onChanged: (value){
                    if(value==null)
                      return;
                    selectedCategoryNotifier.value= value;
                    selectedCategoryNotifier.notifyListeners();
                  });

            }
    ),
        Text(title)
      ],
    );
  }
}
