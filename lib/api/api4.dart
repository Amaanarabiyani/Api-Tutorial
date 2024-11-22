import 'dart:convert';

import 'package:api_tutorial/models/Todomodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api4 extends StatefulWidget {
  const Api4({super.key});

  @override
  State<Api4> createState() => _Api4State();
}

class _Api4State extends State<Api4> {
  List<Todomodel> todolist = [];
  Future<List<Todomodel>> gettodoapi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        todolist.add(Todomodel.fromJson(i));
      }
      return todolist;
    } else {
      return todolist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api4 Tutotrial"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: gettodoapi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: todolist.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Text(
                              todolist[index].title.toString(),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
