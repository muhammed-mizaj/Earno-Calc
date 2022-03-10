import 'package:earno_calc/db/category_db.dart';
import 'package:earno_calc/models/categories/category_model.dart';
import 'package:earno_calc/screens/category/CategoryScreen.dart';
import 'package:earno_calc/screens/category/add_popup.dart';
import 'package:earno_calc/screens/home/widgets/bottom_nav.dart';
import 'package:earno_calc/screens/transactions/add_transaction_page.dart';

import 'package:earno_calc/screens/transactions/transactions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final _pages = const [
    CategoryScreen(),
    TransactionPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
        appBar: AppBar(title: Text("Earno Calc"),centerTitle: true,backgroundColor: Colors.grey[900],),
        bottomNavigationBar: const Bottomnavwid(),
        body:SafeArea(
          child: ValueListenableBuilder(
            valueListenable: selectedIndexNotifier,
            builder: (BuildContext context,int updatedIndex, _){
              return _pages[updatedIndex];
            },
          ),
        ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.lightGreen,
        backgroundColor: Colors.blue[900],
        child: Icon(Icons.add),
        onPressed: (){
          if(selectedIndexNotifier.value==1)
          {
              print("Add transactions");
              Navigator.of(context).pushNamed(Add_Transaction.routeName);
          }
          else
          {
            print("add something");
            CategoryAddPopup(context);
            // final _sample = Categorymodel(
            //   id:DateTime.now().millisecondsSinceEpoch.toString(),
            //   name:"Food",
            //   type: CategoryType.expense
            //
            // );
            // CategoryDB().insertCategory(_sample);

          }
        },
      ),
    );
  }
}

