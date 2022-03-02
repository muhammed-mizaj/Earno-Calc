import 'package:earno_calc/screens/category/CategoryScreen.dart';
import 'package:earno_calc/screens/home/widgets/bottom_nav.dart';

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
      backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(title: Text("Earno Calc"),centerTitle: true,),
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
        child: Icon(Icons.add),
        onPressed: (){
          if(selectedIndexNotifier.value==0)
          {
              print("Add transactions");
          }
          else
          {
            print("add something");

          }
        },
      ),
    );
  }
}

