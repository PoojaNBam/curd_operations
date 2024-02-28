import 'package:crud_operations/screen/add_product/add_product_screen.dart';
import 'package:crud_operations/screen/product_category/category.dart';
import 'package:crud_operations/screen/product_list/product_list_screen.dart';
import 'package:crud_operations/utils/colorr.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 1;
  final double _iconSize = 30;
  List<Widget> _pages = const [];

  @override
  void initState() {
    super.initState();
    _setPages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(child: _pages[_selectedIndex]),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colorr.white,
          backgroundColor: Colorr.primary,
          unselectedItemColor: Colorr.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Product List",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              label: "Category",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "Add",
            ),
          ],
          currentIndex: _selectedIndex,
          // showUnselectedLabels: true,
          onTap: _onItemTapped,
        ));
  }

  _onItemTapped(int index) {
    _selectedIndex = index;
    _setPages();
    setState(() {});
  }

  _setPages() {
    _pages = [
      const ProductListScreen(),
      const Category(),
      const AddProductScreen()
    ];
    setState(() {});
  }
}
