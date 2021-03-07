//собирается из джосона, падение при неправильном джсоне
import 'package:test/test.dart';
import 'package:bookworm/datamodels/appearence.dart';

void main() {
  test('Model init from json', () {
    final appearence = AppearenceModel.fromJson(<String, dynamic>{
      'language_code':'RU',
      'scale_factor':10,
      'dark_mode': false,
    });

    expect(appearence.languageCode, 'RU');
    expect(appearence.scaleFactor, 10);
    expect(appearence.darkMode, false);

  });

  test('Model serialization to json', () {
    final config = <String, dynamic>{
      'language_code':'RU',
      'scale_factor':10,
      'dark_mode': false,
    };

    final appearence = AppearenceModel.fromJson(config);

    final json = appearence.toJson();

    expect(json, config);

    
  });

//TODO: неправильный конфиг

}



