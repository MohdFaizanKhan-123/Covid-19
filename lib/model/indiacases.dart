class IndiaCases {
  int activeCases;
  int activeCasesNew;
  int recovered;
  int recoveredNew;
  int deaths;
  int deathsNew;
  int previousDayTests;
  int totalCases;
  String sourceUrl;
  String lastUpdatedAtApify;

  IndiaCases(
      {this.activeCases,
      this.activeCasesNew,
      this.recovered,
      this.recoveredNew,
      this.deaths,
      this.deathsNew,
      this.previousDayTests,
      this.totalCases,
      this.sourceUrl,
      this.lastUpdatedAtApify});

  IndiaCases.fromJson(Map<String, dynamic> json) {
    activeCases = json['activeCases'];
    activeCasesNew = json['activeCasesNew'];
    recovered = json['recovered'];
    recoveredNew = json['recoveredNew'];
    deaths = json['deaths'];
    deathsNew = json['deathsNew'];
    previousDayTests = json['previousDayTests'];
    totalCases = json['totalCases'];
    sourceUrl = json['sourceUrl'];
    lastUpdatedAtApify = json['lastUpdatedAtApify'];
  }
}
