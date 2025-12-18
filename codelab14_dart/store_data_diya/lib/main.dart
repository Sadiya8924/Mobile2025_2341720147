import 'dart:convert';
import 'models/pizza_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'httphelper.dart';
import 'pizza_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo Diya',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String pizzaString = '';
  List<Pizza> myPizzas = [];
  bool isLoading = true;
  int appCounter = 0;
  String documentsPath = '';
  String tempPath = '';
  late File myfile;
  String filetext = '';

  final pwdController = TextEditingController();
  String myPass = '';
  final storage = const FlutterSecureStorage();
  final myKey = 'myPass';

  Future<List<Pizza>> callPizzas() async {
    HttpHelper helper = HttpHelper();
    List<Pizza> pizzas = await helper.getPizzaList();
    return pizzas;
  }

  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/pizzalist.json');
    List pizzaMapList = jsonDecode(myString);
    List<Pizza> myPizzas = [];
    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    }
    String json = convertToJSON(myPizzas);
    print(json);
    return myPizzas;
  }

  Future readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    appCounter = prefs.getInt('counter') ?? 0;
    appCounter++;

    await prefs.setInt('counter', appCounter);

    setState(() {
      appCounter = appCounter;
    });
  }

  Future deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      appCounter = 0;
    });
  }

  Future getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
    setState(() {
      documentsPath = docDir.path;
      tempPath = tempDir.path;
    });
  }

  Future<bool> writeFile() async {
    try {
      await myfile.writeAsString('Diya, 2341720147');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> readFile() async {
    try {
      String fileContent = await myfile.readAsString();
      setState(() {
        filetext = fileContent;
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future writeToSecureStorage() async {
    await storage.write(key: myKey, value: pwdController.text);
  }

  Future<String> readFromSecureStorage() async {
    String secret = await storage.read(key: myKey) ?? '';
    return secret;
  }

  @override
  void initState() {
    super.initState();
    getPaths().then((_) {
      myfile = File('$documentsPath/data.txt');
      writeFile();
    });
    // load pizzas into local state so we can modify (dismiss) them locally
    callPizzas().then((list) {
      setState(() {
        myPizzas = list;
        isLoading = false;
      });
    }).catchError((_) {
      setState(() {
        myPizzas = [];
        isLoading = false;
      });
    });
  }

  Future<void> _confirmAndRemove(int index) async {
    if (index < 0 || index >= myPizzas.length) return;
    final pizza = myPizzas[index];
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete ${pizza.pizzaName}?'),
        content: const Text('Are you sure you want to delete this pizza?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await _removePizzaAt(index);
    }
  }

  Future<void> _removePizzaAt(int index) async {
    if (index < 0 || index >= myPizzas.length) return;
    final removedPizza = myPizzas[index];
    setState(() {
      myPizzas.removeAt(index);
    });
    try {
      // if pizza has no valid id, skip remote delete
      if (removedPizza.id <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${removedPizza.pizzaName} removed (local only)')),
        );
        return;
      }
      HttpHelper helper = HttpHelper();
      final ok = await helper.deletePizza(removedPizza.id);
      if (!ok) throw Exception('Delete failed');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${removedPizza.pizzaName} removed')),
      );
    } catch (e) {
      // restore on failure
      setState(() {
        // put it back at the same index if possible
        final insertIndex = (index <= myPizzas.length) ? index : myPizzas.length;
        myPizzas.insert(insertIndex, removedPizza);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to remove ${removedPizza.pizzaName}')),
      );
    }
  }

  String convertToJSON(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizza) => jsonEncode(pizza)).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'JSON Diya',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: myPizzas.length,
              itemBuilder: (BuildContext context, int position) {
                final pizza = myPizzas[position];
                return Dismissible(
                  key: ValueKey(pizza.id.toString() + position.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    _removePizzaAt(position);
                  },
                  child: ListTile(
                    title: Text(pizza.pizzaName),
                    subtitle: Text(
                      pizza.description + ' - € ' + pizza.price.toString(),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _confirmAndRemove(position),
                      tooltip: 'Delete',
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PizzaDetailScreen(
                            pizza: pizza,
                            isNew: false,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PizzaDetailScreen(
              pizza: Pizza.fromJson({}),
              isNew: true,
            )),
          );
        },
      ),
    );
  }
}
