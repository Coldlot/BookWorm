import 'package:bookworm/api/books_api.dart';
import 'package:bookworm/app/getx_base_view_model.dart';
import 'package:bookworm/app/logger.dart';
import 'package:bookworm/datamodels/user.dart';
import 'package:bookworm/repositories/user_repository.dart';
import 'package:bookworm/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookworm/generated/l10n.dart';

class SignInOutViewModel extends GetxBaseViewModel {
  final themeService = Get.find<BWThemeService>();
  final booksApi = Get.find<BooksApi>();
  final userRep = Get.find<UserRepository>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String get image => themeService.isDarkMode
      ? "assets/images/man_with_ball_dark.png"
      : "assets/images/man_with_ball.png";

  bool isProcessing = false;
  bool isUserLoggedIn = false;

  @override
  Future<void> onInit() async {
    super.onInit();
    final user = await userRep.getUser();
    if (user.token.isEmpty) {
      isUserLoggedIn = false;
    } else {
      isUserLoggedIn = true;
    }
    update();
  }

  validate() async {
    if (emailController.text.isEmail && passwordController.text.isNotEmpty) {
      isProcessing = true;
      update();

      final loginResponse = await booksApi.login(
          {"email": emailController.text, "password": passwordController.text});
      if (loginResponse.token.isEmpty &&
          loginResponse.message == "Invalid creds!") {
        isProcessing = false;
        update();
        Get.snackbar(
          S.of(Get.context).error,
          S.of(Get.context).wrongCreds,
          colorText: themeService.blackThemed,
        );
        return;
      } else if (loginResponse.token.isEmpty &&
          loginResponse.message == "User does not exists!") {
        final regResponse = await booksApi.registration({
          "email": emailController.text,
          "password": passwordController.text
        });
        if (regResponse.token.isNotEmpty) {
          isProcessing = false;
          final user = UserModel(
              email: emailController.text,
              password: passwordController.text,
              token: loginResponse.token);
          await userRep.clear();
          userRep.saveUser(user);
          isUserLoggedIn = true;
          update();
        } else {
          isProcessing = false;
          update();
          Get.snackbar(
            S.of(Get.context).error,
            S.of(Get.context).wrongCreds,
            colorText: themeService.blackThemed,
          );
        }
      } else {
        isProcessing = false;
        final user = UserModel(
            email: emailController.text,
            password: passwordController.text,
            token: loginResponse.token);
        await userRep.clear();
        userRep.saveUser(user);
        isUserLoggedIn = true;
        update();
      }
    } else {
      Get.snackbar(
        S.of(Get.context).error,
        S.of(Get.context).wrongCreds,
        colorText: themeService.blackThemed,
      );
    }
    update();
  }

  void logout() {
    isUserLoggedIn = false;
    userRep.clear();
    update();
  }

  void dismiss() {
    Get.back();
  }
}
