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
    print(response.body);

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
          // child: new Column(
          //   crossAxisAlignment: CrossAxisAlignment.stretch,
          //   children: <Widget>[
          //     new Card(
          //       child: new Container(
          //         child: new Text(result[index]['firstname']),
          //         padding: EdgeInsets.all(20.0),
          //       ),
          //     )
          //   ],
          // ),

          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(12),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.top,
                  border: TableBorder.all(
                      color: Colors.black, style: BorderStyle.solid, width: 2),
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
                          margin: EdgeInsets.only(left: 10),
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: result == null ? 0 : result.length,
                              itemBuilder: (context, index) {
                                return Text(result[index]['firstname']);
                              })),
                      Container(
                          width: 300,
                          height: 600,
                          margin: EdgeInsets.only(left: 10),
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: result == null ? 0 : result.length,
                              itemBuilder: (context, index) {
                                return Text(result[index]['lastname']);
                              })),
                      Container(
                          width: 300,
                          height: 600,
                          margin: EdgeInsets.only(left: 10),
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: result == null ? 0 : result.length,
                              itemBuilder: (context, index) {
                                return Text(result[index]['username']);
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
