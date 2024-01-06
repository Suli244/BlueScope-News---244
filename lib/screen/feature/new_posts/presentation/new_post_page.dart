import 'dart:math';

import 'package:bluescope_news_244/screen/feature/new_posts/data/new_poster_model.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/presentation/cubit/new_post_cubit.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/presentation/widgets/add_post_body.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/presentation/widgets/buttons.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/presentation/widgets/font_sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const pad = EdgeInsets.symmetric(
  horizontal: 16,
  vertical: 10,
);

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key});

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  late TextEditingController firstCon;
  late TextEditingController bigCon;

  final id = Random();

  @override
  void initState() {
    super.initState();
    firstCon = TextEditingController();
    bigCon = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: pad,
                child: AddPostBody(
                  firstCon: firstCon,
                  bigCon: bigCon,
                ),
              ),
            ),
            const PickedImagesWidget(),
            const Padding(
              padding: EdgeInsets.only(right: 16, top: 10, bottom: 20),
              child: Text(
                '2 attachments',
                style: TextStyle(
                  color: Color(0xFF63717B),
                  fontSize: 15,
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Padding(
              padding: pad,
              child: Row(
                children: [
                  Expanded(
                    child: PostBtnWidget(
                      backgroundColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.clear,
                            color: Colors.blue,
                          ),
                          Text(
                            'Add photo',
                            style: const TextStyle(
                              color: Color(0xFF181A1B),
                              fontSize: 19,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w900,
                            ),
                            textScaleFactor: FontSizer.textScaleFactor(context),
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: PostBtnWidget(
                      backgroundColor: const Color(0xff2D52D6),
                      child: Text(
                        'Post',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w900,
                        ),
                        textScaleFactor: FontSizer.textScaleFactor(context),
                      ),
                      onPressed: () {
                        context.read<NewPostCubit>().saveData(
                              NewPosterModel(
                                id: id.nextInt(10000),
                                title: firstCon.text,
                                desc: bigCon.text,
                                images: [],
                              ),
                            );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PickedImagesWidget extends StatelessWidget {
  const PickedImagesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 171,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 16);
        },
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 171,
            height: 171,
            padding: const EdgeInsets.all(8),
            decoration: ShapeDecoration(
              image: const DecorationImage(
                image: NetworkImage("https://via.placeholder.com/171x171"),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
