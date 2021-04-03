import 'package:bookworm/datamodels/book.dart';
import 'package:hive/hive.dart';

part 'favorite_list.g.dart';

@HiveType(typeId: 1)
class FavoriteList {
  @HiveField(0)
  List<BookModel> favorites;

  FavoriteList() {
    favorites = [];
  }
}
