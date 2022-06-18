/// vessel : "D ANGELS"

// class Vessel {
//   Vessel({
//     String? vessel,
//   }) {
//     _vessel = vessel;
//   }

//   Vessel.fromJson(dynamic json) {
//     _vessel = json['vessel'];
//   }
//   String? _vessel;
//   Vessel copyWith({
//     String? vessel,
//   }) =>
//       Vessel(
//         vessel: vessel ?? _vessel,
//       );
//   String? get vessel => _vessel;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['vessel'] = _vessel;
//     return map;
//   }
// }

class Newvessel {
  Newvessel({
    String? vessel,
  }) {
    _vessel = vessel;
  }

  Newvessel.fromJson(dynamic json) {
    _vessel = json['vessel'];
  }
  String? _vessel;
  Newvessel copyWith({
    String? vessel,
  }) =>
      Newvessel(
        vessel: vessel ?? _vessel,
      );
  String? get vessel => _vessel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vessel'] = _vessel;
    return map;
  }
}
