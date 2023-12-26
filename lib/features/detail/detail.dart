import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newzify/models/article_model.dart';
import 'package:newzify/utility/shimmer_widget.dart';

class Detail extends StatelessWidget {
  static const String path = '/detail';

  final ArticleModel articleModel;

  const Detail({
    super.key,
    required this.articleModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 40,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Detail News',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                articleModel.title ?? '',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Text(
                    articleModel.author ?? '',
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    DateFormat('dd-MM-yyyy HH:MM')
                        .format(articleModel.publishedAt ?? DateTime.now()),
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25.0),
              Text(
                articleModel.description ?? '',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 16.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                // Adjust the radius as needed
                child: articleModel.urlToImage != null
                    ? CachedNetworkImage(
                        cacheKey: articleModel.urlToImage,
                        imageUrl: articleModel.urlToImage ?? '',
                        placeholder: (_, __) => const ShimmerWidget(),
                        errorWidget: (_, __, error) => const ShimmerWidget(),
                        fit: BoxFit.cover,
                        width: 200,
                        height: 200,
                        fadeOutDuration: const Duration(seconds: 1),
                        fadeInDuration: const Duration(seconds: 2),
                      )
                    : Image.asset(
                        'assets/icons/placeholderjpeg.jpg',
                        fit: BoxFit.cover,
                        width: 200,
                        height: 200,
                      ),
              ),
              const SizedBox(height: 16.0),
              Text(
                articleModel.content ?? '',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
