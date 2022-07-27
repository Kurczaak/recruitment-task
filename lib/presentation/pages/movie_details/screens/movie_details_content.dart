import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/di/dependencies.dart';
import 'package:flutter_recruitment_task/domain/movie/entities/movie_details_entity.dart';
import 'package:flutter_recruitment_task/generated/locale_keys.g.dart';
import 'package:flutter_recruitment_task/presentation/pages/movie_details/widgets/poster_section.dart';
import 'package:flutter_recruitment_task/presentation/pages/movie_details/widgets/text_row.dart';
import 'package:flutter_recruitment_task/presentation/pages/should_watch/bloc/should_watch_cubit.dart';
import 'package:flutter_recruitment_task/presentation/pages/should_watch/widget/should_watch_section.dart';
import 'package:flutter_recruitment_task/style/app_dimensions.dart';
import 'package:flutter_recruitment_task/style/app_text_style.dart';

class MovieDetailsContent extends StatelessWidget {
  final MovieDetailsEntity entity;

  const MovieDetailsContent({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = new NumberFormat.simpleCurrency();
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          if (entity.backDropPath != null) PosterSection(url: entity.backDropPath!),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.l, vertical: AppDimensions.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: AppDimensions.l),
                  child: Text(
                    entity.overview ?? "",
                    style: AppTextStyle.bodySRegular,
                  ),
                ),
                TextRow(
                  title: LocaleKeys.budget.tr(),
                  value: formatCurrency.format(entity.budget),
                ),
                TextRow(
                  title: LocaleKeys.revenue.tr(),
                  value: formatCurrency.format(entity.revenue),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppDimensions.xl),
                  child: BlocProvider(
                    create: (_) => getIt<ShouldWatchCubit>(),
                    child: ShouldWatchSection(
                      revenue: entity.revenue,
                      budget: entity.budget,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
