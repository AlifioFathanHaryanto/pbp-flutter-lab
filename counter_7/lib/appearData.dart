import 'package:counter_7/form.dart';
import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class MyData {
  int? nominalItem;
  String? titleItem;
  String? pilihJenis;

  MyData(String titleItem, int nominalItem, String pilihJenis) {
    this.titleItem = titleItem;
    this.nominalItem = nominalItem;
    this.pilihJenis = pilihJenis;
  }
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Budget"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: const Text("Counter_7"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              },
            ),
            ListTile(
              title: const Text("Tambah Budget"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const FormPage()),
                );
              },
            ),
            ListTile(
              title: const Text("Data Budget"),
              onTap: () {
                Navigator.pop(
                  context,
                );
              },
            ),
          ],
        ),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                for (var data in arrData)
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      child: ListTile(
                        tileColor: Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 0.2),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        title: Text(data.pilihJenis.toString(),
                            style: TextStyle(fontSize: 22)),
                        subtitle: Text(data.nominalItem.toString()),
                        trailing: Text(data.titleItem.toString()),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
