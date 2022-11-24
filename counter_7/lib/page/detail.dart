import 'dart:convert';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/appearData.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/model/modelMyWatchList.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/page/myWatchList.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.myWatchListModel}) : super(key: key);
  final WatchList myWatchListModel;

  @override
  State<DetailPage> createState() => _DetailPageState(myWatchListModel);
}

class _DetailPageState extends State<DetailPage> {
  WatchList modelMyWatchList;
  _DetailPageState(this.modelMyWatchList);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Budget'),
      ), // Menambahkan drawer menu
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                modelMyWatchList.fields.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 3, left: 7, right: 7, bottom: 3),
            child: Row(
              children: [
                const Text(
                  "Release Date: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  DateFormat.yMMMd().format(modelMyWatchList.fields.releaseDate),
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 4, left: 8, right: 8, bottom: 4),
            child: Row(
              children: [
                const Text(
                  "Rating: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  '${modelMyWatchList.fields.rating} / 5',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
    top: 4, left: 8, right: 8, bottom: 4),
            child: Row(
              children: [
                const Text(
                  "Status: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  modelMyWatchList.fields.watched.toString().split('.').last.toLowerCase(),
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 4, left: 8, right: 8, bottom: 4),
            child: Row(
              children: [
                const Text(
                  "Review: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Flexible(
                  child: Text(
                    modelMyWatchList.fields.review,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          //const Flexible(fit: FlexFit.tight, child: SizedBox()),
          Padding(
            padding: const EdgeInsets.fromLTRB(10,360,10,10),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 32, 139, 226),
                minimumSize: const Size.fromHeight(40.0),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyWatchListPage()),
                
                );
              },
              child: const Text(
                "Kembali",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}