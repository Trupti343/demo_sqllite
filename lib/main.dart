import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(

    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// import 'app/modules/dashboard/views/dashboard_view.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // IMPORTANT
//   sqfliteFfiInit();

//   databaseFactory = databaseFactoryFfi;

//   runApp(
//     const GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DashboardView(),
//     ),
//   );
// }