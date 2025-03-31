//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TourRequest {
  /// Returns a new [TourRequest] instance.
  TourRequest({
    this.stops = const [],
    this.optimize,
  });

  List<Stop> stops;

  bool? optimize;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TourRequest &&
    _deepEquality.equals(other.stops, stops) &&
    other.optimize == optimize;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (stops.hashCode) +
    (optimize == null ? 0 : optimize!.hashCode);

  @override
  String toString() => 'TourRequest[stops=$stops, optimize=$optimize]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'stops'] = this.stops;
    if (this.optimize != null) {
      json[r'optimize'] = this.optimize;
    } else {
      json[r'optimize'] = null;
    }
    return json;
  }

  /// Returns a new [TourRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TourRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TourRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TourRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TourRequest(
        stops: Stop.listFromJson(json[r'stops']),
        optimize: mapValueOfType<bool>(json, r'optimize'),
      );
    }
    return null;
  }

  static List<TourRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TourRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TourRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TourRequest> mapFromJson(dynamic json) {
    final map = <String, TourRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TourRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TourRequest-objects as value to a dart map
  static Map<String, List<TourRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TourRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TourRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'stops',
  };
}

