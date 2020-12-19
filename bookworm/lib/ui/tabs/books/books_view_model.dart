import 'package:bookworm/api/books_api.dart';
import 'package:bookworm/app/getx_base_view_model.dart';
import 'package:bookworm/app/logger.dart';
import 'package:bookworm/datamodels/book.dart';
import 'package:bookworm/generated/l10n.dart';
import 'package:bookworm/repositories/appearence_repository.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:bookworm/ui/book_details.dart/book_details_view.dart';
import 'package:bookworm/ui/reading_page/reading_page_view.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class BooksViewModel extends GetxBaseViewModel {
  final themeService = Get.find<BWThemeService>();
  final appearence = Get.find<AppearenceRepository>();
  final booksApi = Get.find<BooksApi>();

  bool isConnected;
  List<BookModel> books;

  @override
  Future<void> onInit() async {
    super.onInit();
    downloadBooks();
  }

  Future<void> addExternalBook() async {
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
      Get.snackbar(S.of(Get.context).error, S.of(Get.context).errorOfFile,
          colorText: themeService.blackThemed);
    }
  }

  Future<void> downloadBooks() async {
    setBusy(true);
    isConnected = await ConnectivityWrapper.instance.isConnected;
    if (isConnected) {
      books = await booksApi.getBooks();
      logger.i(books);
    }
    setBusy(false);
    update();
  }

  void showDetails(int index) {
    Get.to(BookDetailsView(book: books[index]));
  }
}
