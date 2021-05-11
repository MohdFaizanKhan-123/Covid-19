import 'dart:convert';

import 'package:covid/model/vaccination.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';

class VaccinationGraph extends StatefulWidget {
  VaccinationGraph({Key key}) : super(key: key);

  @override
  _VaccinationGraphState createState() => _VaccinationGraphState();
}

class _VaccinationGraphState extends State<VaccinationGraph> {
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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffB39DDB),
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
                        return PieChart(
                          dataMap: {
                            'Total Doses': data.totalDoses.toDouble(),
                            'Total Vaccinated': data.totalVaccinated.toDouble(),
                            'Fully Vaccinated':
                                data.totalFullyVaccinated.toDouble(),
                            'Population': data.population.toDouble(),
                          },
                          colorList: [
                            Colors.redAccent[100],
                            Color(0xff4FC3F7),
                            Color(0xff81C784),
                            Color(0xffFFB74D)
                          ],
                          animationDuration: Duration(milliseconds: 800),
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          ringStrokeWidth: 30,
                          chartLegendSpacing: 50,
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
      ),
    );
  }
}
