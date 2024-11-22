import 'dart:convert';

import 'package:api_tutorial/models/Photosmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api2 extends StatefulWidget {
  const Api2({super.key});

  @override
  State<Api2> createState() => _Api2State();
}

class _Api2State extends State<Api2> {
  List<Photosmodel> photolist = [];
  Future<List<Photosmodel>> getphotoapi() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        photolist.add(Photosmodel.fromJson(i));
      }
      return photolist;
    } else {
      return photolist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api2 Tutorial"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getphotoapi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: photolist.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: ListTile(
                          title: Text(
                            photolist[index].title.toString(),
                          ),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              photolist[index].thumbnailUrl.toString(),
                            ),
                          ),
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
