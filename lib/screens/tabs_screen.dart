import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorite_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _screensOption = [
    {'screen': CategoriesScreen(), 'title': 'Categories'},
    {'screen': FavoriteScreen(), 'title': 'Favorites'}
  ];

  int _selectedScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screensOption[_selectedScreenIndex]['title']),
      ),
      body: _screensOption[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).accentColor,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Category'),
              backgroundColor: Theme.of(context).accentColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Category'),
              backgroundColor: Theme.of(context).accentColor),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
//tabs below app bar
// return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Meals'),
//           bottom: TabBar(tabs: [
//             Tab(
//               icon: Icon(Icons.category),
//               text: 'Categories',
//             ),
//             Tab(
//               icon: Icon(
//                 Icons.star,
//               ),
//               text: 'Favorites',
//             ),
//           ]),
//         ),
//         body: TabBarView(
//           children: [
//             CategoriesScreen(),
//             Center(
//               child: Text('Hello'),
//             )
//           ],
//         ),
//       ),
//     );
