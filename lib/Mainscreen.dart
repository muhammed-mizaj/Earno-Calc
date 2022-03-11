import 'package:earno_calc/db/category_db.dart';
import 'package:earno_calc/models/categories/category_model.dart';
import 'package:earno_calc/screens/Profile.dart';
import 'package:earno_calc/screens/authentication/Login.dart';
import 'package:earno_calc/screens/authentication/Signup.dart';
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
    TransactionPage(),
    CategoryScreen()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
             DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(180, 248, 255, 0.7),
              ),
              child: Column(
                children: [

                  CircleAvatar(radius: 50,backgroundImage:
                  AssetImage('assets/images/user.png'),

                    backgroundColor: Colors.transparent,),
                  Text('Guest user',style: TextStyle(color: Colors.black)),
                ]
      ),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile_page()),
                );

              },
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: const Text('Categories'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryScreen()),
                );
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
                leading: Icon(Icons.money),
              title: const Text('Transactions'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TransactionPage()),
                );
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.login_rounded),
              title: const Text('Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.app_registration_rounded),
              selectedTileColor: Colors.black12,
              title: const Text('Signup'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              },
            ),
          ],
        ),
      )
      ,
      backgroundColor: Colors.white,
        appBar: AppBar(title: Text("Earno Calc",style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w900),),centerTitle: true,backgroundColor: Colors.white,foregroundColor: Colors.black,
        elevation: 1,),
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
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 20,
        child: Icon(Icons.add),
        onPressed: (){
          if(selectedIndexNotifier.value==0)
          {

              Navigator.of(context).pushNamed(Add_Transaction.routeName);
          }
          else
          {

            CategoryAddPopup(context);

          }
        },
      ),
    );
  }
}

