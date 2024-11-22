import 'dart:convert';

import 'package:api_tutorial/models/Usermodels.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api3 extends StatefulWidget {
  const Api3({super.key});

  @override
  State<Api3> createState() => _Api3State();
}

class _Api3State extends State<Api3> {
  List<Usermodels> userlist = [];
  Future<List<Usermodels>> getuserapi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        userlist.add(Usermodels.fromJson(i));
      }
      return userlist;
    } else {
      return userlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api3 Tutorial"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getuserapi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: userlist.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Card(
                            elevation: 5,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Name : '),
                                      Text(userlist[index].name.toString()),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Address : '),
                                      Text(
                                        userlist[index]
                                            .address!
                                            .city
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Street : '),
                                      Text(
                                        userlist[index]
                                            .address!
                                            .street
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('ZipCode : '),
                                      Text(
                                        userlist[index]
                                            .address!
                                            .zipcode
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Lat : '),
                                      Text(
                                        userlist[index]
                                            .address!
                                            .geo!
                                            .lat
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Lng : '),
                                      Text(
                                        userlist[index]
                                            .address!
                                            .geo!
                                            .lng
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
