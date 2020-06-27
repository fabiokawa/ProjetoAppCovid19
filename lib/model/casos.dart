class Casos {
  String country;
  String countryCode;
  String province;
  String city;
  String cityCode;
  String lat;
  String lon;
  int cases;
  String status;
  String date;

  Casos(
      {this.country,
        this.countryCode,
        this.province,
        this.city,
        this.cityCode,
        this.lat,
        this.lon,
        this.cases,
        this.status,
        this.date});

  Casos.fromJson(Map<String, dynamic> json) {
    country = json['Country'];
    countryCode = json['CountryCode'];
    province = json['Province'];
    city = json['City'];
    cityCode = json['CityCode'];
    lat = json['Lat'];
    lon = json['Lon'];
    cases = json['Cases'];
    status = json['Status'];
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Country'] = this.country;
    data['CountryCode'] = this.countryCode;
    data['Province'] = this.province;
    data['City'] = this.city;
    data['CityCode'] = this.cityCode;
    data['Lat'] = this.lat;
    data['Lon'] = this.lon;
    data['Cases'] = this.cases;
    data['Status'] = this.status;
    data['Date'] = this.date;
    return data;
  }

  @override
  String toString() {
    return 'Casos{country: $country, countryCode: $countryCode, province: $province, city: $city, cityCode: $cityCode, lat: $lat, lon: $lon, cases: $cases, status: $status, date: $date}';
  }


}