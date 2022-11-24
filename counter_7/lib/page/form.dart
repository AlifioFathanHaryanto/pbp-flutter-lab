import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/page/appearData.dart';
import 'package:counter_7/page/myWatchList.dart';

List<MyData> arrData = [];

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  int? _nominalItem;
  String? _titleItem;
  String? _pilihJenis;
  List<String> list_pilihJenis = ["Pengeluaran", "Pemasukan"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: const Text('Counter'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyHomePage()), //halaman utama
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FormPage()), //halaman form
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DataPage()),
                );
              },
            ),
            ListTile(
              title: const Text("My Watch List"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyWatchListPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(7.5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Judul",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.5),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _titleItem = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _titleItem = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Isi Judul!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(7.5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nominal",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.5),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _nominalItem = int.parse(value!);
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _nominalItem = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Isi Nominal!';
                      }
                      return null;
                    },
                  ),
                ),
                DropdownButton(
                  value: _pilihJenis,
                  hint: const Text("Pilih Jenis"),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: list_pilihJenis.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _pilihJenis = newValue!;
                    });
                  },
                ),
                TextButton(
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_pilihJenis == "Pemasukan") {
                        MyData data = MyData(_pilihJenis.toString(),
                            _nominalItem!, _titleItem.toString());
                        arrData.add(data);
                      } else if (_pilihJenis == "Pengeluaran") {
                        MyData data = MyData(_pilihJenis.toString(),
                            _nominalItem!, _titleItem.toString());
                        arrData.add(data);
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 15,
                              child: Container(
                                child: ListView(
                                  padding: const EdgeInsets.only(
                                      top: 18, bottom: 18),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    Center(
                                        child: const Text(
                                            'Pilih Jenis Kegiatan !' + '\n',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 18))),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Close'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
