import 'package:earno_calc/db/transaction_db.dart';
import 'package:earno_calc/screens/home/widgets/total.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Profile_page extends StatefulWidget {
  const Profile_page({Key? key}) : super(key: key);

  @override
  _Profile_pageState createState() => _Profile_pageState();
}

class _Profile_pageState extends State<Profile_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Page"),backgroundColor: Colors.white,foregroundColor: Colors.black,centerTitle: true,),
      body: SafeArea(
          child:Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                CircleAvatar(radius: 100,backgroundImage:
                AssetImage('assets/images/md.jpg'),

                  backgroundColor: Colors.transparent,),
                SizedBox(height: 20,),
                RichText(
                  text: TextSpan(
                    text: 'Hello ,',
                    style: TextStyle(fontSize: 20,color: Colors.black),
                    children: const <TextSpan>[
                      TextSpan(text: 'Muhammed', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black)),

                    ],
                  ),
                ),
                SizedBox(
                  height: 20,

                ),
                Row(children: [
                  Card(
                    elevation: 10,
                    color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Monthly Earnigs",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("Rs 200000"),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.red,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Monthly Expense",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("Rs 130000"),
                        ],
                      ),
                    ),
                  )
                ],)
,                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Card(
                    color: Colors.yellow,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Present Balance",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("Rs 70000"),
                        ],
                      ),
                    ),
                  ),

                ],)


              ],
            ),
          )

      ),
    );
  }
}
