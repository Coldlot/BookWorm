import 'package:bookworm/app/getx_base_view_model.dart';
import 'package:bookworm/generated/l10n.dart';
import 'package:bookworm/repositories/appearence_repository.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:bookworm/ui/reading_page/reading_page_view.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class BooksViewModel extends GetxBaseViewModel {
  final themeService = Get.find<BWThemeService>();
  final appearence = Get.find<AppearenceRepository>();
  bool isConnected;

  @override
  Future<void> onInit() async {
    super.onInit();
    checkConnection();
  }

  Future<void> downloadBookTapped() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'txt', 'doc', 'epub'],
    );

    final scaleFactor = (await appearence.getAppearence()).scaleFactor;

    if (result != null) {
      final file = result.files.first;
      switch (result.files.first.extension) {
        case 'pdf':
          Get.to(ReadingPageView(
              filePath: file.path, scaleFactor: scaleFactor, title: file.name));
          break;
        case 'txt':
          Get.to(ReadingPageView(
              filePath: file.path, scaleFactor: scaleFactor, title: file.name));
          break;
        case 'doc':
          Get.to(ReadingPageView(
              filePath: file.path, scaleFactor: scaleFactor, title: file.name));
          break;
        case 'epub':
          //empty
          break;
      }
    } else {
      Get.snackbar(S.of(Get.context).error, S.of(Get.context).errorOfFile);
    }
  }

  Future<void> checkConnection() async {
    setBusy(true);
    isConnected = await ConnectivityWrapper.instance.isConnected;
    setBusy(false);
    update();
  }
}
