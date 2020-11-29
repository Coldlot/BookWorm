import 'package:bookworm/generated/l10n.dart';
import 'package:bookworm/res/res.dart';
import 'package:bookworm/ui/splash/books_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GetBuilder<BooksViewModel>(
      init: BooksViewModel(),
      builder: (model){
        return Scaffold(
          backgroundColor: BWColors.whitePink,
          appBar: CupertinoNavigationBar(
            middle: Text('Библиотека',style: BWStyle.headerStyle),            
            trailing: SvgPicture.asset('assets/icons/downloadBook.svg'),  
            backgroundColor: BWColors.peach,
          ),
          body: 
             Container(
              alignment: Alignment.center,
              child: 
              SafeArea(child: 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
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