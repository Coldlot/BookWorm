//собирается из джосона, падение при неправильном джсоне
import 'package:bookworm/datamodels/auth.dart';
import 'package:test/test.dart';

void main() {
  test('Model init from json', () {
    final book = AuthModel.fromJson(<String, dynamic>{
      'message':'test message',
      'token':'test token',
    });

    expect(book.message, 'test message');
    expect(book.token, 'test token');
  });

  test('Model serialization to json', () {
    final config = <String, dynamic>{
      'message':'test message',
      'token':'test token',     
    };

    final auth = AuthModel.fromJson(config);

    final json = auth.toJson();

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