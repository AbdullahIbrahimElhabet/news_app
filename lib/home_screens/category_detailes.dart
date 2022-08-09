import 'package:flutter/material.dart';
import 'package:news_refresh/api_maneger.dart';
import 'package:news_refresh/models/SourcesResponse.dart';
import 'package:news_refresh/models/category_model.dart';
import 'package:news_refresh/news_screens/tab_container.dart';

class CategoryDetailes extends StatelessWidget {
  static const String screenName = "categorDe";
  CategoryModel categoryModel;

  CategoryDetailes(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder<SourcesResponse>(
              future: ApiManeger.getSources(categoryModel.id),
              builder: (context, snapShot) {
                if (snapShot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapShot.hasError) {
                  return Text("Try Again ");
                }
                if (snapShot.data?.status != "ok") {
                  return Text(snapShot.data?.message ?? "");
                }
                var listOfSources = snapShot.data?.sources ?? [];
                return Expanded(child: TabContainer(listOfSources));
              }),
        ],
      ),
    );
  }
}
