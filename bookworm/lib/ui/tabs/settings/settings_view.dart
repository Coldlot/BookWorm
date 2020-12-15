import 'package:bookworm/res/res.dart';
import 'package:bookworm/ui/tabs/settings/settings_view_model.dart';
import 'package:bookworm/widgets/item_row.dart';
import 'package:bookworm/widgets/size_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/l10n.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsViewModel>(
      init: SettingsViewModel(),
      builder: (model) {
        return Scaffold(
          backgroundColor: model.themeService.beigeThemed,
          appBar: CupertinoNavigationBar(
            middle: Text(S.of(context).settings,
                style: model.themeService.headerStyleThemed),
            backgroundColor: model.themeService.peachThemed,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemRow(
                    icon: "assets/icons/user.svg",
                    text: S.of(context).signinout,
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: model.themeService.blackThemed,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Divider(),
                  const SizedBox(height: 5),
                  ItemRow(
                    icon: "assets/icons/world.svg",
                    text: S.of(context).languages,
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: model.themeService.blackThemed,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Divider(),
                  const SizedBox(height: 5),
                  ItemRow(
                    icon: "assets/icons/dark_mode.svg",
                    text: S.of(context).darkMode,
                    trailing: CupertinoSwitch(
                      onChanged: model.updateDarkModeState,
                      value: model.themeService.isDarkMode,
                    ),
                    color: BWColors.purple,
                  ),
                  const SizedBox(height: 45),
                  Text(S.of(context).textSize,
                      style: model.themeService.headerStyleThemed),
                  const SizedBox(height: 35),
                  SizeSlider(
                    value: model.scaleFactor,
                    onChanged: model.updateScaleFactor,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
