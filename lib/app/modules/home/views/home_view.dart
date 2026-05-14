import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        // title: const Text('HomeView'),
        // centerTitle: true,
        bottom: TabBar(
          controller: controller.tabController,
          tabs: [
            Tab(
              text: 'Register',
            ),
            Tab(
              text: 'Details',
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TabBarView(
          controller: controller.tabController,
          children: [
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder()
                    ),
                    validator: (value) => value == null || value.isEmpty ? "Please enter your name" : null,
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder()
                    ),
                    validator: (value) => value == null || value.isEmpty ? "Please enter your email" : null,
                  ),
                  SizedBox(height: 10,),  
                  TextFormField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder()
                    ),
                    validator: (value) => value == null || value.isEmpty ? "Please enter your password" : null,
                  ),
                   SizedBox(height: 10,),
                  TextFormField(
                    controller: controller.confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      border: OutlineInputBorder()
                    ),
                    validator: (value) => value == null || value.isEmpty ? "Please confirm your password" : null,
                  ),
                   SizedBox(height: 10,),
                  TextFormField(
                    controller: controller.dobController,
                    decoration: InputDecoration(
                      labelText: "Date of Birth",
                      border: OutlineInputBorder()
                    ),
                    validator: (value) => value == null || value.isEmpty ? "Please enter your date of birth" : null,
                  ),
              
                  ElevatedButton(onPressed: (){
                    controller.ragisterUser();
                  }, child: Text("Register"))
                ],
              ),
            ),
          //  Text(
          //    'Details content',
          //    style: TextStyle(fontSize: 20),
          //  ),
          Obx((){
            if(controller.userList.isEmpty){
              return Text("No users registered yet");
            }else{
              return ListView.builder(
                itemCount: controller.userList.length,
                itemBuilder: (context, index){
                  final user = controller.userList[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    // child: ListTile(
                    //   title: Text(user.name ?? ""),
                    //   subtitle: Text(user.email ?? ""),
                    //       child: ListTile(
                    // title: Text(user.name??""),
                    // subtitle: Text(
                    //   "Email: ${user.email}\nDOB: ${user.dob}",
                    // ),
                    child: ListTile(
                      title: Text(user.name ?? ""),
                      subtitle: Text(
                        "Email: ${user.email}\nDOB: ${user.dob}",
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              controller.editUser(index);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              controller.deleteUser(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }
              );
            }
          })
          ],
        ),
      ),
    );
  }
}
