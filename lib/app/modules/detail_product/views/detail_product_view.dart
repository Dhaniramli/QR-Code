import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_qode/app/data/models/product_model.dart';

import '../controllers/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  DetailProductView({Key? key}) : super(key: key);

  final ProductModel product = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.productNameC.text = product.productName;
    controller.codeC.text = product.code;
    controller.qtyC.text = "${product.quantity}";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: QrImage(
                  data: product.code,
                  size: 200.0,
                  version: QrVersions.auto,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(),
            child: TextFormField(
              controller: controller.codeC,
              maxLength: 10,
              keyboardType: TextInputType.number,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Kode Product',
                labelStyle: TextStyle(
                  color: Colors.orange,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(),
            child: TextFormField(
              controller: controller.productNameC,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Product Name',
                labelStyle: TextStyle(
                  color: Colors.orange,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(),
            child: TextFormField(
              controller: controller.qtyC,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Kuantitas',
                labelStyle: TextStyle(
                  color: Colors.orange,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 35),
          Container(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
              onPressed: () async {
                if (controller.isLoading.isFalse) {
                  if (controller.productNameC.text.isNotEmpty &&
                      controller.qtyC.text.isNotEmpty) {
                    controller.isLoading(true);
                    Map<String, dynamic> hasil = await controller.editProduct(
                      {
                        "product_id": product.productId,
                        "product_name": controller.productNameC.text,
                        "quantity": int.parse(controller.qtyC.text),
                      },
                    );
                    controller.isLoading(false);

                    Get.snackbar(hasil['error'] == true ? "Error" : "Success",
                        hasil['message']);
                  } else {
                    Get.snackbar("Error", "Semua data wajib diisi",
                        duration: const Duration(seconds: 2));
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                padding: const EdgeInsets.symmetric(vertical: 20),
              ),
              child: Obx(
                () => Text(
                  controller.isLoading.isFalse ? 'Ubah' : 'Memuat...',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.defaultDialog(
                title: "Hapus Produk",
                middleText: "Apa kamu yakin ingin menghapus produk",
                actions: [
                  OutlinedButton(
                    onPressed: () => Get.back(),
                    child: const Text("Batal"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.deleteProduct(product.productId);
                      Get.back();
                      Get.back();
                    },
                    child: const Text("Hapus"),
                  ),
                ],
              );
            },
            child: Text(
              "Hapus",
              style: TextStyle(
                color: Colors.red[900],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
