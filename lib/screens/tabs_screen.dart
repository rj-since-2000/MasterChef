import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState(favoriteMeals);
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> favoriteMeals;
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  double appBarHeight=50;
  double bottomNavigationBarHeight=50;

  _TabsScreenState(this.favoriteMeals);

   @override
  void initState() {
    _pages = [
      {
        'page':"",// CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorite',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget buildAppBar(String title) {
    AppBar appBar = AppBar(
      title: Text(title),
    );
    appBarHeight = appBar.preferredSize.height;
    return appBar;
  }

  Widget buildBottomNavigationBar(
    BuildContext context,
  ) {
    BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      onTap: _selectPage,
      backgroundColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.white,
      selectedItemColor: Theme.of(context).accentColor,
      currentIndex: _selectedPageIndex,
      // type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(Icons.category),
          title: Text('Categories'),
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(Icons.star),
          title: Text('Favorites'),
        ),
      ],
    );

    bottomNavigationBarHeight = appBarHeight;
    return SizedBox(
        height: appBarHeight + 1,
        width: MediaQuery.of(context).size.width,
        child: bottomNavigationBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(_pages[_selectedPageIndex]['title']),
      drawer: MainDrawer(),
      bottomNavigationBar: buildBottomNavigationBar(context),
      body: _selectedPageIndex == 0 ? SingleChildScrollView(
        child: Container(
          child: 
               CategoriesScreen(appBarHeight, bottomNavigationBarHeight),
              
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              appBarHeight -
              bottomNavigationBarHeight -
              1,
        ),
      ) : _pages[_selectedPageIndex]['page'],
    );
  }
}

