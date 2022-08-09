import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_refresh/home_screens/category_fragment_item.dart';
import 'package:news_refresh/models/category_model.dart';

class CatgoryFragmentItem extends StatelessWidget {
  var categories = CategoryModel.getCategories();
  Function onFragmentClicked;

  CatgoryFragmentItem(this.onFragmentClicked);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.pickyourcategoryofinterset,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Expanded(
              child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    onFragmentClicked(categories[index]);
                  },
                  child: CategoryFragment(categories, index));
            },
            itemCount: categories.length,
          ))
        ],
      ),
    );
  }
}
