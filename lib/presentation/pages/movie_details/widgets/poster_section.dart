import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/style/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../network_configuration/base_network_config.dart';

class PosterSection extends StatelessWidget {
  final String url;

  const PosterSection({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Container(
          height: 240.w,
          color: AppColors.accentColor,
          child: CachedNetworkImage(
            imageUrl: "$basePosterOriginalUrl$url",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 240.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
