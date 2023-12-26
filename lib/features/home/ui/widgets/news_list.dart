import 'package:flutter/material.dart';
import 'package:newzify/features/home/models/article_model.dart';
import 'package:newzify/features/home/ui/widgets/data_unavailable_widget.dart';
import 'news_item.dart';

class NewsList extends StatelessWidget {
  final List<ArticleModel> articles;

  const NewsList({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) {
      return const DataUnavailableWidget();
    }
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          ArticleModel currentArticle = articles[index];
          return NewsTileWidget(articleModel: currentArticle);
        },
      ),
    );
  }
}
