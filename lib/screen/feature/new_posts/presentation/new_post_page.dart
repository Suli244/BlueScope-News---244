import 'dart:math' as math;

import 'package:another_flushbar/flushbar.dart';
import 'package:bluescope_news_244/screen/bottom_navigation_bar/bottom_naviator_screen.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/data/new_poster_model.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/presentation/cubit/new_post_cubit.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/presentation/widgets/add_post_body.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/presentation/widgets/buttons.dart';
import 'package:bluescope_news_244/screen/feature/new_posts/presentation/widgets/font_sizer.dart';
import 'package:bluescope_news_244/style/app_text_styles.dart';
import 'package:bluescope_news_244/utils/image/app_images.dart';
import 'package:bluescope_news_244/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

const pad = EdgeInsets.symmetric(
  horizontal: 16,
  vertical: 10,
);

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key, this.model});
  final NewPosterModel? model;

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  final ImagePicker picker = ImagePicker();
  late TextEditingController _firstCon;
  late TextEditingController _bigCon;
  late GlobalKey<FormState> _formKey;
  List<String> images = [];
  final id = math.Random();
  bool error = false;

  @override
  void initState() {
    super.initState();
    images = widget.model?.images ?? [];
    _firstCon = TextEditingController(text: widget.model?.title ?? '');
    _bigCon = TextEditingController(text: widget.model?.desc ?? '');
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      resizeToAvoidBottomInset: true,
      appBar: widget.model != null
          ? AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              shadowColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                ),
              ),
            )
          : null,
      body: SingleChildScrollView(
        padding: pad,
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AddPostBody(
                  firstCon: _firstCon,
                  bigCon: _bigCon,
                ),
                SizedBox(height: context.height * 0.1),
                PickedImagesWidget(
                  onTapAddEmpty: () async {
                    await getImage();
                  },
                  error: error,
                  images: images,
                  onTap: (index) {
                    images.removeAt(index);
                    setState(() {});
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 16, top: 10, bottom: 20),
                  child: Text(
                    '${images.length} attachments',
                    style: const TextStyle(
                      color: Color(0xFF63717B),
                      fontSize: 15,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                    textScaleFactor: FontSizer.textScaleFactor(context),
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
                              Image.asset(
                                AppImages.camera,
                                scale: 5,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Flexible(
                                child: FittedBox(
                                  child: Text(
                                    'Add photo',
                                    style: const TextStyle(
                                      color: Color(0xFF181A1B),
                                      fontSize: 19,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w900,
                                    ),
                                    textScaleFactor:
                                        FontSizer.textScaleFactor(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () async {
                            await getImage();
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: PostBtnWidget(
                          backgroundColor: const Color(0xff2D52D6),
                          child: Text(
                            widget.model != null ? 'Update' : 'Post',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w900,
                            ),
                            textScaleFactor: FontSizer.textScaleFactor(context),
                          ),
                          onPressed: () {
                            if (_formKey.currentState?.validate() == true &&
                                images.isNotEmpty) {
                              if (widget.model != null) {
                                context.read<NewPostCubit>().editData(
                                      widget.model!.copyWith(
                                        title: _firstCon.text,
                                        desc: _bigCon.text,
                                        images: images,
                                      ),
                                    );
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        const BottomNavigatorScreen(
                                            currentIndex: 3),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      return child;
                                    },
                                    transitionDuration: const Duration(
                                      seconds: 0,
                                    ), // Устанавливаем продолжительность анимации в 0 секунд
                                  ),
                                  (route) => false,
                                ).then(
                                  (value) =>
                                      context.read<NewPostCubit>().getData(),
                                );
                              } else {
                                context.read<NewPostCubit>().saveData(
                                      NewPosterModel(
                                        id: id.nextInt(10000),
                                        title: _firstCon.text,
                                        desc: _bigCon.text,
                                        images: images,
                                      ),
                                    );
                              }

                              _firstCon.clear();
                              _bigCon.clear();
                              images.clear();
                              setState(() {});
                            } else if (images.isEmpty) {
                              error = true;
                              setState(() {});
                              Flushbar(
                                backgroundColor: const Color(0xffFD5F50),
                                borderRadius: BorderRadius.circular(10),
                                boxShadows: const [
                                  BoxShadow(
                                      blurRadius: 10.0,
                                      color: Color(0xffF0DFE1),
                                      offset: Offset(0, 4),
                                      spreadRadius: 5)
                                ],
                                margin: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 16,
                                ),
                                flushbarPosition: FlushbarPosition.TOP,
                                flushbarStyle: FlushbarStyle.FLOATING,
                                isDismissible: true,
                                duration: const Duration(seconds: 2),
                                padding: const EdgeInsets.all(24),
                                messageText: Text(
                                  'Choose Photo',
                                  style: AppTextStylesBlueScopeNews.s15W700(
                                    color: Colors.white,
                                  ),
                                ),
                                // icon: Image.asset(Images.snackBar),
                                mainButton: IconButton(
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    if (Navigator.canPop(context)) {
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                              ).show(context);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getImage() async {
    final test = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (test != null) {
      images.add(test.path);
      setState(() {});
    }
  }
}

class PickedImagesWidget extends StatelessWidget {
  const PickedImagesWidget({
    super.key,
    required this.images,
    required this.onTap,
    required this.error,
    this.onTapAddEmpty,
  });

  final List<String> images;
  final Function(int index) onTap;
  final bool error;
  final Function()? onTapAddEmpty;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 171,
      child: images.isEmpty
          ? GestureDetector(
              onTap: onTapAddEmpty,
              child: Container(
                width: 171,
                height: 171,
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage('https://via.placeholder.com/171x171'),
                    fit: BoxFit.fill,
                  ),
                  border: Border.all(
                    color: error ? Colors.red : Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(8),
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
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
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
                    image: DecorationImage(
                      image: AssetImage(images[index]),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => onTap(index),
                        child: const SizedBox(
                          width: 24,
                          height: 24,
                          child: Icon(
                            Icons.clear,
                            color: Colors.white,
                          ),
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
