import 'dart:convert';
import 'package:covid/screens/india.dart';
import 'package:covid/model/Tcases.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = "https://coronavirus-19-api.herokuapp.com/all";

  Future<Vaccination> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );
    if (response.statusCode == 200) {
      final convertDataJson = jsonDecode(response.body);

      return Vaccination.fromJson(convertDataJson);
    } else {
      throw Exception("Try to reload");
    }
  }

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  navigateToCountry() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  navigateToIndia() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => IndiaData()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3E5F5),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FutureBuilder<Vaccination>(
                  future: getJsonData(),
                  builder: (BuildContext context, Snapshot) {
                    if (Snapshot.hasData) {
                      final covid = Snapshot.data;
                      return Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Center(
                              child: Container(
                                child: Image.asset(
                                  "images/wear_mask.png",
                                  width: 150.0,
                                  height: 150.0,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                "Global COVID-19",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                  color: Color(0xffB39DDB),
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                              width: double.infinity,
                              height: 100.0,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 10.0,
                                color: Color(0xff4DB6AC),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            "Global",
                                            style: TextStyle(
                                                color: Color(0xff004D40),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15.0),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            "Total Cases",
                                            style: TextStyle(
                                                color: Colors.white60,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 22.0),
                                          ),
                                          Text(
                                            "${covid.cases}",
                                            style: TextStyle(
                                                color: Color(0xff004D40),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20.0),
                                          )
                                        ],
                                      ),
                                      Image.asset(
                                        "images/covidBlue.png",
                                        width: 75,
                                        height: 75.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                              width: double.infinity,
                              height: 100.0,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 10.0,
                                color: Color(0xff64B5F6),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            "Global",
                                            style: TextStyle(
                                                color: Color(0xff0D47A1),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15.0),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            "Total Deaths",
                                            style: TextStyle(
                                                color: Colors.white60,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 22.0),
                                          ),
                                          Text(
                                            "${covid.deaths}",
                                            style: TextStyle(
                                                color: Color(0xff0D47A1),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20.0),
                                          )
                                        ],
                                      ),
                                      Image.asset(
                                        "images/death.png",
                                        width: 75,
                                        height: 75.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                              width: double.infinity,
                              height: 100.0,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 10.0,
                                color: Color(0xffBB86FC),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            "Global",
                                            style: TextStyle(
                                                color: Colors.purple,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15.0),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            "Total Recoveries",
                                            style: TextStyle(
                                                color: Colors.white60,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 22.0),
                                          ),
                                          Text(
                                            "${covid.recovered}",
                                            style: TextStyle(
                                                color: Colors.purple,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20.0),
                                          )
                                        ],
                                      ),
                                      Image.asset(
                                        "images/recover.png",
                                        width: 75,
                                        height: 75.0,
                                        colorBlendMode: BlendMode.modulate,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (Snapshot.hasError) {
                      return Text(Snapshot.error.toString());
                    } else
                      return CircularProgressIndicator();
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
