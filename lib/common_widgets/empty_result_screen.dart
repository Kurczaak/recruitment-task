import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/generated/locale_keys.g.dart';
import 'package:flutter_recruitment_task/style/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SizedBox(
        height: 250.w,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 24.w,
              ),
              child: Text(
                LocaleKeys.empty_result.tr(),
                style: AppTextStyle.bodyMRegular,
              ),
            ),
          ],
        ),
      );
}
