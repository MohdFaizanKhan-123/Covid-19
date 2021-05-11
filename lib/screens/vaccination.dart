import 'dart:convert';

import 'package:covid/graph/vaccinationgraph.dart';
import 'package:covid/model/vaccination.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class VaccinationData extends StatefulWidget {
  VaccinationData({Key key}) : super(key: key);

  @override
  _VaccinationDataState createState() => _VaccinationDataState();
}

class _VaccinationDataState extends State<VaccinationData> {
  int _currentIndex = 0;

  final String url =
      "https://india-covid19vaccine.github.io/api/national_latest.json";
  Future<VaccintaionData> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );
    if (response.statusCode == 200) {
      final convertDataaJson = jsonDecode(response.body);

      return VaccintaionData.fromJson(convertDataaJson[0]);
    } else {
      throw Exception("Try to reload");
    }
  }

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  navigatetovaccinationgraph() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => VaccinationGraph()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF3E5F5),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FutureBuilder<VaccintaionData>(
                  future: getJsonData(),
                  builder: (BuildContext context, Snapshot) {
                    if (Snapshot.hasData) {
                      final data = Snapshot.data;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Center(
                            child: Container(
                              padding: EdgeInsets.all(0),
                              child: Image.asset(
                                "images/c.png",
                                scale: 6,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Vaccination In India",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                color: Color(0xffB39DDB),
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              )),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.0,
                                ),
                                width: double.infinity,
                                height: 100.0,
                                child: Expanded(
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    elevation: 10.0,
                                    color: Color(0xffB39DDB),
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
                                                "India",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 15.0),
                                              ),
                                              SizedBox(
                                                height: 10.0,
                                              ),
                                              Text(
                                                "Total Doses",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 22.0),
                                              ),
                                              Text(
                                                "${data.totalDoses}",
                                                style: TextStyle(
                                                    color: Color(0xff7E57C2),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 20.0),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
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
                                  color: Color(0xff9FA8DA),
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
                                              "India",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15.0),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              "Total Vaccinated",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 22.0),
                                            ),
                                            Text(
                                              "${data.totalVaccinated}",
                                              style: TextStyle(
                                                  color: Color(0xff3F51B5),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20.0),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
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
                                  color: Color(0xff4FC3F7),
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
                                              "India",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15.0),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              "Fully Vaccinated",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20.5),
                                            ),
                                            Text(
                                              "${data.totalFullyVaccinated}",
                                              style: TextStyle(
                                                  color: Color(0xfF01579B),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 20.0),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
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
