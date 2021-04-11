// Imports the Flutter Driver API.


import 'package:bookworm/api/books_api.dart';
import 'package:bookworm/datamodels/book.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
//import 'package:bookworm/generated/l10n.dart';

class BooksApiMock extends Mock implements BooksApi {}


void main() {
  group('Bookworm App library actions', () {
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
        expect(await driver.getText(libTextFinder), 'Библиотека');
      });
      
      
    });
    test('search title', () async {
      await driver.tap(searchBooksFinder);
      await driver.enterText('код');
      when(
        BooksApiMock().getBooks(),
      ).thenAnswer((realInvocation) => Future.value([
        BookModel(author: 'Питер Сейбел', description: 'asd', fileUrl: 'asd', genre: 'asd', isExternal: true, thumbUrl: 'asdasd',title: 'Кодеры за работой', isCached: false, storedUrl: 'asdasd'),
        BookModel(author: 'Чарльз Петцольд', description: 'asd', fileUrl: 'asd', genre: 'asd', isExternal: true, thumbUrl: 'asdasd',title: 'Код: тайный язык информатики', isCached: false, storedUrl: 'asdasd')
        ])
        );
      await driver.waitFor(find.text('код'));
        

    });

    test('tap on book', () async{
    await driver.tap(find.text('Кодеры за работой'));
    });

    test('back to all books', () async{
      await driver.runUnsynchronized(() async {
      await driver.tap(find.byValueKey('backFromReadingPage'));
      });
    });
  
    // test('read the book',() async{
    //   await driver.tap(find.byValueKey('readBook'));
    //   // driver.waitFor(find.byValueKey('fileReader'));
    //   // await driver.scroll(find.byValueKey('fileReader'), 0, 1000, Duration(seconds: 5));

    // });

  });



  group('tabs cliks', (){
    final libTextFinder = find.byValueKey('libTextKey');

    FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await driver.waitUntilFirstFrameRasterized();
    });
    tearDownAll(() async {
      if (driver != null) {

        driver.close();
      }
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
  });

  group('favorite page actions', (){
    
    final libTextFinder = find.byValueKey('libTextKey');
    FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await driver.waitUntilFirstFrameRasterized();
    });
    tearDownAll(() async {
      if (driver != null) {

        driver.close();
      }
    });  
        
    test('go to search',() async{
      await driver.tap(find.byValueKey('favTab'));
      await driver.tap(find.byValueKey('watchBooksList'));
      expect(await driver.getText(libTextFinder), 'Библиотека');
      
    });
  });

  group('settings page actions',(){
    FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await driver.waitUntilFirstFrameRasterized();
    });
    tearDownAll(() async {
      if (driver != null) {

        driver.close();
      }
    });  

    test('go to log in', () async{
      await driver.tap(find.byValueKey('settingsTab'));
      expect(await driver.getText(find.byValueKey('setTextKey')), 'Настройки');
      await driver.tap(find.byValueKey('goTologInOut'));      
    });
//TODO попробовать сделать черзе find.text
    test('incorrect login',() async{
      await driver.tap(find.byValueKey('emailKey'));
      await driver.enterText('test1');
      await driver.tap(find.byValueKey('passKey'));
      await driver.enterText('test');
      await driver.tap(find.byValueKey('singinBtn'));
      await driver.runUnsynchronized(() async {
        String res = await driver.getText(find.text('Ошибка'));
        expect(res, 'Ошибка');
      });
      // String res = await driver.getText(find.byValueKey('logoutBtn'));
      // expect(res, 'Выйти');
      //expect(driver.getText(find.byValueKey('logoutBtn')), 'Выйти');
    });

    test('logining',() async{
      await driver.tap(find.byValueKey('emailKey'));
      await driver.enterText('test@mail.ru');
      await driver.tap(find.byValueKey('passKey'));
      await driver.enterText('test');
      await driver.tap(find.byValueKey('singinBtn'));
      // String res = await driver.getText(find.byValueKey('logoutBtn'));
      // expect(res, 'Выйти');
      //expect(driver.getText(find.byValueKey('logoutBtn')), 'Выйти');
    });

    test('logouting',() async{
      await driver.tap(find.byValueKey('logoutBtn'));
      // String res = await driver.getText(find.byValueKey('singinBtn'));
      // expect(res, 'Вход');
      //expect(driver.getText(find.byValueKey('singinBtn')), 'Вход');  
    });

    
    test('back From Login Page',() async{
      await driver.tap((find.byValueKey('backFromLoginPage')));
    });

        
      



  });
}
