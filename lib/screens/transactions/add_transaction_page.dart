import 'package:earno_calc/db/category_db.dart';
import 'package:earno_calc/db/transaction_db.dart';
import 'package:earno_calc/models/categories/category_model.dart';
import 'package:earno_calc/models/transactions/transaction_model.dart';
import 'package:flutter/material.dart';
class Add_Transaction extends StatefulWidget {
  static const routeName = 'add-transaction';
  const Add_Transaction({Key? key}) : super(key: key);

  @override
  State<Add_Transaction> createState() => _Add_TransactionState();
}

class _Add_TransactionState extends State<Add_Transaction> {
  DateTime? _selectedDate;
  CategoryType? _selectedCategorytype;
  Categorymodel? _selectedCategorymodel;
  String? _categoryId;
  final _purposeTexteditingcontroller = TextEditingController();
  final _amountTexteditingcontroller = TextEditingController();
  @override
  void initState() {
    _selectedCategorytype = CategoryType.income;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
        children:[
          TextFormField(
            controller: _purposeTexteditingcontroller,
            decoration: InputDecoration(
              hintText: "Purpose"
            ),
          ),
          TextFormField(
            controller: _amountTexteditingcontroller,
            decoration: InputDecoration(
              hintText: 'Amount',
            ),
            keyboardType: TextInputType.number,
          ),

          TextButton.icon(onPressed: ()async {
          final _selectedDatetemp = await showDatePicker(context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(Duration(days: 30)),
                lastDate: DateTime.now());
          if(_selectedDatetemp == null)
            {
              return;
            }
          else
            {
              setState(() {
                _selectedDate=_selectedDatetemp;
              });

            }
          },
              icon:Icon(Icons.calendar_today),
            label: Text(_selectedDate==null?("Select date"):(_selectedDate.toString())),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children:[
                  Radio(
                      value: CategoryType.income,
                      groupValue: _selectedCategorytype,
                      onChanged: (newvalue){
                            setState(() {
                              _selectedCategorytype=CategoryType.income;
                              _categoryId=null;
                            });
                      }),
                  Text("income")
                ] ,
              ),
              Row(
                children:[
                  Radio(
                      value: CategoryType.expense,
                      groupValue: _selectedCategorytype,
                      onChanged: (newvalue){
                        setState(() {
                            _selectedCategorytype = CategoryType.expense;
                            _categoryId=null;

                        });
                      }),
                  Text("Expense")
                ] ,
              ),
            ],
          ),
          DropdownButton(
            value: _categoryId,
            hint:const Text("Select category"),

              items:
              (_selectedCategorytype==CategoryType.income? (CategoryDB.instance.incomeCategoryListListener):(CategoryDB.instance.expenseCategoryListListener)).value.map(
                      (e) {
                        return DropdownMenuItem(
                            child: Text(e.name),
                            value: e.id,
                          onTap: (){
                              _selectedCategorymodel=e;
                          },
                        );
              }) .toList(),
            onChanged: (selectedValue){
                setState(() {
                  _categoryId=selectedValue.toString();
                });
            },
          ),
          ElevatedButton.icon(onPressed: (){
                    addTransaction();
          }, icon: Icon(Icons.add), label: Text("Add Transaction"))
          ]
    ),
     )
      )
    );
  }
  Future<void> addTransaction() async{
   final _purpose_text=_purposeTexteditingcontroller.text;
   final _amount_text=_amountTexteditingcontroller.text;
   if(_purpose_text.isEmpty)
     {
       return;
     }
   if(_amount_text.isEmpty)
   {
     return;
   }
   if(_categoryId==null)
   {
     return;
   }
   if(_selectedDate==null)
     {
       return;
     }
   final _parsedAmount = double.tryParse(_amount_text);
   if(_parsedAmount==null)
     {
       return;
     }
   if(_selectedCategorymodel==null)
     {
       return;
     }
   final _model = TransactionModel(
       Purpose: _purpose_text,
       amount: _parsedAmount,
       date: _selectedDate!,
       type: _selectedCategorytype!,
       category: _selectedCategorymodel!
   );
  await TransactionDB.instance.addTransaction(_model);
  Navigator.of(context).pop();
  TransactionDB.instance.RefreshTransactionUI();
  }
}
