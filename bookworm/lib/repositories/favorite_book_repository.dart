import 'package:bookworm/app/logger.dart';
import 'package:bookworm/datamodels/book.dart';
import 'package:hive/hive.dart';

class FavoriteBooksRepository {
  static const favoriteBooksBoxKey = "favoriteBooksBox";
  static const _accessKey = "favoriteBooksAccessKey";

  Future<List<BookModel>> getFavoriteBooks() async {
    final box = await Hive.openBox<List<BookModel>>(favoriteBooksBoxKey);
    final List<BookModel> appearence = box.get(_accessKey, defaultValue: []);
    await box.close();
    return appearence;
  }

  Future<void> saveBooks(List<BookModel> books) async {
    final box = await Hive.openBox<List<BookModel>>(favoriteBooksBoxKey);
    await box.put(_accessKey, books);
    logger.i("Favorite books has been added at box");
    await box.close();
  }

  Future<void> clear() async {
    final box = await Hive.openBox<List<BookModel>>(favoriteBooksBoxKey);
    await box.clear();
    await box.close();
  }
}