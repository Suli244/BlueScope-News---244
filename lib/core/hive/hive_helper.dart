import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path_helper;
import 'package:path_provider/path_provider.dart';

extension HiveExtension on HiveInterface {
  Future<void> initFlutter([String? subDir]) async {
    WidgetsFlutterBinding.ensureInitialized();
    if (kIsWeb) return;
    var appDir = await getApplicationDocumentsDirectory();
    init(path_helper.join(appDir.path, subDir));
  }
}
