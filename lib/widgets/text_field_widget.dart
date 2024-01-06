import 'package:bluescope_news_244/style/app_colors.dart';
import 'package:bluescope_news_244/style/app_text_styles.dart';
import 'package:bluescope_news_244/utils/image/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: const BorderSide(
    color: AppColorsBlueScopeNews.color64717B,
  ),
);

class TextFieldWidgetSearch extends StatelessWidget {
  const TextFieldWidgetSearch({
    super.key,
    this.onChanged,
  });

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      cursorColor: AppColorsBlueScopeNews.color64717B,
      style: AppTextStylesBlueScopeNews.s16W500(
        color: AppColorsBlueScopeNews.color64717B,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16),
          child: Image.asset(
            AppImages.searchIcon,
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 21.5.h,
        ),
        hintText: 'Search',
        hintStyle: AppTextStylesBlueScopeNews.s16W400(
          color: AppColorsBlueScopeNews.color64717B,
        ),
        filled: true,
        fillColor: Colors.white,
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        disabledBorder: border,
      ),
    );
  }
}
