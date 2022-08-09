import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String image;
  String title;
  Color color;

  CategoryModel(this.id, this.title, this.image, this.color);

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel("sports", "Sports", "assets/ball.png",
          Color.fromRGBO(201, 28, 34, 1.0)),
      CategoryModel("entertainment", "Entertainment", "assets/environment.png",
          Color.fromRGBO(72, 130, 207, 1.0)),
      CategoryModel("business", "Business", "assets/bussines.png",
          Color.fromRGBO(207, 126, 72, 1.0)),
      CategoryModel("general", "General", "assets/politics.png",
          Color.fromRGBO(0, 62, 144, 1.0)),
      CategoryModel("health", "Health", "assets/health.png",
          Color.fromRGBO(237, 30, 121, 1.0)),
      CategoryModel("science", "Science", "assets/science.png",
          Color.fromRGBO(242, 211, 82, 1.0)),
      CategoryModel("technology", "Technology", "assets/technology.png",
          Colors.tealAccent),
    ];
  }
}
