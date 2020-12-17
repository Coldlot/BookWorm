import 'package:bookworm/generated/l10n.dart';
import 'package:bookworm/res/res.dart';
import 'package:bookworm/ui/tabs/settings/signin_out/signin_out_view_model.dart';
import 'package:bookworm/widgets/filled_button.dart';
import 'package:bookworm/widgets/phone_field.dart';
import 'package:bookworm/widgets/underlined_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

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
            child: model.isSignIn
                ? Stack(
                    children: [
                      Column(
                        children: [
                          PhoneField(
                            color: model.themeService.blackThemed,
                            hintStyle: model.themeService.headerStyleThemed,
                            hintText: S.of(context).enterYourNumber,
                          ),
                          const SizedBox(height: 50),
                          FilledButton(
                            text: S.of(context).recieveCode,
                            onTap: model.validate,
                          ),
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
                  )
                : Column(
                    children: [
                      UnderlinedText(text: "+79999999999"),
                      const SizedBox(height: 60),
                      Text(S.of(context).enterCode,
                          style: model.themeService.headerStyleThemed),
                      const SizedBox(height: 26),
                      PinCodeTextField(
                        appContext: context,
                        length: 4,
                        onChanged: model.setHasError,
                        keyboardType: TextInputType.number,
                        backgroundColor: Colors.transparent,
                        autoFocus: true,
                        textStyle: model.themeService.headerStyleThemed,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          fieldHeight: 50,
                          fieldWidth: 50,
                          borderWidth: 1,
                          selectedColor: model.themeService.blackThemed,
                          inactiveColor: model.hasError
                              ? BWColors.red
                              : model.themeService.blackThemed,
                          activeColor: model.hasError
                              ? BWColors.red
                              : model.themeService.blackThemed,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(height: 26),
                      Text("00:46",
                          style: model.themeService.illustrationStyleThemed
                              .copyWith(color: BWColors.red)),
                      const SizedBox(height: 16),
                      UnderlinedText(text: S.of(context).recieveNewCode),
                      const SizedBox(height: 60),
                      FilledButton(
                        text: S.of(context).submit,
                        onTap: model.submitCode,
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
