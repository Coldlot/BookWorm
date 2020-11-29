import 'dart:convert';

import 'package:bookworm/generated/l10n.dart';
import 'package:bookworm/res/res.dart';
import 'package:bookworm/ui/splash/settings_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool _lights = false;
double _progress = 50;

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsViewModel>(
        init: SettingsViewModel(),
        builder: (model) {
          return Scaffold(
              backgroundColor: BWColors.whitePink,
              appBar: CupertinoNavigationBar(
                middle: Text('Настройки', style: BWStyle.headerStyle),
                backgroundColor: BWColors.peach,
              ),
              body: Container(
                //alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Icon(Icons.account_circle, color: BWColors.darkGray),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Вход / Выход',
                          style: BWStyle.mainTextStyle,
                        )
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Icon(
                          Icons.language,
                          color: BWColors.darkGray,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Языки',
                          style: BWStyle.mainTextStyle,
                        )
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Icon(
                          Icons.brightness_3,
                          color: BWColors.darkGray,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Темная тема',
                          style: BWStyle.mainTextStyle,
                        ),
                        Spacer(),
                        CupertinoSwitch(
                          value: _lights,
                          onChanged: (bool value) {
                            {
                              _lights = value;
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(children: [
                      Text('Размер текста', style: BWStyle.mainTextStyle)
                    ]),
                    Row(children: [
                      SizedBox(width: 15),
                      Text('A', style: TextStyle(fontSize: 12),),
                      Expanded(
                        child: CupertinoSlider(
                        value: _progress,
                        min: 0.0,
                        max: 100.0,
                        onChanged: (value) {
                          {
                            _progress = value.roundToDouble();
                          }
                        },
                    ),
                      ),
                      Text('A', style: TextStyle(fontSize: 32),),
                      SizedBox(width: 15),

                    ],),
                    
                  ],
                ),
              ));
        });
  }
}

