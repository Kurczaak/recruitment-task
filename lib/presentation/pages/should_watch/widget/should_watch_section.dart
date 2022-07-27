import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recruitment_task/common_widgets/basic_button.dart';
import 'package:flutter_recruitment_task/generated/locale_keys.g.dart';
import 'package:flutter_recruitment_task/network_configuration/result.dart';
import 'package:flutter_recruitment_task/presentation/pages/should_watch/bloc/should_watch_cubit.dart';
import 'package:flutter_recruitment_task/style/app_text_style.dart';

import '../../../../style/app_dimensions.dart';

class ShouldWatchSection extends StatelessWidget {
  final int revenue;
  final int budget;

  const ShouldWatchSection({
    Key? key,
    required this.revenue,
    required this.budget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShouldWatchCubit, Result<bool>>(
      builder: (context, state) => Column(
        children: [
          BasicButton(
            onTap: () {
              context.read<ShouldWatchCubit>().shouldWatch(revenue, budget);
            },
            title: LocaleKeys.should_watch.tr(),
          ),
          if (state is Success<bool>)
            Container(
              padding: EdgeInsets.only(top: AppDimensions.l),
              child: Text(
                state.data == true ? LocaleKeys.yes.tr() : LocaleKeys.no.tr(),
                style: AppTextStyle.header1,
              ),
            ),
        ],
      ),
    );
  }
}
