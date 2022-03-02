
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
        itemBuilder: (ctx,index){
          return const Card(
            child: ListTile(
              leading: CircleAvatar(child: Text('12 \n dec',textAlign: TextAlign.center,),radius: 50,),
              title: Text("100000"),
              subtitle: Text("Travel"),
            ),
          );
        },
        separatorBuilder:(ctx,index){
          return SizedBox(height: 10);
        }
        , itemCount: 10);
  }
}
