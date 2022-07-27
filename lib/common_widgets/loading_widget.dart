import 'package:flutter/cupertino.dart';
import 'package:flutter_recruitment_task/style/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  final Color? color;
  final double? size;
  final double? height;

  const LoadingWidget({Key? key, this.color, this.size, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.w,
      child: SpinKitThreeBounce(
        color: color ?? AppColors.primaryColor,
        size: size ?? 35.w,
      ),
    );
  }
}
