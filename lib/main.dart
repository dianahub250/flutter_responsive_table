import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(new MaterialApp(
    home: Tabledata(),
  ));
}

class Tabledata extends StatefulWidget {
  @override
  TabledataState createState() => new TabledataState();
}

class TabledataState extends State<Tabledata> {
  final String url = "https://fakerapi.it/api/v1/users?_quantity=100";
  int index = 0;
  List result;
  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http.get(url, headers: {"Accept": "application/json"});

    setState(() {
      var convertDataToJson = json.decode(response.body);
      result = convertDataToJson['data'];
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Table data'),
        ),
        body: new Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(12),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.top,
                  children: [
                    TableRow(children: [
                      Container(
                          width: 300,
                          height: 40,
                          margin: EdgeInsets.only(left: 10),
                          child: Text('First Name',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold))),
                      Container(
                          width: 300,
                          height: 40,
                          margin: EdgeInsets.only(left: 10),
                          child: Text('Last Name',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold))),
                      Container(
                          width: 300,
                          height: 40,
                          margin: EdgeInsets.only(left: 10),
                          child: Text('User Name',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold))),
                    ]),
                    TableRow(children: [
                      Container(
                          width: 300,
                          height: 600,
                          child: ListView.builder(
                              itemCount: result == null ? 0 : result.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 50,
                                  child: Container(
                                      margin: EdgeInsets.only(left: 10, top: 5),
                                      child: Text(
                                        result[index]['firstname'],
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      )),
                                  decoration: index % 2 == 0
                                      ? new BoxDecoration(
                                          borderRadius:
                                              new BorderRadius.circular(
                                            4.0,
                                          ),
                                          color: Color(0xff5FD3FF))
                                      : null,
                                );
                              })),
                      Container(
                          width: 300,
                          height: 600,
                          child: ListView.builder(
                              itemCount: result == null ? 0 : result.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 50,
                                  child: Container(
                                      margin: EdgeInsets.only(left: 10, top: 5),
                                      child: Text(
                                        result[index]['lastname'],
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      )),
                                  decoration: index % 2 == 0
                                      ? new BoxDecoration(
                                          borderRadius:
                                              new BorderRadius.circular(
                                            4.0,
                                          ),
                                          color: Color(0xff5FD3FF))
                                      : null,
                                );
                              })),
                      Container(
                          width: 300,
                          height: 600,
                          child: ListView.builder(
                              itemCount: result == null ? 0 : result.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 50,
                                  child: Container(
                                      margin: EdgeInsets.only(left: 5, top: 5),
                                      child: Text(
                                        result[index]['username'],
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      )),
                                  decoration: index % 2 == 0
                                      ? new BoxDecoration(
                                          borderRadius:
                                              new BorderRadius.circular(
                                            4.0,
                                          ),
                                          color: Color(0xff5FD3FF))
                                      : null,
                                );
                              })),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
