import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/generated/locale_keys.g.dart';
import 'package:flutter_recruitment_task/style/colors.dart';

class SearchBox extends StatelessWidget {
  final void Function(String)? onSubmitted;

  const SearchBox({Key? key, this.onSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: AppColors.accentColor,
          border: Border(
            bottom: BorderSide(color: Colors.black.withOpacity(0.1)),
          ),
        ),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            hintText: LocaleKeys.search.tr(),
          ),
          onSubmitted: onSubmitted,
        ),
      );
}
