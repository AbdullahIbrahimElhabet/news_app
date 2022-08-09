import 'package:flutter/material.dart';
import 'package:news_refresh/models/SourcesResponse.dart';

class TabWidget extends StatelessWidget {
  Sources source;

  bool isSelected;

  TabWidget(this.source, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      decoration: BoxDecoration(
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
      child: Text(
        source.name ?? "",
        style: TextStyle(
            color: isSelected ? Colors.white : Theme.of(context).primaryColor),
      ),
    );
  }
}
