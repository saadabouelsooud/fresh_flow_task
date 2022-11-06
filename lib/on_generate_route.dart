


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertakehometest/app_const.dart';
import 'package:fluttertakehometest/feature/domain/entities/item_entity.dart';
import 'feature/presentation/pages/details_page.dart';

class OnGenerateRoute{
  static Route<dynamic> route(RouteSettings settings){
    final args=settings.arguments;


    switch(settings.name){
      case PageConst.DetailsPage:{
        if (args is ItemEntity) {
          return materialBuilder(widget: DetailsPage(itemEntity: args,));
        }
        else {
          return materialBuilder(
            widget: ErrorPage(),
          );
        }
        break;
      }
      default: return materialBuilder(widget: ErrorPage());
    }

  }
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("error"),
      ),
      body: Center(
        child: Text("error"),
      ),
    );
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}