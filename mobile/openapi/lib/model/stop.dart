//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Stop {
  /// Returns a new [Stop] instance.
  Stop({
    required this.name,
    this.lat,
    this.lon,
  });

  String name;

  num? lat;

  num? lon;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Stop &&
    other.name == name &&
    other.lat == lat &&
    other.lon == lon;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (lat == null ? 0 : lat!.hashCode) +
    (lon == null ? 0 : lon!.hashCode);

  @override
  String toString() => 'Stop[name=$name, lat=$lat, lon=$lon]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
    if (this.lat != null) {
      json[r'lat'] = this.lat;
    } else {
      json[r'lat'] = null;
    }
    if (this.lon != null) {
      json[r'lon'] = this.lon;
    } else {
      json[r'lon'] = null;
    }
    return json;
  }

  /// Returns a new [Stop] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Stop? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Stop[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Stop[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Stop(
        name: mapValueOfType<String>(json, r'name')!,
        lat: json[r'lat'] == null
            ? null
            : num.parse('${json[r'lat']}'),
        lon: json[r'lon'] == null
            ? null
            : num.parse('${json[r'lon']}'),
      );
    }
    return null;
  }

  static List<Stop> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Stop>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Stop.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Stop> mapFromJson(dynamic json) {
    final map = <String, Stop>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Stop.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Stop-objects as value to a dart map
  static Map<String, List<Stop>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Stop>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Stop.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

