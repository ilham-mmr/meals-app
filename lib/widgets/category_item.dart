import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.id, this.title, this.color});

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed('/category-meals', arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // gesture detector but with ripple effect animation
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(30),
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.bottomRight,
                end: Alignment.bottomLeft),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
