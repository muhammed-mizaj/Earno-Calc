import 'package:flutter/material.dart';
class Income_Category extends StatefulWidget {
  const Income_Category({Key? key}) : super(key: key);

  @override
  _Income_CategoryState createState() => _Income_CategoryState();
}

class _Income_CategoryState extends State<Income_Category> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(5),
        itemBuilder:(ctx,index){
      return Card(
        
        child: ListTile(
          trailing: IconButton(onPressed: (){},icon: Icon(Icons.delete),)
          ,title: Text("Salary"),
          
        ),
      );
    } ,
        separatorBuilder: (ctx,index){
          return SizedBox(height: 10);
        },
        itemCount: 10);
  }
}
