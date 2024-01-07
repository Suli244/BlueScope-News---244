import 'package:bluescope_news_244/core/hive/saved_hive.dart';
import 'package:bluescope_news_244/logic/models/saved_model/saved_data.dart';
import 'package:bluescope_news_244/logic/models/saved_model/saved_model.dart';
import 'package:bluescope_news_244/screen/page/saved_detail_page.dart';
import 'package:bluescope_news_244/style/app_colors.dart';
import 'package:bluescope_news_244/style/app_text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/shimmer.dart';

const _key = 'saved';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  late Box<Map<dynamic, dynamic>> box;

  initBox() async {
    box = await Hive.openBox<Map<dynamic, dynamic>>(_key);
  }

  @override
  void initState() {
    super.initState();
    initBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: initBox(),
            builder: (context, snapShot) {
              if (snapShot.connectionState == ConnectionState.done) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () async {
                          // SavedHive.deleteData(id: 0, group: 'Art');
                          // SavedHive.dataToCache(
                          //     group: 'Art',
                          //     data: SavedModel(
                          //         id: 1,
                          //         time: "32",
                          //         desciption: "dfasdsf",
                          //         title: 'ttytt',
                          //         view: '324',
                          //         images:
                          //             'https://i.ibb.co/dBxY7Ly/image-1.png'));
                          // Map<dynamic, dynamic>? list = box.get(_key);
                          // if (list == null) {
                          //   list = {
                          //     'Art': [
                          //       SavedModel(
                          //           id: 1,
                          //           time: "32",
                          //           desciption: "dfasdsf",
                          //           title: 'ttytt',
                          //           view: '324',
                          //           images:
                          //               'https://i.ibb.co/dBxY7Ly/image-1.png')
                          //     ]
                          //   };
                          // } else {
                          //   if (list['Art'] != null) {
                          //     list['Art']!.add(SavedModel(
                          //         id: 1,
                          //         time: "32",
                          //         desciption: "dfasdsf",
                          //         title: 'ttytt',
                          //         view: '324',
                          //         images:
                          //             'https://i.ibb.co/dBxY7Ly/image-1.png'));
                          //   } else {
                          //     list.addAll({
                          //       'Art': [
                          //         SavedModel(
                          //             id: 1,
                          //             time: "32",
                          //             desciption: "dfasdsf",
                          //             title: 'ttytt',
                          //             view: '324',
                          //             images:
                          //                 'https://i.ibb.co/dBxY7Ly/image-1.png')
                          //       ]
                          //     });
                          //   }
                          // }
                          // await box.put(_key, list);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             ReferyDetailPage(data: state.data[index])));
                        },
                        child: Text(
                          'Saved',
                          style: AppTextStylesBlueScopeNews.s46W700(),
                        ),
                      ),
                      Text(
                        'Your personal collection',
                        style: AppTextStylesBlueScopeNews.s15W400(
                          color: AppColorsBlueScopeNews.color64717B,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      ValueListenableBuilder(
                        valueListenable: box.listenable(),
                        builder: (context, value, child) {
                          Map<dynamic, dynamic>? savedList = box.get(_key);
                          Map<dynamic, List<dynamic>> newList = {};
                          savedList?.forEach((key, value) {
                            if (value.isNotEmpty) {
                              newList.addAll({key: value});
                              print('########### $newList');
                            }
                          });

                          return MasonryGridView.count(
                            mainAxisSpacing: 32,
                            crossAxisSpacing: 16,
                            shrinkWrap: true,
                            itemCount: newList.length,
                            crossAxisCount: 2,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SavedDetailPage(
                                              data: newList.values
                                                  .toList()[index],
                                              group:
                                                  newList.keys.toList()[index],
                                            )));
                              },
                              child: newList.values.toList()[index] != null
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          newList.keys.toList()[index],
                                          style: AppTextStylesBlueScopeNews
                                              .s19W900(),
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Container(
                                            clipBehavior: Clip.antiAlias,
                                            width: ((MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    48) /
                                                2),
                                            height: ((MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    48) /
                                                2),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.white),
                                            child: MasonryGridView.count(
                                                mainAxisSpacing: 1,
                                                crossAxisSpacing: 1,
                                                shrinkWrap: true,
                                                itemCount: newList.values
                                                    .toList()[index]
                                                    .length,
                                                crossAxisCount: 2,
                                                itemBuilder: (context, i) =>
                                                    _image(newList.values
                                                        .toList()[index][i]
                                                        .images))
                                            // Column(
                                            //   children: [
                                            //     Expanded(
                                            //       child: Row(
                                            //         children: [
                                            //           _image(
                                            //               newList.values
                                            //                   .toList()[index],
                                            //               0),
                                            //           const SizedBox(width: 1),
                                            //           _image(
                                            //               newList.values
                                            //                   .toList()[index],
                                            //               1)
                                            //         ],
                                            //       ),
                                            //     ),
                                            //     const SizedBox(height: 1),
                                            //     Expanded(
                                            //       child: Row(
                                            //         children: [
                                            //           _image(
                                            //               newList.values
                                            //                   .toList()[index],
                                            //               2),
                                            //           const SizedBox(width: 1),
                                            //           _image(
                                            //               newList.values
                                            //                   .toList()[index],
                                            //               3)
                                            //         ],
                                            //       ),
                                            //     )
                                            //   ],
                                            // ),
                                            ),
                                      ],
                                    )
                                  : const SizedBox(),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
      ),
    );
  }

  Widget _image(String images) {
    return SizedBox(
      height: ((MediaQuery.of(context).size.width - 49) / 4),
      child: Image.network(
        images,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
