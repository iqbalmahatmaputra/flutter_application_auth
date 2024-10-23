import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController estimateController;
  late TextEditingController stepController;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addData(
      String title, String description, String estimate, String step) async {
    try {
      String dateNow = DateTime.now().toString();
      await firestore.collection('posts').add({
        'title': title,
        'description': description,
        'estimate': estimate,
        'step': step,
        'time': dateNow
      });

      Get.back();
      Get.snackbar('Success', 'Data added successfully');
      titleController.clear();
      descriptionController.clear();
      estimateController.clear();
      stepController.clear();
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    estimateController = TextEditingController();
    stepController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    estimateController.dispose();
    stepController.dispose();
    super.onClose();
  }
}
