//собирается из джосона, падение при неправильном джсоне
import 'package:bookworm/repositories/appearence_repository.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test/test.dart';
import 'package:bookworm/datamodels/appearence.dart';


Future<void> main() async {
  await Hive.initFlutter();
   Hive
    ..registerAdapter(AppearenceModelAdapter());

  test('save/restore appearence', () async {
    final appearenceRepo = AppearenceRepository();
    final appearence = AppearenceModel.fromJson(<String, dynamic>{
      'language_code':'RU',
      'scale_factor':10,
      'dark_mode': false,
    });
    await appearenceRepo.saveAppearence(appearence);
    final restoredAppearence = await appearenceRepo.getAppearence();

    expect(appearence.languageCode, restoredAppearence.languageCode);
    expect(appearence.scaleFactor, restoredAppearence.scaleFactor);
    expect(appearence.darkMode, restoredAppearence.darkMode);
  });

  test('clear', () async {
    final appearenceRepo = AppearenceRepository();
    final appearence = AppearenceModel.fromJson(<String, dynamic>{
      'language_code':'RU',
      'scale_factor':10,
      'dark_mode': false,
    });
    await appearenceRepo.saveAppearence(appearence);
    
    await appearenceRepo.clear();
    final restoredAppearence = await appearenceRepo.getAppearence();
    final defaultModel = AppearenceModel(languageCode: "ru", scaleFactor: 1, darkMode: false);

    expect(restoredAppearence.darkMode, defaultModel.darkMode);
    expect(restoredAppearence.languageCode, defaultModel.languageCode);
    expect(restoredAppearence.scaleFactor, defaultModel.scaleFactor);
  });

}



