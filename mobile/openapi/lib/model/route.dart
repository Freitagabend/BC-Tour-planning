//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Route {
  /// Returns a new [Route] instance.
  Route({
    this.order = const [],
    required this.distanceKm,
    required this.durationMin,
    this.path = const [],
  });

  List<String> order;

  num distanceKm;

  num durationMin;

  List<List<num>> path;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Route &&
    _deepEquality.equals(other.order, order) &&
    other.distanceKm == distanceKm &&
    other.durationMin == durationMin &&
    _deepEquality.equals(other.path, path);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (order.hashCode) +
    (distanceKm.hashCode) +
    (durationMin.hashCode) +
    (path.hashCode);

  @override
  String toString() => 'Route[order=$order, distanceKm=$distanceKm, durationMin=$durationMin, path=$path]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'order'] = this.order;
      json[r'distance_km'] = this.distanceKm;
      json[r'duration_min'] = this.durationMin;
      json[r'path'] = this.path;
    return json;
  }

  /// Returns a new [Route] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Route? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Route[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Route[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Route(
        order: json[r'order'] is Iterable
            ? (json[r'order'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        distanceKm: num.parse('${json[r'distance_km']}'),
        durationMin: num.parse('${json[r'duration_min']}'),
        path: json[r'path'] is List
          ? (json[r'path'] as List).map((e) =>
              e == null ? const  <num>[] : (e as List).cast<num>()
            ).toList()
          :  const [],
      );
    }
    return null;
  }

  static List<Route> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Route>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Route.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Route> mapFromJson(dynamic json) {
    final map = <String, Route>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Route.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Route-objects as value to a dart map
  static Map<String, List<Route>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Route>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Route.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'order',
    'distance_km',
    'duration_min',
    'path',
  };
}

