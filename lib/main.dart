import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/settings_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'package:meals_app/settings_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SettingState(),
      child: MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(225, 254, 229, 1),
          fontFamily: GoogleFonts.raleway().fontFamily,
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 62, 62, 1),
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 62, 62, 1),
              ),
              headline6: GoogleFonts.roboto().copyWith(fontSize: 24)),
        ),
        initialRoute: '/', // default value is '/'
        routes: {
          '/': (context) => TabsScreen(),
          CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
          MealDetailScreen.routeName: (context) => MealDetailScreen(),
          SettingsScreen.routeName: (context) => SettingsScreen()
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
              builder: (context) =>
                  CategoriesScreen()); //this is the default page when something goes wrong like 404 page
        },
      ),
    );
  }
}
