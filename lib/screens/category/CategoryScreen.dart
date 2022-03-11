import 'package:earno_calc/db/category_db.dart';
import 'package:earno_calc/screens/category/IncomeCategory.dart';
import 'package:earno_calc/screens/category/expenseCategory.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with TickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState()
  {
    super.initState();

    _tabController = TabController(length:2, vsync:this);
    CategoryDB().refreshUI();
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        TabBar(
          controller: _tabController,

          tabs: [
          Tab(text: 'Income',),
          Tab(text:'Expense'),
        ],labelColor: Colors.black,
        unselectedLabelColor: Colors.blueGrey,
        indicatorColor: Colors.black,),

        Expanded(
          child: TabBarView(
        controller: _tabController,

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
