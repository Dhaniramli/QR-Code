import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddProductController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(),
            child: TextFormField(
              controller: controller.codeC,
              maxLength: 10,
              keyboardType: TextInputType.number,
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
                  if (controller.codeC.text.isNotEmpty &&
                      controller.productNameC.text.isNotEmpty &&
                      controller.qtyC.text.isNotEmpty) {
                    controller.isLoading(true);
                    Map<String, dynamic> hasil = await controller.addProduct(
                      {
                        "code": controller.codeC.text,
                        "product_name": controller.productNameC.text,
                        "quantity": int.parse(controller.qtyC.text),
                      },
                    );
                    controller.isLoading(false);
                    controller.codeC.clear();
                    controller.productNameC.clear();
                    controller.qtyC.clear();

                    Get.snackbar(hasil['error'] == true ? "Error" : "Success",
                        hasil['message']);
                  } else {
                    Get.snackbar("Error", "Semua data wajib diisi");
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
              child: const Text(
                // Obx(() => controller.isLoading.isFalse ? 'Tambah Produk' : 'Memuat...'),
                'Tambah',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
