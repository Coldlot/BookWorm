import 'package:bookworm/generated/l10n.dart';
import 'package:bookworm/ui/tabs/settings/signin_out/signin_out_view_model.dart';
import 'package:bookworm/widgets/filled_button.dart';
import 'package:bookworm/widgets/input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInOutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInOutViewModel>(
      init: SignInOutViewModel(),
      builder: (model) {
        return Scaffold(
          backgroundColor: model.themeService.beigeThemed,
          appBar: CupertinoNavigationBar(
            leading: GestureDetector(
              key: ValueKey('backFromLoginPage'),
              onTap: model.dismiss,
              child: Icon(Icons.arrow_back_ios,
                  color: model.themeService.blackThemed),
            ),
            middle: Text(S.of(context).signin,
                style: model.themeService.headerStyleThemed),
            backgroundColor: model.themeService.peachThemed,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Stack(
              children: [
                Column(
                  children: [
                    if (model.isUserLoggedIn) ...[
                      FilledButton(
                        key: ValueKey('logoutBtn'),
                        text: S.of(context).logout,
                        onTap: model.logout,
                      ),
                    ]
                    else ...[
                      InputField(
                        key: ValueKey('emailKey'),
                        controller: model.emailController,
                        color: model.themeService.blackThemed,
                        hintStyle: model.themeService.headerStyleThemed,
                        hintText: S.of(context).enterYourEmail,
                      ),
                      const SizedBox(height: 10),
                      InputField(
                        key: ValueKey('passKey'),
                        controller: model.passwordController,
                        color: model.themeService.blackThemed,
                        hintStyle: model.themeService.headerStyleThemed,
                        hintText: S.of(context).enterYourPassword,
                        isPassword: true,
                      ),
                      const SizedBox(height: 50),
                      FilledButton(
                        key: ValueKey('singinBtn'),
                        text: S.of(context).signin,
                        onTap: model.validate,
                      ),
                    ],
                    const SizedBox(height: 10),
                    if (model.isProcessing)
                      const CupertinoActivityIndicator()
                    else
                      Container()
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    model.image,
                    width: 200,
                    height: 230,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
