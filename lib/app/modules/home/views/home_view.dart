import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          late String title;
          late IconData icon = Icons.error;

          switch (index) {
            case 0:
              title = 'Tambah Produk';
              icon = Icons.post_add_rounded;
              break;
            case 1:
              title = 'List Produk';
              icon = Icons.list_alt_outlined;
              break;
            case 2:
              title = 'Kode QR';
              icon = Icons.qr_code;
              break;
            case 3:
              title = 'Katalog';
              icon = Icons.document_scanner_outlined;
              break;
          }

          return Material(
            color: Colors.grey,
            child: InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50.0,
                    child: Icon(icon, size: 50.0),
                  ),
                  const SizedBox(height: 10.0),
                  Text(title),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
