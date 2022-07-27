import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/domain/movie/entities/movie_entity.dart';
import 'package:flutter_recruitment_task/network_configuration/base_network_config.dart';
import 'package:flutter_recruitment_task/style/app_text_style.dart';
import 'package:flutter_recruitment_task/style/colors.dart';
import 'package:flutter_recruitment_task/style/shadows.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../style/app_dimensions.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity entity;
  final Function() onTap;

  const MovieCard({
    required this.entity,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [baseLightShadow()],
            borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
            color: AppColors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.s, vertical: AppDimensions.m),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (entity.posterPath != null)
                Expanded(
                  flex: 3,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    width: 50.w,
                    height: 110.w,
                    decoration: BoxDecoration(
                      boxShadow: [baseLightShadow()],
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: "$basePosterW500Url${entity.posterPath!}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.only(left: AppDimensions.s),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entity.title,
                        style: AppTextStyle.header2,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      if (entity.overview != null)
                        Padding(
                          padding: EdgeInsets.only(top: AppDimensions.xs),
                          child: Text(
                            entity.overview!,
                            style: AppTextStyle.bodySRegular,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${entity.voteAveragePercentage.toString()}  🌟',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
