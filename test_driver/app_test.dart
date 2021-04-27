// Imports the Flutter Driver API.


import 'package:bookworm/api/books_api.dart';
import 'package:bookworm/datamodels/book.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

//import 'package:bookworm/generated/l10n.dart';

class BooksApiMock extends Mock implements BooksApi {}


void main() {
  integrationTests();
  systemTests();

}

void integrationTests(){
group('Bookworm App library actions', () {
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

    test('switch color mode',() async{
      await driver.tap(find.byValueKey('SwitchMode'));      
    });
    test('switch language',() async{
      await driver.tap(find.byValueKey('goToLangs'));
      await driver.tap(find.text('English'));
      expect(await driver.getText(find.byValueKey('setTextKey')), 'Settings');
    });    
    test('filePicker', () async{
      await driver.tap(find.byValueKey('libTab'));
      await driver.tap(find.byValueKey('UploadBooks'));
     

    });  
      



  });
}

void systemTests(){
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
  group('SystemTests: ', (){
        test('1) log in',() async{
          await driver.tap(find.byValueKey('settingsTab'));
          //await driver.tap((find.byValueKey('backFromLoginPage')));
          await driver.tap(find.byValueKey('goTologInOut'));  
          await driver.tap(find.byValueKey('emailKey'));
          await driver.enterText('test@mail.ru');
          await driver.tap(find.byValueKey('passKey'));
          await driver.enterText('test');
          await driver.tap(find.byValueKey('singinBtn'));
          await driver.tap((find.byValueKey('backFromLoginPage')));

        });
        test('2) relogin',() async{
          //await driver.tap(find.byValueKey('settingsTab'));
          //await driver.tap((find.byValueKey('backFromLoginPage')));
          await driver.tap(find.byValueKey('goTologInOut'));  
          await driver.runUnsynchronized(() async {
          driver.waitFor(find.byValueKey('logoutBtn'));
          await driver.tap(find.byValueKey('logoutBtn'));
          });          
          await driver.tap(find.byValueKey('emailKey'));
          await driver.enterText('test@mail.ru');
          await driver.tap(find.byValueKey('passKey'));
          await driver.enterText('test');
          await driver.tap(find.byValueKey('singinBtn'));
          await driver.tap((find.byValueKey('backFromLoginPage')));
        });
        test('3) switch color mode',() async{
           await driver.tap(find.byValueKey('SwitchMode'));      
        });
        test('4) switch language',() async{
          await driver.tap(find.byValueKey('goToLangs'));
          await driver.tap(find.text('English'));
          expect(await driver.getText(find.byValueKey('setTextKey')), 'Settings');
        });
        test('5) open book info', () async{
          await driver.tap(find.byValueKey('libTab'));
          await driver.tap(find.text('Кодеры за работой'));
          await driver.runUnsynchronized(() async {
          await driver.tap(find.byValueKey('backFromReadingPage'));
          });
        });
        test('6) search a book', () async{
          await driver.tap(find.byValueKey('searchBooks'));
          await driver.enterText('прост');
          await driver.tap(find.text('Простой Python'));
          await driver.runUnsynchronized(() async {
          await driver.tap(find.byValueKey('backFromReadingPage'));
          });
          await driver.tap(find.byValueKey('favTab'));
          await driver.tap(find.byValueKey('refresh'));
          await driver.tap(find.byValueKey('libTab'));
          await driver.tap(find.byValueKey('searchBooks'));
          await driver.enterText('');
        });
        test('7) search, add to fav and delete', () async{
          await driver.tap(find.text('Идеальный программист'));
          await driver.runUnsynchronized(() async {
          await driver.tap(find.byValueKey('backFromReadingPage'));
          });
          await driver.tap(find.byValueKey('favTab'));
          await driver.tap(find.byValueKey('refresh'));
          await driver.tap(find.byValueKey('libTab'));
        });
        test('8) delete from fav and deny', () async{
          await driver.tap(find.text('Простой Python'));
          await driver.runUnsynchronized(() async {
          await driver.tap(find.byValueKey('backFromReadingPage'));
          });
          await driver.tap(find.byValueKey('favTab'));
          await driver.tap(find.byValueKey('refresh'));          
        });
        test('9) delete from fav and accept', () async{
          await driver.tap(find.byValueKey('libTab'));
          await driver.tap(find.text('Простой Python'));
          await driver.runUnsynchronized(() async {
          await driver.tap(find.byValueKey('backFromReadingPage'));
          });
          await driver.tap(find.byValueKey('favTab'));
          await driver.tap(find.byValueKey('refresh'));
          await driver.tap(find.byValueKey('libTab'));
          await driver.tap(find.byValueKey('searchBooks'));
          await driver.enterText('');
        });





  });
}