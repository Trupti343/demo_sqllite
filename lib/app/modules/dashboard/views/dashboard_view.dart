import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller =
        Get.put(DashboardController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sqflite CRUD"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),

        child: Column(
          children: [

            TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(
                hintText: "Enter Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: controller.ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Enter Age",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            // ElevatedButton(
            //   onPressed: () {
            //     controller.addStudent();
            //   },
            //   child: const Text("Add Student"),
            // ),

            // const SizedBox(height: 20),

            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.students.length,

                  itemBuilder: (context, index) {
                    final student = controller.students[index];

                    return Card(
                      child: ListTile(
                        title: Text(student['name']),
                        subtitle:
                            Text("Age: ${student['age']}"),

                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            ElevatedButton(onPressed: () {

                            }, child: Text("Update")),

                            Text("main branch"),
                            

                            // IconButton(
                            //   onPressed: () {

                            //     controller.nameController.text =
                            //         student['name'];

                            //     controller.ageController.text =
                            //         student['age'].toString();

                            //     controller.updateStudent(
                            //         student['id']);
                            //   },
                            //   icon: const Icon(Icons.edit),
                            // ),

                            // IconButton(
                            //   onPressed: () {
                            //     controller.deleteStudent(
                            //         student['id']);
                            //   },
                            //   icon: const Icon(Icons.delete),
                            // ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}