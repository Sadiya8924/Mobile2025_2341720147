import 'package:flutter/material.dart';
import 'models/pizza_model.dart';
import 'httphelper.dart';

class PizzaDetailScreen extends StatefulWidget {
  final Pizza pizza;
  final bool isNew;
  const PizzaDetailScreen(
      {super.key, required this.pizza, required this.isNew});

  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  final TextEditingController txtId = TextEditingController();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtPrice = TextEditingController();
  final TextEditingController txtImageUrl = TextEditingController();
  final TextEditingController txtCategory = TextEditingController();
  String operationResult = '';

  @override
void initState() {
  if (!widget.isNew) {
    txtId.text = widget.pizza.id.toString();
    txtName.text = widget.pizza.pizzaName;
    txtDescription.text = widget.pizza.description;
    txtPrice.text = widget.pizza.price.toString();
    txtImageUrl.text = widget.pizza.imageUrl;
    txtCategory.text = widget.pizza.category;
  }
  super.initState();
}

Future savePizza() async {
  HttpHelper helper = HttpHelper();
  Pizza pizza = Pizza.fromJson({
    keyId: int.tryParse(txtId.text) ?? 0,
    keyName: txtName.text,
    keyDescription: txtDescription.text,
    keyPrice: double.tryParse(txtPrice.text) ?? 0,
    keyImage: txtImageUrl.text,
    keyCategory: txtCategory.text,
  });
  final result = await (widget.isNew
    ? helper.postPizza(pizza)
    : helper.putPizza(pizza));    
  setState(() {
    operationResult = result;
  });
}
  
  @override
  void dispose() {
    txtId.dispose();
    txtName.dispose();
    txtDescription.dispose();
    txtPrice.dispose();
    txtImageUrl.dispose();
    txtCategory.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pizza Detail')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                operationResult,
                style: TextStyle(
                  backgroundColor: Colors.green[200],
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtId,
                decoration: const InputDecoration(hintText: 'Insert ID'),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtName,
                decoration: const InputDecoration(
                  hintText: 'Insert Pizza Name',
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtDescription,
                decoration: const InputDecoration(
                  hintText: 'Insert Description',
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtPrice,
                decoration: const InputDecoration(hintText: 'Insert Price'),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtImageUrl,
                decoration: const InputDecoration(hintText: 'Insert Image Url'),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: txtCategory,
                decoration: const InputDecoration(hintText: 'Insert Category'),
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                child: Text(widget.isNew ? 'Create' : 'Save'),
                onPressed: () async {
                  if (widget.isNew) {
                    await postPizza();
                  } else {
                    await savePizza();
                    final message = operationResult.isNotEmpty
                        ? operationResult
                        : 'Pizza was updated';
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message)),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future postPizza() async {
  HttpHelper helper = HttpHelper();
  Pizza pizza = Pizza.fromJson({
  keyId: int.tryParse(txtId.text) ?? 0,
  keyName: txtName.text,
  keyDescription: txtDescription.text,
  keyPrice: double.tryParse(txtPrice.text) ?? 0,
  keyImage: txtImageUrl.text,
  keyCategory: txtCategory.text,
});
  String result = await helper.postPizza(pizza);
  setState(() {
    operationResult = result;
  });

}
}
