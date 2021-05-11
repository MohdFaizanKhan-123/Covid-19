class RegionData {
  String region;
  int activeCases;
  int newInfected;
  int recovered;
  int newRecovered;
  int deceased;
  int newDeceased;
  int totalInfected;

  RegionData(
      {this.region,
      this.activeCases,
      this.newInfected,
      this.recovered,
      this.newRecovered,
      this.deceased,
      this.newDeceased,
      this.totalInfected});

  RegionData.fromJson(Map<String, dynamic> json) {
    region = json['region'];
    activeCases = json['activeCases'];
    newInfected = json['newInfected'];
    recovered = json['recovered'];
    newRecovered = json['newRecovered'];
    deceased = json['deceased'];
    newDeceased = json['newDeceased'];
    totalInfected = json['totalInfected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['region'] = this.region;
    data['activeCases'] = this.activeCases;
    data['newInfected'] = this.newInfected;
    data['recovered'] = this.recovered;
    data['newRecovered'] = this.newRecovered;
    data['deceased'] = this.deceased;
    data['newDeceased'] = this.newDeceased;
    data['totalInfected'] = this.totalInfected;
    return data;
  }
}
