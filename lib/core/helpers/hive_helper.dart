import 'package:hive_ce/hive.dart';
import 'package:taskati/Models/all_tasks_model.dart';

class HiveHelper {
  static late Box userBox;
  static late Box<AllTasksModel> taskaBox;

  static const String userBoxName = 'user';
  static const String tasksBoxName = 'tasks';

  static const String nameKey = 'name';
  static const String imageKay = 'image';
  static const String isUploadedKay = 'isUploaded';

  static Future<void> init() async {
    userBox = await Hive.openBox(userBoxName);
    taskaBox = await Hive.openBox<AllTasksModel>(tasksBoxName);
  }

  static Future<void> setUserInfo(String name, String image) async {
    await userBox.put(nameKey, name);
    await userBox.put(imageKay, image);
  }

  static dynamic cacheData(String kay, dynamic value) {
    return userBox.put(isUploadedKay, value);
  }

  static dynamic getCachedData(String key) {
    return userBox.get(key);
  }

  static dynamic cacheTask(String kay, dynamic value) {
    return taskaBox.put(kay, value);
  }

  static dynamic getCachedTask(String key) {
    return userBox.get(key);
  }
}
