import 'package:bookworm/generated/l10n.dart';
import 'package:bookworm/res/res.dart';
import 'package:bookworm/ui/splash/favorites_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FavoritesView extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<FavoritesViewModel>(
      init: FavoritesViewModel(),
      builder: (model){
        return Scaffold(
          backgroundColor: BWColors.whitePink,
          appBar: CupertinoNavigationBar(
            middle: Text('Мои книги', style: BWStyle.headerStyle),         
            backgroundColor: BWColors.peach,
          ),
          
          body: Container(
              alignment: Alignment.center,
              child: 
              SafeArea(child: 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //TODO GridView
                
                SvgPicture.asset('assets/icons/Illustration.svg'),
                Text('MainText', style: BWStyle.mainTextStyle),
                Text('Name of book', style: BWStyle.nameOfBook),
                Text('Illustraition', style: BWStyle.illustrationStyle),
                Text('Button', style: BWStyle.buttonTextStyle),
              ],),)
            ),
        );
      }

    );

  }
}