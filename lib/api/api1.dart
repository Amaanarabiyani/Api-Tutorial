import 'dart:convert';

import 'package:api_tutorial/models/Postmodels.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api1 extends StatefulWidget {
  Api1({super.key});

  @override
  State<Api1> createState() => _Api1State();
}

class _Api1State extends State<Api1> {
  List<Postmodels> postlist = [];
  Future<List<Postmodels>> getpostapi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        postlist.add(Postmodels.fromJson(i));
      }
      return postlist;
    } else {
      return postlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Api1 Tutorial",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getpostapi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: postlist.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(postlist[index].id.toString()),
                            Text(
                              postlist[index].title.toString(),
                            ),
                            Text(postlist[index].body.toString()),
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
