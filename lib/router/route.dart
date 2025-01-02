import 'package:flutter/material.dart';
// import 'package:submission/views/home_page.dart';

// class Routes {
//   static Map<String, WidgetBuilder> getRoutes() {
//     return <String, WidgetBuilder>{
//       '/': (context) => const HomePage(title: 'Flutters'),
//       // '/details': (context) => DetailPage(),
//     };
//   }
// }


Widget textComponent(int? ctx) {
  return Text(
    'Hello, World! ${ctx}',
    // routes: Routes.getRoutes(),
  );
}