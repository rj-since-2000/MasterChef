import 'package:flutter/material.dart';
//import 'package:mealapp_14_finished/models/drawer.dart';
import '../dummy_data.dart';

//import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    if (title == 'Gluten-free')
      return Column(
        children: <Widget>[
          ListTile(
            dense: true,
            title: Text(
              'Categories',
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            dense: true,
            leading: Icon(
              icon,
              size: 26,
            ),
            title: Text(
              title,
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: tapHandler,
          )
        ],
      );
    else
      return ListTile(
        dense: true,
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: tapHandler,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              //height: 100,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.fastfood,
                    size: 50,
                    color: Colors.white,
                  ),
                  Text(
                    'Cooking Up!',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Tasty and healthy recipes',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: ListView.builder(
              itemBuilder: (context, index) {
                if (index == 2 || index == 6) {
                  return Column(
                    children: <Widget>[
                      Divider(),
                      buildListTile(
                          DUMMY_DRAWER[index].title,
                          DUMMY_DRAWER[index].icon,
                          () => Navigator.of(context).pushNamed(
                                  DUMMY_DRAWER[index].route,
                                  arguments: {
                                    'title': '${DUMMY_DRAWER[index].title}'
                                  }))
                    ],
                  );
                } else
                  return buildListTile(
                      DUMMY_DRAWER[index].title,
                      DUMMY_DRAWER[index].icon,
                      () => Navigator.of(context)
                              .pushNamed(DUMMY_DRAWER[index].route, arguments: {
                            'title': '${DUMMY_DRAWER[index].title}'
                          }));
              },
              itemCount: DUMMY_DRAWER.length,
            ),
          ),
          /* Expanded(
            flex: 1,
            child: buildListTile('Meals', Icons.restaurant, () {
              Navigator.of(context).pushReplacementNamed('/');
            }),
          ),
          Expanded(
            flex: 1,
            child: buildListTile('Filters', Icons.settings, () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            }),
          ),
          Expanded(flex: 10, child: SizedBox())*/
        ],
      ),
    );
  }
}
