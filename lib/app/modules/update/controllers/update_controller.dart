import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection('posts').doc(docID);
    return docRef.get();
  }

  void updateData(String docID, String title, String description) async {
    try {
      await firestore.collection('posts').doc(docID).update({
        'title': title,
        'description': description,
      });

      Get.back();
      Get.snackbar('Success', 'Data updated successfully');
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed updating data');
    }
  }

  @override
  void onInit() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
