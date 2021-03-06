import 'package:bookworm/api/books_api.dart';
import 'package:bookworm/datamodels/appearence.dart';
import 'package:bookworm/datamodels/favorite_list.dart';
import 'package:bookworm/repositories/appearence_repository.dart';
import 'package:bookworm/repositories/favorite_book_repository.dart';
import 'package:bookworm/repositories/user_repository.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:bookworm/ui/splash/splash_view.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

import 'datamodels/auth.dart';
import 'datamodels/book.dart';
import 'datamodels/user.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  /// HIVE:
  /// [AppearenceModel] - 0
  /// [FavoriteList] - 1
  /// [BookModel] - 2
  /// [User] - 5
  /// [Auth] - 10
  Hive
    ..registerAdapter(AppearenceModelAdapter())
    ..registerAdapter(FavoriteListAdapter())
    ..registerAdapter(BookModelAdapter())
    ..registerAdapter(AuthModelAdapter())
    ..registerAdapter(UserModelAdapter());

  final appearenceRepository = AppearenceRepository();
  final appearence = await appearenceRepository.getAppearence();

  Get.put(appearenceRepository);
  Get.put(BWThemeService(appearence.darkMode));
  Get.put(FavoriteBooksRepository());
  Get.put(BooksApi(Dio()));
  Get.put(UserRepository());

  Get.config(
    defaultPopGesture: true,
    enableLog: true,
    defaultOpaqueRoute: true,
    defaultTransition: Transition.cupertino,
  );

  runApp(MyApp(languageCode: appearence.languageCode));
}

class MyApp extends StatelessWidget {
  final String languageCode;
  const MyApp({@required this.languageCode});

  @override
  Widget build(BuildContext context) {
    return ConnectivityAppWrapper(
      app: GetMaterialApp(
        home: SplashView(),
        supportedLocales: S.delegate.supportedLocales,
        locale: Locale.fromSubtags(languageCode: languageCode),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate,
        ],
      ),
    );
  }
}
