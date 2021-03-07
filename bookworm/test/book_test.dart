//собирается из джосона, падение при неправильном джсоне
import 'package:bookworm/datamodels/book.dart';
import 'package:test/test.dart';

void main() {
  test('Model init from json', () {
    final book = BookModel.fromJson(<String, dynamic>{
      'title':'test title',
      'author':'test author',
      'genre':'test genre',
      'description': 'test descroption',
      'thumb_url':'test thumpURL',
      'file_url':'test file url',
      'is_external': false,
    });

    expect(book.title, 'test title');
    expect(book.author, 'test author');
    expect(book.genre, 'test genre');
    expect(book.description, 'test descroption');
    expect(book.thumbUrl, 'test thumpURL');
    expect(book.fileUrl, 'test file url');
    expect(book.isExternal, false);
  });

  test('Model serialization to json', () {
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

    final book = BookModel.fromJson(config);

    final json = book.toJson();

    expect(json, config);
  });

  // test('Model mis', () {
  //   final config = <String, dynamic>{
  //     'ttle':'test title',
  //     'athor':'test author',
  //     'genre':'test genre',
  //     'description': 'test descroption',
  //     'thumb_url':'test thumpURL',
  //     'file_url':'test file url',
  //     'is_external': false,
  //     'is_cached': null,
  //     'stored_url': null,
  //   };

  //   final book = BookModel.fromJson(config);

  //   final json = book.toJson();

  //   expect(book, Null);
  // });
}