// Imports the Flutter Driver API.


import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final searchBooksFinder = find.byValueKey('searchBooks');
    final libTextFinder = find.byValueKey('libTextKey');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await driver.waitUntilFirstFrameRasterized();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {

        driver.close();
      }
    });

    test('starts on library', () async {
      await driver.runUnsynchronized(() async {
        driver.waitFor(libTextFinder);
      // Use the `driver.getText` method to verify the counter starts at 0.
        expect(await driver.getText(libTextFinder), 'Библиотека');
      });
      
      
    });
    test('search title', () async {
      await driver.tap(searchBooksFinder);
      await driver.enterText('код');
      await driver.waitFor(find.text('код'));
    });

    test('tab fav', () async{
      await driver.tap(find.byValueKey('favTab'));
      expect(await driver.getText(find.byValueKey('favTextKey')), 'Мои книги');
    });

    test('tab settings', () async{
      await driver.tap(find.byValueKey('settingsTab'));
      expect(await driver.getText(find.byValueKey('setTextKey')), 'Настройки');
    });
    test('tab books', () async{
      await driver.tap(find.byValueKey('libTab'));
      expect(await driver.getText(libTextFinder), 'Библиотека');
    });
    
    test('go to search',() async{
      await driver.tap(find.byValueKey('favTab'));
      await driver.tap(find.byValueKey('watchBooksList'));

    });

    test('tap on book', () async{
    await driver.tap(find.text('Кодеры за работой'));
    });
  
    test('read the book',() async{
      await driver.tap(find.byValueKey('readBook'));
      // driver.waitFor(find.byValueKey('fileReader'));
      // await driver.scroll(find.byValueKey('fileReader'), 0, 1000, Duration(seconds: 5));

    });
    



    // test('increments the counter', () async {
    //   // First, tap the button.
    //   await driver.tap(buttonFinder);

    //   // Then, verify the counter text is incremented by 1.
    //   expect(await driver.getText(counterTextFinder), "1");
    // });
  });
}
