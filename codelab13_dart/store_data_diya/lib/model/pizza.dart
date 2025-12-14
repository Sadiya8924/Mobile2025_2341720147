 class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  static const String keyId = 'id';
  static const String keyName = 'pizzaName';
  static const String keyDescription = 'description';
  static const String keyPrice = 'price';
  static const String keyImage = 'imageUrl';

  Pizza.fromJson(Map<String, dynamic> json)
      : id = int.tryParse(json[keyId].toString()) ?? 0,
        pizzaName = (json[keyName] ?? 'No name').toString() ?? 'No name',
        description = (json[keyDescription] ?? 'No description').toString(),
        price = double.tryParse(json[keyPrice].toString()) ?? 0.0,
        imageUrl = (json[keyImage] ?? '').toString();

  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImage: imageUrl,
    };
  }
}
