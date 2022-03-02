import 'package:earno_calc/screens/category/IncomeCategory.dart';
import 'package:earno_calc/screens/category/expenseCategory.dart';
import 'package:flutter/material.dart';
// class CategoryScreen extends StatefulWidget {
//   const CategoryScreen({Key? key}) : super(key: key);
//
//   @override
//   _CategoryScreenState createState() => _CategoryScreenState();
// }
//
// class _CategoryScreenState extends State<Category> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   @override
//   void initState()
//   {
//     _tabController = TabController(length:2, vsync:this);
//   }
//   @override
//
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TabBar(controller: _tabController
//         ,tabs: [
//           Tab(text: 'Income',),
//           Tab(text:'Expense'),
//         ],labelColor: Colors.yellow,
//         unselectedLabelColor: Colors.blueGrey,)
//       ],
//     );
//   }
// }
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState()
  {
    _tabController = TabController(length:2, vsync:this);
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        TabBar(controller: _tabController
        ,tabs: const[
          Tab(text: 'Income',),
          Tab(text:'Expense'),
        ],labelColor: Colors.yellow,
        unselectedLabelColor: Colors.blueGrey,),
        Expanded(
          child: TabBarView(
            children:const [
              Income_Category(),
              ExpenseCategory()
            ],
          ),
        )
      ],
    );
  }
}
