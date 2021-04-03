//собирается из джосона, падение при неправильном джсоне
import 'dart:math';

import 'package:bookworm/datamodels/book.dart';
import 'package:bookworm/datamodels/favorite_list.dart';
import 'package:bookworm/repositories/favorite_book_repository.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test/test.dart';


Future<void> main() async {
  await Hive.initFlutter();
   Hive
    ..registerAdapter(BookModelAdapter())
    ..registerAdapter(FavoriteListAdapter());

  test('save/restore appearence', () async {
    final favoriteBookRep = FavoriteBooksRepository();
    final favoriteBooks = FavoriteList();
    final config = <String, dynamic>{
      'title':'test title',
      'author':'test author',
      'genre':'test genre',
      'description': 'test descroption',
      'thumb_url':'test thumpURL',
      'file_url':'test file url',
      'is_external': false,
      'is_cached': null,
      'stored_url': null,
    };
    favoriteBooks.favorites = [BookModel.fromJson(config),BookModel.fromJson(config),BookModel.fromJson(config)];
    await favoriteBookRep.saveBooks(favoriteBooks);
    final restoredFB = await favoriteBookRep.getFavoriteBooks();

    
    expect(favoriteBooks.favorites.length, restoredFB.favorites.length);
    
  });

  test('clear', () async {
    final favoriteBookRep = FavoriteBooksRepository();
    final favoriteBooks = FavoriteList();
    final config = <String, dynamic>{
      'title':'test title',
      'author':'test author',
      'genre':'test genre',
      'description': 'test descroption',
      'thumb_url':'test thumpURL',
      'file_url':'test file url',
      'is_external': false,
      'is_cached': null,
      'stored_url': null,
    };
    favoriteBooks.favorites = [BookModel.fromJson(config),BookModel.fromJson(config),BookModel.fromJson(config)];
    await favoriteBookRep.saveBooks(favoriteBooks);
    await favoriteBookRep.clear();
    final restoredFB = await favoriteBookRep.getFavoriteBooks();
    expect(restoredFB.favorites, []);

  });

}



