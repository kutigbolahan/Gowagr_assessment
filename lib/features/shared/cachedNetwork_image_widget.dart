// ignore_for_file: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gowagr_assessment/core/constants/constants.dart';


class CachNetworkImageWidget extends StatelessWidget {
  const CachNetworkImageWidget(
      {super.key, required this.imageUrl, this.fit, this.width});

  final String? imageUrl;
  final BoxFit? fit;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
    
      width: width,
      fit: fit,
      // alignment: Alignment.topLeft,
      imageUrl: imageUrl ?? kDummyImage,
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(appColors.black),
        ),
      ),
      errorWidget: (context, url, error) => Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(appColors.black),
        ),
      ),
    );
  }
}
