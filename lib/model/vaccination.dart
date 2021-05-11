class VaccintaionData {
  int totalDoses;
  int totalVaccinated;
  int totalFullyVaccinated;
  int population;
  String lastUpdated;
  String ref;

  VaccintaionData(
      {this.totalDoses,
      this.totalVaccinated,
      this.totalFullyVaccinated,
      this.population,
      this.lastUpdated,
      this.ref});

  VaccintaionData.fromJson(Map<String, dynamic> json) {
    totalDoses = json['total_doses'];
    totalVaccinated = json['total_vaccinated'];
    totalFullyVaccinated = json['total_fully_vaccinated'];
    population = json['population'];
    lastUpdated = json['last_updated'];
    ref = json['ref'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_doses'] = this.totalDoses;
    data['total_vaccinated'] = this.totalVaccinated;
    data['total_fully_vaccinated'] = this.totalFullyVaccinated;
    data['population'] = this.population;
    data['last_updated'] = this.lastUpdated;
    data['ref'] = this.ref;
    return data;
  }
}
