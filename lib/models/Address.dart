import 'Geo.dart';

/// street : "Kulas Light"
/// suite : "Apt. 556"
/// city : "Gwenborough"
/// zipcode : "92998-3874"
/// geo : {"lat":"-37.3159","lng":"81.1496"}

class Address {
  Address({
      String? street, 
      String? suite, 
      String? city, 
      String? zipcode, 
      Geo? geo,}){
    _street = street;
    _suite = suite;
    _city = city;
    _zipcode = zipcode;
    _geo = geo;
}

  Address.fromJson(dynamic json) {
    _street = json['street'];
    _suite = json['suite'];
    _city = json['city'];
    _zipcode = json['zipcode'];
    _geo = json['geo'] != null ? Geo.fromJson(json['geo']) : null;
  }
  String? _street;
  String? _suite;
  String? _city;
  String? _zipcode;
  Geo? _geo;
Address copyWith({  String? street,
  String? suite,
  String? city,
  String? zipcode,
  Geo? geo,
}) => Address(  street: street ?? _street,
  suite: suite ?? _suite,
  city: city ?? _city,
  zipcode: zipcode ?? _zipcode,
  geo: geo ?? _geo,
);
  String? get street => _street;
  String? get suite => _suite;
  String? get city => _city;
  String? get zipcode => _zipcode;
  Geo? get geo => _geo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = _street;
    map['suite'] = _suite;
    map['city'] = _city;
    map['zipcode'] = _zipcode;
    if (_geo != null) {
      map['geo'] = _geo?.toJson();
    }
    return map;
  }

}