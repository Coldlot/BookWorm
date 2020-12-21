import 'package:bookworm/api/books_api.dart';
import 'package:bookworm/app/getx_base_view_model.dart';
import 'package:bookworm/app/logger.dart';
import 'package:bookworm/datamodels/book.dart';
import 'package:bookworm/generated/l10n.dart';
import 'package:bookworm/repositories/appearence_repository.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:bookworm/ui/book_details.dart/book_details_view.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class BooksViewModel extends GetxBaseViewModel {
  final themeService = Get.find<BWThemeService>();
  final appearence = Get.find<AppearenceRepository>();
  final booksApi = Get.find<BooksApi>();

  bool isConnected;
  List<BookModel> _books;
  List<BookModel> filteredBooks;

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

    if (result != null) {
      final file = result.files.first;
      final book = BookModel(
        title: file.name.split(".").first,
        author: S.of(Get.context).unknown,
        genre: S.of(Get.context).unknown,
        description: S.of(Get.context).unknown,
        thumbUrl: "placeholder",
        fileUrl: file.path,
        isExternal: true,
      );
      switch (result.files.first.extension) {
        case 'pdf':
          Get.to(BookDetailsView(book: book));
          break;
        case 'txt':
          Get.to(BookDetailsView(book: book));
          break;
        case 'doc':
          Get.to(BookDetailsView(book: book));
          break;
        case 'epub':
          Get.to(BookDetailsView(book: book));
          break;
      }
    }
  }

  Future<void> downloadBooks() async {
    setBusy(true);
    isConnected = await ConnectivityWrapper.instance.isConnected;
    if (isConnected) {
      _books = await booksApi.getBooks();
      logger.i(_books);
      filteredBooks = _books;
    }
    setBusy(false);
    update();
  }

  void filter(String predicate) {
    final reg = RegExp("$predicate.+", caseSensitive: false);
    final iterable = _books.where((element) {
      return reg.hasMatch(element.title);
    });
    filteredBooks = iterable.toList();
    update();
  }

  void showDetails(int index) {
    Get.to(BookDetailsView(book: filteredBooks[index]));
  }
}
