import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newzify/models/article_model.dart';
import 'package:newzify/utility/shimmer_widget.dart';

class NewsTileWidget extends StatelessWidget {
  final ArticleModel articleModel;

  const NewsTileWidget({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: articleModel.urlToImage != null
              ? CachedNetworkImage(
                  cacheKey: articleModel.urlToImage,
                  imageUrl: articleModel.urlToImage ?? '',
                  placeholder: (_, __) => const ShimmerWidget(),
                  errorWidget: (_, __, error) => const ShimmerWidget(),
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                  fadeOutDuration: const Duration(seconds: 1),
                  fadeInDuration: const Duration(seconds: 2),
                )
              : Image.asset(
                  'assets/icons/placeholderjpeg.jpg',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
        ),
        title: Text(
          articleModel.title ?? '',
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
