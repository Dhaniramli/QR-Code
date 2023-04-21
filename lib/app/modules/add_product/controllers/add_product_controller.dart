import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  late TextEditingController codeC;
  late TextEditingController productNameC;
  late TextEditingController qtyC;

  RxBool isLoading = false.obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> addProduct(Map<String, dynamic> data) async {
    try {
      var hasil = await firestore.collection('products').add(data);
      await firestore.collection('products').doc(hasil.id).update({
        "product_id": hasil.id,
      });

      return {
        "error": false,
        "message": "Berhasil menambah produk",
      };
    } catch (err) {
      return {
        "error": true,
        "message": "Tidak dapat menambah produk",
      };
    }
  }

  @override
  void onInit() {
    codeC = TextEditingController();
    productNameC = TextEditingController();
    qtyC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    codeC.dispose();
    productNameC.dispose();
    qtyC.dispose();
    super.onClose();
  }
}
