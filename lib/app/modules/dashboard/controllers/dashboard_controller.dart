import 'package:demo_sqllite/app/service/databaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class DashboardController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  RxList students = [].obs;

  // @override
  // void onInit() {
  //   getStudents();
  //   super.onInit();
  // }

  // INSERT
  // Future<void> addStudent() async {
  //   await DatabaseHelper.instance.insertStudent({
  //     'name': nameController.text,
  //     'age': int.parse(ageController.text),
  //   });

  //   nameController.clear();
  //   ageController.clear();

  //   getStudents();
  // }

  // // READ
  // Future<void> getStudents() async {
  //   final data = await DatabaseHelper.instance.getStudents();

  //   students.value = data;
  // }

  // // UPDATE
  // Future<void> updateStudent(int id) async {
  //   await DatabaseHelper.instance.updateStudent({
  //     'id': id,
  //     'name': nameController.text,
  //     'age': int.parse(ageController.text),
  //   });

  //   nameController.clear();
  //   ageController.clear();

  //   getStudents();
  // }

  // // DELETE
  // Future<void> deleteStudent(int id) async {
  //   await DatabaseHelper.instance.deleteStudent(id);

  //   getStudents();
  // }
}