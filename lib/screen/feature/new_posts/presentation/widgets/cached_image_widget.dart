import 'package:bluescope_news_244/screen/feature/new_posts/presentation/widgets/app_loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({
    super.key,
    required this.image,
    this.radius = 8,
    this.height,
    this.width,
  });

  final String image;
  final double radius;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: image,
      fit: BoxFit.cover,
      memCacheHeight: 400,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const AppLoadingWidget(
        backgroundColor: Colors.black,
      ),
      errorWidget: (context, url, error) => const ColoredBox(
        color: Color(0xff50717C),
        child: Icon(
          Icons.image_not_supported_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
