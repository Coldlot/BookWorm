import 'package:bookworm/app/getx_base_view_model.dart';
import 'package:bookworm/datamodels/appearence.dart';
import 'package:bookworm/generated/l10n.dart';
import 'package:bookworm/repositories/appearence_repository.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagesViewModel extends GetxBaseViewModel {
  final themeService = Get.find<BWThemeService>();
  final appearenceRepository = Get.find<AppearenceRepository>();

  final List<String> languages = ["Русский", "English"];

  Future<void> changeLocalization(int tag) async {
    final old = await appearenceRepository.getAppearence();
    await appearenceRepository.clear();
    if (tag == 0) {
      final appearence = AppearenceModel(
          languageCode: "ru",
          scaleFactor: old.scaleFactor,
          darkMode: old.darkMode);
      await appearenceRepository.saveAppearence(appearence);
      S.load(const Locale.fromSubtags(languageCode: "ru"));
    } else {
      final appearence = AppearenceModel(
          languageCode: "en",
          scaleFactor: old.scaleFactor,
          darkMode: old.darkMode);
      await appearenceRepository.saveAppearence(appearence);
      S.load(const Locale.fromSubtags(languageCode: "en"));
    }
    dismiss();
  }

  void dismiss() {
    Get.back();
  }
}
