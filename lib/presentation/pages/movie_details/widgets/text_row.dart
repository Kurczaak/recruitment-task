import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../style/app_text_style.dart';

class TextRow extends StatelessWidget {
  final String title;
  final String value;

  const TextRow({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.bodyMBold.copyWith(fontSize: 20.sp),
          ),
          Text(
            value,
            style: AppTextStyle.bodyMRegular,
          ),
        ],
      ),
    );
  }
}
