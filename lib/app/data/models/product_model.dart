class ProductModel {
    ProductModel({
        required this.code,
        required this.productName,
        required this.productId,
        required this.quantity,
    });

    final String code;
    final String productName;
    final String productId;
    final int quantity;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        code: json["code"] ?? "",
        productName: json["product_name"] ?? "",
        productId: json["product_id"] ?? "",
        quantity: json["quantity"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "product_name": productName,
        "product_id": productId,
        "quantity": quantity,
    };
}
