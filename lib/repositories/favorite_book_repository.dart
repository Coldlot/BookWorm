import 'package:bookworm/app/logger.dart';
import 'package:bookworm/datamodels/favorite_list.dart';
import 'package:hive/hive.dart';

class FavoriteBooksRepository {
  static const favoriteBooksBoxKey = "favoriteBooksBox";
  static const _accessKey = "favoriteBooksAccessKey";

  Future<FavoriteList> getFavoriteBooks() async {
    final box = await Hive.openBox<FavoriteList>(favoriteBooksBoxKey);
    final FavoriteList favorites = box.get(_accessKey, defaultValue: FavoriteList());
    await box.close();
    return favorites;
  }

  Future<void> saveBooks(FavoriteList books) async {
    final box = await Hive.openBox<FavoriteList>(favoriteBooksBoxKey);
    await box.put(_accessKey, books);
    logger.i("Favorite books has been added at box");
    await box.close();
  }

  Future<void> clear() async {
    final box = await Hive.openBox<FavoriteList>(favoriteBooksBoxKey);
    await box.clear();
    await box.close();
  }
}