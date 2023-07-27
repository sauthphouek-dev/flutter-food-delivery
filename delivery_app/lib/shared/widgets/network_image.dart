import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NetworkImageShow extends StatelessWidget {
  const NetworkImageShow({
    super.key,
    required this.imagePath,
    this.boxFit = BoxFit.cover,
    this.width,
    this.height,
  });

  final String imagePath;

  final BoxFit boxFit;

  final double? width;

  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: boxFit,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: Assets.images.logo
                    .image(
                      width: width,
                      height: width,
                    )
                    .image,
              ),
            ),
          ),
        );
      },
    );
  }
}
