import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveSetup {
  /// تهيئة Hive
  Future<void> initializeHive() async {
    await _initHive();
    _registerAdapters();
    await _registerBoxes();
  }

  /// تهيئة المسار الخاص بـ Hive
  Future<void> _initHive() async {
    final appDocDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocDirectory.path);
  }

  /// تسجيل جميع الـ Adapters
  void _registerAdapters() {}

  /// تسجيل Boxes داخل GetIt
  /// تسجيل Boxes و HiveService داخل GetIt
  Future<void> _registerBoxes() async {}

  /// فتح Box إذا لم يكن مفتوحًا
  Future<Box<T>> _getOrOpenBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<T>(boxName);
    } else {
      return await Hive.openBox<T>(boxName);
    }
  }
}
