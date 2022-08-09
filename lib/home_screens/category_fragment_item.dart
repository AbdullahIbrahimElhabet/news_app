import 'package:flutter/material.dart';
import 'package:news_refresh/models/category_model.dart';

class CategoryFragment extends StatelessWidget {
  List<CategoryModel> categories;

  int index;

  CategoryFragment(this.categories, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categories[index].color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft:
                index % 2 == 0 ? Radius.circular(0) : Radius.circular(12),
            bottomRight:
                index % 2 != 0 ? Radius.circular(12) : Radius.circular(0),
          )),
      child: Column(
        children: [
          Image.asset(
            categories[index].image,
            height: 120,
          ),
          Center(
              child: Text(
            categories[index].title,
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          )),
        ],
      ),
    );
  }
}
