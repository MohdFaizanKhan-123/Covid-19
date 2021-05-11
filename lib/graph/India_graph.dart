import 'dart:convert';
import 'package:covid/graph/vaccinationgraph.dart';
import 'package:covid/screens/india.dart';
import 'package:covid/screens/indianStaes.dart';
import 'package:covid/search/search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';
import '../model/indiacases.dart';

class IndiaGraph extends StatefulWidget {
  IndiaGraph({Key key}) : super(key: key);

  @override
  _IndiaGraphState createState() => _IndiaGraphState();
}

class _IndiaGraphState extends State<IndiaGraph> {
  final String url =
      "https://api.apify.com/v2/key-value-stores/toDWvRj1JpTXiM8FF/records/LATEST?disableRedirect=true";

  Future<IndiaCases> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );
    if (response.statusCode == 200) {
      final convertDataJson = jsonDecode(response.body);

      return IndiaCases.fromJson(convertDataJson);
    } else {
      throw Exception("Try to reload");
    }
  }

  Future fetchData() async {
    getJsonData();
  }

  navigateToIndia() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => IndiaData()));
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffF3E5F5).withOpacity(0.5),
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Color(0xffAB47BC),
          ),
        ),
        backgroundColor: Color(0xffF3E5F5),
        body: Container(
          child: Column(
            children: [
              Text(
                "India's Graph",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  color: Color(0xffB39DDB),
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                )),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FutureBuilder<IndiaCases>(
                      future: getJsonData(),
                      builder: (BuildContext context, Snapshot) {
                        if (Snapshot.hasData) {
                          final covidData = Snapshot.data;
                          return PieChart(
                            dataMap: {
                              'Active Cases': covidData.activeCases.toDouble(),
                              'Deaths': covidData.deaths.toDouble(),
                              'Recovered': covidData.recovered.toDouble(),
                              'Total Cases': covidData.totalCases.toDouble(),
                            },
                            colorList: [
                              Color(0xffB39DDB),
                              Color(0xff4FC3F7),
                              Color(0xff81C784),
                              Color(0xffFFB74D)
                            ],
                            animationDuration: Duration(milliseconds: 800),
                            chartRadius: MediaQuery.of(context).size.width / 3,
                            ringStrokeWidth: 32,
                            chartLegendSpacing: 60,
                            legendOptions: LegendOptions(
                              showLegendsInRow: false,
                              legendPosition: LegendPosition.right,
                              showLegends: true,
                              legendTextStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            chartValuesOptions: ChartValuesOptions(
                              showChartValueBackground: false,
                              showChartValues: true,
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: true,
                              decimalPlaces: 1,
                            ),
                          );
                        } else if (Snapshot.hasError) {
                          return Text(Snapshot.error.toString());
                        } else
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(child: CircularProgressIndicator()),
                            ],
                          );
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Expanded(
                flex: 7,
                child: Stack(
                  children: [
                    Container(
                      height: double.maxFinite,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Color(0xffB39DDB),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "Vaccination Graph",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            )),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: 500,
                            height: 180,
                            child: VaccinationGraph(),
                          ),
                          Expanded(
                            child: Text(
                              "Design And Developed, by Mohd. Faizan Khan",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
