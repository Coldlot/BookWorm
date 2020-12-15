import 'package:bookworm/app/logger.dart';
import 'package:bookworm/datamodels/appearence.dart';
import 'package:hive/hive.dart';

class AppearenceRepository {
  static const appearenceBoxKey = "appearenceBox";
  static const _accessKey = "appearenceAccessKey";

  Future<AppearenceModel> getAppearence() async {
    final box = await Hive.openBox<AppearenceModel>(appearenceBoxKey);
    final AppearenceModel appearence = box.get(_accessKey, defaultValue: AppearenceModel(languageCode: "ru", scaleFactor: 1, darkMode: false));
    await box.close();
    return appearence;
  }

  Future<void> saveAppearence(AppearenceModel appearence) async {
    final box = await Hive.openBox<AppearenceModel>(appearenceBoxKey);
    await box.put(_accessKey, appearence);
    logger.i("Appearence has been added at box");
    await box.close();
  }

  Future<void> clear() async {
    final box = await Hive.openBox<AppearenceModel>(appearenceBoxKey);
    await box.clear();
    await box.close();
  }
}
