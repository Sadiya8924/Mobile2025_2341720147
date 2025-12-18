const keyId = 'id';
const keyName = 'pizzaName';
const keyDescription = 'description';
const keyPrice = 'price';
const keyImage = 'imageUrl';
const keyCategory = 'category';

class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;
  final String category;

  Pizza.fromJson(Map<String, dynamic> json)
      : id = int.tryParse(json[keyId].toString()) ?? 0,
        pizzaName = json[keyName] != null ? json[keyName].toString() : 'No name',
        description = json[keyDescription] != null
            ? json[keyDescription].toString()
            : '',
        price = double.tryParse(json[keyPrice].toString()) ?? 0,
        imageUrl = json[keyImage] ?? '',
        category = json[keyCategory]?.toString() ?? 'Uncategorized';


  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImage: imageUrl,
      keyCategory: category,
    };
  }
}
