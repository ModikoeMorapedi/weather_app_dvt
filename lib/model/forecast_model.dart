import 'main_model.dart';
import 'weather.dart';

class ForecastModel {
  String? cod;
  num? message;
  num? cnt;
  List<ListElement>? list;
  City? city;

  ForecastModel({this.cod, this.message, this.cnt, this.list, this.city});

  ForecastModel.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <ListElement>[];
      json['list'].forEach((v) {
        list!.add(new ListElement.fromJson(v));
      });
    }
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cod'] = this.cod;
    data['message'] = this.message;
    data['cnt'] = this.cnt;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    return data;
  }
}

class ListElement {
  num? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  num? visibility;
  num? pop;
  Sys? sys;
  String? dtTxt;
  String? icon;
  String? temp;

  ListElement(
      {this.temp,
      this.icon,
      this.dt,
      this.weather,
      this.main,
      this.clouds,
      this.wind,
      this.visibility,
      this.pop,
      this.sys,
      this.dtTxt});

  ListElement.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(new Weather.fromJson(v));
      });
    }
    clouds =
        json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null;
    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
    wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    pop = json['pop'];
    sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
    dtTxt = json['dt_txt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;

    if (this.weather != null) {
      data['weather'] = this.weather!.map((v) => v.toJson()).toList();
    }
    if (this.clouds != null) {
      data['clouds'] = this.clouds!.toJson();
    }
    if (this.wind != null) {
      data['wind'] = this.wind!.toJson();
    }
    data['visibility'] = this.visibility;
    data['pop'] = this.pop;
    if (this.sys != null) {
      data['sys'] = this.sys!.toJson();
    }
    data['dt_txt'] = this.dtTxt;
    return data;
  }
}

class Clouds {
  num? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all'] = this.all;
    return data;
  }
}

class Wind {
  num? speed;
  num? deg;
  num? gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speed'] = this.speed;
    data['deg'] = this.deg;
    data['gust'] = this.gust;
    return data;
  }
}

class Sys {
  String? pod;

  Sys({this.pod});

  Sys.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pod'] = this.pod;
    return data;
  }
}

class City {
  num? id;
  String? name;
  Coord? coord;
  String? country;
  num? population;
  num? timezone;
  num? sunrise;
  num? sunset;

  City(
      {this.id,
      this.name,
      this.coord,
      this.country,
      this.population,
      this.timezone,
      this.sunrise,
      this.sunset});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.coord != null) {
      data['coord'] = this.coord!.toJson();
    }
    data['country'] = this.country;
    data['population'] = this.population;
    data['timezone'] = this.timezone;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    return data;
  }
}

class Coord {
  num? lat;
  num? lon;

  Coord({this.lat, this.lon});

  Coord.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}
