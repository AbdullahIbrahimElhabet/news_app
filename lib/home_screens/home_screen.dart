import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_refresh/api_maneger.dart';
import 'package:news_refresh/home_screens/category_detailes.dart';
import 'package:news_refresh/home_screens/catgory_fragment.dart';
import 'package:news_refresh/home_screens/home_drawer.dart';
import 'package:news_refresh/models/NewsResponse.dart';
import 'package:news_refresh/models/category_model.dart';
import 'package:news_refresh/news_screens/news_item.dart';
import 'package:news_refresh/setting_screen/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String screenName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var categories = CategoryModel.getCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.newsapp,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchBar());
                },
                icon: Icon(
                  Icons.search,
                  size: 40,
                ))
          ],
        ),
        drawer: Drawer(
          child: HomeDrawer(onDrawerClicked),
        ),
        body: categoryModel == null
            ? CatgoryFragmentItem(onCategoriesClicked)
            : CategoryDetailes(categoryModel!));
  }

  CategoryModel? categoryModel = null;

  void onCategoriesClicked(CategoryModel newCategoryModel) {
    categoryModel = newCategoryModel;
    setState(() {});
  }

  void onDrawerClicked(int id) {
    Navigator.pop(context);
    if (id == HomeDrawer.CATEGORIES) {
      categoryModel = null;
      setState(() {});
    } else if (id == HomeDrawer.SETTINGS) {
      Navigator.pushNamed(context, SettingScreen.screenName);
    }
  }
}

class SearchBar extends SearchDelegate {
  late Future<NewsResponse> newResponse;

  SearchBar() {
    newResponse = ApiManeger.getNews(serchQuery: query);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            newResponse = ApiManeger.getNews(serchQuery: query);
            showResults(context);
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          FutureBuilder<NewsResponse>(
              future: newResponse,
              builder: (context, snapShot) {
                if (snapShot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapShot.hasError) {
                  return Text("Try Again");
                }
                if (snapShot.data?.status != "ok") {
                  return Text(snapShot.data?.message ?? "");
                }
                var listOfNews = snapShot.data?.articles ?? [];
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return NewsItem(listOfNews[index]);
                    },
                    itemCount: listOfNews.length,
                  ),
                );
              })
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
