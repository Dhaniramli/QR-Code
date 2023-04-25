import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProductController extends GetxController {
  late TextEditingController codeC;
  late TextEditingController productNameC;
  late TextEditingController qtyC;

  RxBool isLoading = false.obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> editProduct(Map<String, dynamic> data) async {
    try {
      await firestore.collection('products').doc(data['product_id']).update({
        "product_name": data["product_name"],
        "quantity": data["quantity"],
      });

      return {
        "error": false,
        "message": "Berhasil mengubah produk",
      };
    } catch (err) {
      return {
        "error": true,
        "message": "Tidak dapat mengubah produk",
      };
    }
  }

  Future<Map<String, dynamic>> deleteProduct(String id) async {
    try {
      await firestore.collection('products').doc(id).delete();

      return {
        "error": false,
        "message": "Berhasil mengubah produk",
      };
    } catch (err) {
      return {
        "error": true,
        "message": "Tidak dapat mengubah produk",
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
