import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:newzify/features/home/models/article_model.dart';
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
          // Adjust the radius as needed
          child: CachedNetworkImage(
            cacheKey: articleModel.urlToImage,
            imageUrl: articleModel.urlToImage ?? '',
            placeholder: (_, __) => const ShimmerWidget(),
            errorWidget: (_, __, error) => const ShimmerWidget(),
            fit: BoxFit.cover,
            width: 100,
            height: 100,
            fadeOutDuration: const Duration(seconds: 1),
            fadeInDuration: const Duration(seconds: 2),
            cacheManager: DefaultCacheManager(),
          ),
        ),
        title: Text(
          articleModel.title!,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          articleModel.description!,
          overflow: TextOverflow.fade,
          maxLines: 1,
          softWrap: false,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
