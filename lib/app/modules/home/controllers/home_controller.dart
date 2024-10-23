import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_auth/app/modules/login/views/login_view.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference data = firestore.collection('posts');
    return data.orderBy('time', descending: true).snapshots();
  }

  void deleteData(String docID) {
    try {
      Get.defaultDialog(
          title: "Delete Post",
          middleText: "Are you sure you want to delete this post?",
          onConfirm: () async {
            await firestore.collection('posts').doc(docID).delete();
            Get.back();
            Get.snackbar('Success', 'Data deleted successfully');
          },
          textConfirm: "Yes, I'm sure",
          textCancel: "No");
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Cannot delete this post');
    }
  }

  void logout() async {
    await auth.signOut();
    Get.off(() => LoginView());
  }
}
