//      --- Libraries ---

import 'package:Be_organized/screens/First.Page.dart';
import 'package:Be_organized/screens/GetApi.dart';
import 'package:Be_organized/screens/Second.Page.dart';
import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';

//      --- V i e w s ---


class RouteList {
  //ToDo: Define Your Route name here
  String firstPage = '/FirstPage';
  String secPage = '/SecPage';
  String apiPage = '/GetApi';
}

class Routes {
  static final sailor = Sailor();
  static RouteList routeList = new RouteList();
  static void createRoutes() {
    sailor.addRoutes([
      //ToDo: Add Your Route Here ...  SailorRoute()
      SailorRoute(
        name: routeList
            .firstPage, //route name that defined in #RouteList() Class.
        builder: (context, args, paramMap) {
          return FirstPage(); //the target Route:
        },
      ),
      SailorRoute(
        name: routeList.secPage,
        builder: (context, args, paramMap) {
          return SecondPage(args);
        },
      ),
      SailorRoute(
        name: routeList.apiPage,
        builder: (context, args, paramMap) {
          return GetApiPage();
        },
      ),
    ]);
  }
}

///This is just sample arguments class for second Page
class SecondPageArgument extends BaseArguments {
  String title;

  SecondPageArgument({
    @required this.title,
  });
}
