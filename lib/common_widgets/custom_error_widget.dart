import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/generated/locale_keys.g.dart';
import 'package:flutter_recruitment_task/style/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorWidget extends StatelessWidget {
  final Function()? retry;
  final String? message;

  const CustomErrorWidget({Key? key, this.retry, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 250.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(
                height: 40.w,
              ),
              Text(message ?? LocaleKeys.error_text.tr()),
              SizedBox(
                height: 20.w,
              ),
              IconButton(
                onPressed: retry,
                icon: Icon(
                  Icons.replay,
                  size: 25.w,
                  color: AppColors.primaryColor,
                ),
              )
            ],
          ),
        ),
      );
}
