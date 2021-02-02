import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(new MaterialApp(
    home: DataTable(),
  ));
}

class DataTable extends StatefulWidget {
  @override
  DataTableState createState() => new DataTableState();
}

class DataTableState extends State<DataTable> {
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
                            itemCount: result.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return Container(
                                child: Text(result[index]['firstname']),
                              );
                            }),
                      ),
                      Container(
                        width: 300,
                        height: 600,
                        margin: EdgeInsets.only(left: 10),
                        child: ListView.builder(
                            itemCount: result.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return Container(
                                child: Text(result[index]['lastname']),
                              );
                            }),
                      ),
                      Container(
                        width: 300,
                        height: 600,
                        margin: EdgeInsets.only(left: 10),
                        child: ListView.builder(
                            itemCount: result.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return Container(
                                child: Text(result[index]['username']),
                              );
                            }),
                      ),
                    ]),
                    // TableRow(children: [
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[1]['firstname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[1]['lastname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[1]['username'])),
                    // ]),
                    // TableRow(children: [
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[2]['firstname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[2]['lastname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[2]['username'])),
                    // ]),
                    // TableRow(children: [
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[3]['firstname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[3]['lastname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[3]['username'])),
                    // ]),
                    // TableRow(children: [
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[4]['firstname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[4]['lastname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[4]['username'])),
                    // ]),
                    // TableRow(children: [
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[5]['firstname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[5]['lastname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[5]['username'])),
                    // ]),
                    // TableRow(children: [
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[6]['firstname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[6]['lastname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[6]['username'])),
                    // ]),
                    // TableRow(children: [
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[7]['firstname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[7]['lastname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[7]['username'])),
                    // ]),
                    // TableRow(children: [
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[8]['firstname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[8]['lastname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[8]['username'])),
                    // ]),
                    // TableRow(children: [
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[9]['firstname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[9]['lastname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[9]['username'])),
                    // ]),
                    // TableRow(children: [
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[10]['firstname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[10]['lastname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[10]['username'])),
                    // ]),
                    // TableRow(children: [
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[11]['firstname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[11]['lastname'])),
                    //   Container(
                    //       width: 300,
                    //       height: 30,
                    //       margin: EdgeInsets.only(left: 10),
                    //       child: Text(result[11]['username'])),
                    // ]),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
