// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:demo_sqllite/app/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  //TODO: Implement HomeController
  late TabController tabController;
    final formKey = GlobalKey<FormState>();

  final nameController =TextEditingController();
  final emailController =TextEditingController();
  final passwordController =TextEditingController();
  final confirmPasswordController =TextEditingController();
  final dobController =TextEditingController();

 var userList = <UserModel>[].obs;


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  void ragisterUser(){
    if(formKey.currentState!.validate()){

      String name = nameController.text;
      String email = emailController.text;
      String password = passwordController.text;
      String confirmPassword = confirmPasswordController.text;
      String dob = dobController.text;

      if(password != confirmPassword){
        Get.snackbar("Error", "Passwords do not match");
        return;
      }

      UserModel newUser = UserModel(name: name, email: email, password: password, confirmPassword: confirmPassword, dob: dob);
      userList.add(newUser);
      Get.snackbar("Ragister", "Successfully");

      nameController.clear();
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      dobController.clear();  


    }
  }

  void deleteUser(int index) {
  userList.removeAt(index);

  Get.snackbar(
    "Deleted",
    "User deleted successfully",
  );
}

// void editUser(int index) {

//   nameController.text = userList[index].name ?? "";
//   emailController.text = userList[index].email ?? "";
//   passwordController.text = userList[index].password ?? "";
//   confirmPasswordController.text =
//       userList[index].confirmPassword ?? "";
//   dobController.text = userList[index].dob ?? "";

//   userList.removeAt(index);

//   tabController.animateTo(0);
// }

void editUser(int index){
  nameController.text = userList[index].name ??"";
  emailController.text = userList[index].email??"";
  passwordController.text = userList[index].password??"";
  confirmPasswordController.text = userList[index].confirmPassword??"";
  dobController.text = userList[index].dob??"";   
  userList.removeAt( index);
  tabController.animateTo(0);
}


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    dobController.dispose();
    tabController.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
