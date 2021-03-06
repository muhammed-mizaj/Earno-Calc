import 'package:earno_calc/Mainscreen.dart';
import 'package:flutter/material.dart';
class Bottomnavwid extends StatelessWidget {
  const Bottomnavwid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: MainScreen.selectedIndexNotifier,
      builder: (BuildContext ctx ,int updatedIndex,Widget? _){

        return BottomNavigationBar(
          elevation: 15,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.blueGrey,
          currentIndex: updatedIndex,
          onTap:(newIndex)
          {
            MainScreen.selectedIndexNotifier.value = newIndex;
          },

          items:const [
            BottomNavigationBarItem(icon: Icon(Icons.money),
                label: "Transactions"
            ),
            BottomNavigationBarItem(icon: Icon(Icons.category_rounded),
                label: "Categories"),

          ],);
      },

    );;
  }
}
