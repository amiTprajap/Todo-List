import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todolist_app/screens/todolist.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: TodoList(),
    );
  }
}

