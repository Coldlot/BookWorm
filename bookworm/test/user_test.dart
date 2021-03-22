//собирается из джосона, падение при неправильном джсоне
import 'package:bookworm/datamodels/user.dart';
import 'package:test/test.dart';

void main() {
  test('Model init from json', () {
    final user = UserModel.fromJson(<String, dynamic>{
      'email':'test email',
      'password':'test pass',
      'token':'test token',
    });

    expect(user.email, 'test email');
    expect(user.password, 'test pass');
    expect(user.token, 'test token');
  });

  test('Model serialization to json', () {
    final config = <String, dynamic>{
      'email':'test email',
      'password':'test pass',
      'token':'test token',     
    };

    final user = UserModel.fromJson(config);

    final json = user.toJson();

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