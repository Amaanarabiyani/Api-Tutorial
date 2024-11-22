/// lat : "-37.3159"
/// lng : "81.1496"

class Geo {
  Geo({
      String? lat, 
      String? lng,}){
    _lat = lat;
    _lng = lng;
}

  Geo.fromJson(dynamic json) {
    _lat = json['lat'];
    _lng = json['lng'];
  }
  String? _lat;
  String? _lng;
Geo copyWith({  String? lat,
  String? lng,
}) => Geo(  lat: lat ?? _lat,
  lng: lng ?? _lng,
);
  String? get lat => _lat;
  String? get lng => _lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = _lat;
    map['lng'] = _lng;
    return map;
  }

}