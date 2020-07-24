import 'package:flutter/material.dart';
import 'package:mealapp_14_finished/screens/meal_detail_screen.dart';
//import 'package:mealapp_14_finished/models/meal.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
 final double appBarHeight;
 final double bottomNavigationBarHeight;
  CategoriesScreen(this.appBarHeight, this.bottomNavigationBarHeight);

  final latestMeals =
      DUMMY_MEALS.where((meal) => meal.categories.contains('latest')).toList();
  final veganMeals = DUMMY_MEALS.where((meal) => meal.isVegan).toList();
  final vegetarianMeals =
      DUMMY_MEALS.where((meal) => meal.isVegetarian).toList();

  @override
  Widget build(BuildContext context) {
    final double remainingHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        appBarHeight -
        bottomNavigationBarHeight -
        25 -
        5 -
        10);

    void selectLatestMeal(BuildContext ctx, int index) {
      Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,
          arguments: latestMeals[index].id);
    }

    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        SizedBox(
          height: 25,
          child: Container(
            // height: 28,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    '  Latest Recipies',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 5),
       /* Expanded(
          flex: 6,
          child:*/ Container(
            color: Colors.white,
           // height: (remainingHeight * 0.35), //- 10 - 30 - 12,
            width: MediaQuery.of(context).size.width,
            height: remainingHeight*0.25,
            //padding: EdgeInsets.only(top: 5,bottom: 5),

            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => selectLatestMeal(context, index),
                child: Card(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(5)),
                  //borderOnForeground: true,//color: Colors.red,
                  elevation: 7,
                  //margin: EdgeInsets.only(right: 5),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            latestMeals[index].imageUrl,
                            // height:
                            //   remainingHeight * 0.35 * 0.75, //- 10 - 30) * 0.75,
                            width: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                         height: 30,
                          padding: EdgeInsets.all(2),
                          // height: remainingHeight * 0.35 * 0.25,
                          width: 200,
                          child: Center(
                            child: Text(
                              latestMeals[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          //padding: EdgeInsets.all(8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: latestMeals.length,
            ),
          ),
       // ),
        
        Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(width: 5),
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                    elevation: 5,
                    textColor: Colors.black87,color: Colors.white,
                    //disabledColor: Colors.white,
                    //disabledElevation: 10,
                    child: Text(
                      'Vegan',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () => Navigator.of(context).pushNamed(
                        '/category-meals',
                        arguments: {'title': 'Vegan'}),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                    elevation: 5,
                    textColor: Colors.black87,color: Colors.white,
                    //disabledColor: Colors.white,
                    //disabledElevation: 10,
                    child: Text(
                      'Vegetarian',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () => Navigator.of(context).pushNamed(
                        '/category-meals',
                        arguments: {'title': 'Vegetarian'}),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                    elevation: 5,
                    textColor: Colors.black87,color: Colors.white,
                    //disabledColor: Colors.white,
                    //disabledElevation: 10,
                    child: Text(
                      'All Recipies',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () => Navigator.of(context).pushNamed(
                        '/category-meals',
                        arguments: {'title': 'All Recipes'}),
                  ),
                ),
                SizedBox(width: 5),
              ],
            )),
       
        Expanded(
          flex: 18,
          child: Container(
           // height: (remainingHeight * 0.75),
            child: GridView(
              padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
              children: DUMMY_CATEGORIES
                  .map(
                    (catData) => CategoryItem(
                      catData.id,
                      catData.title,
                      catData.color,
                    ),
                  )
                  .toList(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
