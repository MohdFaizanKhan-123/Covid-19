import 'package:covid/search/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List worldData;

  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchCountryData();
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF3E5F5),
        appBar: AppBar(
          backgroundColor: Color(0xffF3E5F5).withOpacity(0.5),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              color: Color(0xffAB47BC),
              onPressed: () {
                showSearch(context: context, delegate: Search(worldData));
              },
            )
          ],
        ),
        body: worldData == null
            ? Column(
                children: <Widget>[
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color(0xffB39DDB),
                    child: Container(
                      height: 100,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 200,
                              padding: EdgeInsets.all(5.0),
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    worldData[index]['country'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Image.network(
                                    worldData[index]['countryInfo']['flag'],
                                    height: 30,
                                    width: 50,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.all(2.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      'Confirmed: ' +
                                          worldData[index]['cases'].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.0,
                                          color: Color(0xff7E57C2)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Active: ' +
                                          worldData[index]['active'].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.0,
                                          color: Color(0xff7E57C2)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Recovered: ' +
                                          worldData[index]['recovered']
                                              .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.0,
                                          color: Color(0xff7E57C2)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Deaths: ' +
                                          worldData[index]['deaths'].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.0,
                                          color: Color(0xff7E57C2)),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: worldData == null ? 0 : worldData.length,
              ),
      ),
    );
  }
}
