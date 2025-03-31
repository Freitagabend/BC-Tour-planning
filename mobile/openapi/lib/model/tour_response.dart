//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TourResponse {
  /// Returns a new [TourResponse] instance.
  TourResponse({
    required this.optimizedRoute,
    this.alternatives = const [],
  });

  Route optimizedRoute;

  List<Route>? alternatives;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TourResponse &&
    other.optimizedRoute == optimizedRoute &&
    _deepEquality.equals(other.alternatives, alternatives);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (optimizedRoute.hashCode) +
    (alternatives == null ? 0 : alternatives!.hashCode);

  @override
  String toString() => 'TourResponse[optimizedRoute=$optimizedRoute, alternatives=$alternatives]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'optimized_route'] = this.optimizedRoute;
    if (this.alternatives != null) {
      json[r'alternatives'] = this.alternatives;
    } else {
      json[r'alternatives'] = null;
    }
    return json;
  }

  /// Returns a new [TourResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TourResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TourResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TourResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TourResponse(
        optimizedRoute: Route.fromJson(json[r'optimized_route'])!,
        alternatives: Route.listFromJson(json[r'alternatives']),
      );
    }
    return null;
  }

  static List<TourResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TourResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TourResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TourResponse> mapFromJson(dynamic json) {
    final map = <String, TourResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TourResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TourResponse-objects as value to a dart map
  static Map<String, List<TourResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TourResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TourResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'optimized_route',
  };
}

