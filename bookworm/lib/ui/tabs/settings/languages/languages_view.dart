import 'package:bookworm/generated/l10n.dart';
import 'package:bookworm/ui/tabs/settings/languages/languages_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LanguagesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguagesViewModel>(
      init: LanguagesViewModel(),
      builder: (model) {
        return Scaffold(
          backgroundColor: model.themeService.beigeThemed,
          appBar: CupertinoNavigationBar(
            leading: GestureDetector(
              onTap: model.dismiss,
              child: Icon(Icons.arrow_back_ios,
                  color: model.themeService.blackThemed),
            ),
            middle: Text(S.of(context).languages,
                style: model.themeService.headerStyleThemed),
            backgroundColor: model.themeService.peachThemed,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 16, top: 15),
            child: ListView.builder(
              itemCount: model.languages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    model.changeLocalization(index);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(model.languages[index],
                                style: model.themeService.headerStyleThemed),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
