import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/style/app_text_style.dart';
import 'package:flutter_recruitment_task/style/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final double? width;
  final double? height;
  final Color? color;
  final double? radius;
  final BoxShadow? boxShadow;
  final Color? borderColor;

  const BasicButton({
    required this.title,
    this.onTap,
    this.width,
    this.color,
    this.height,
    this.radius,
    this.boxShadow,
    this.borderColor,
  }) : super();

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: width ?? 315.w,
          height: height ?? 50.w,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: color ?? AppColors.primaryColor,
            shape: BoxShape.rectangle,
            border: Border.all(
              color: borderColor ?? Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 10.r),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppTextStyle.buttonS.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      );
}
