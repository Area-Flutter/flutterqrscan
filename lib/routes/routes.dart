import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterqrcsan/screen/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage()
  };
}