class Vaccination {
  var cases;
  var deaths;
  var recovered;

  Vaccination({this.cases, this.deaths, this.recovered});

  factory Vaccination.fromJson(final json) {
    return Vaccination(
        cases: json["cases"],
        deaths: json["deaths"],
        recovered: json["recovered"]);
  }
}
