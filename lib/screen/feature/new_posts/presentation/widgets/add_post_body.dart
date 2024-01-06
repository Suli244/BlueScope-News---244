import 'package:bluescope_news_244/screen/feature/new_posts/presentation/widgets/font_sizer.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

final class AddPostBody extends StatelessWidget {
  const AddPostBody({
    super.key,
    required this.firstCon,
    required this.bigCon,
  });

  final TextEditingController firstCon;
  final TextEditingController bigCon;

  @override
  Widget build(BuildContext context) {
    ValueNotifier customValues = ValueNotifier<String>('');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'New post',
          style: const TextStyle(
            color: Color(0xFF181A1B),
            fontSize: 46,
            fontFamily: 'Mulish',
            fontWeight: FontWeight.w700,
            height: 0.02,
          ),
          textScaleFactor: FontSizer.textScaleFactor(context),
        ),
        const SizedBox(height: 32),
        TextFieldWidget(
          maxLines: 1,
          controller: firstCon,
          labelText: 'labelText',
          onChanged: (v) {},
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 175,
          child: TextFieldWidget(
            expands: true,
            isCollapsed: true,
            contentPadding: const EdgeInsets.all(16),
            controller: bigCon,
            labelText: 'labelText',
            onChanged: (v) {
              customValues.value = v;
            },
            counter: ValueListenableBuilder(
              valueListenable: customValues,
              builder: (_, __, child) {
                return Text(
                  '${customValues.value.length} words',
                  style: const TextStyle(
                    color: Color(0xFF63717B),
                    fontSize: 15,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                  textScaleFactor: FontSizer.textScaleFactor(context),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
