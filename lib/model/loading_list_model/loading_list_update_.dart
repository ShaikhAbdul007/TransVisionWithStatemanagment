import 'package:intl/intl.dart';

/// Weight : "100"
/// IMCO : "100"
/// Status : "100"
/// Stow : "100"
/// Remark : "100"
/// Transportation : "100"
/// partycode : "P1440"
/// vesselname : "BOTANY BAY"
/// voyage : "E050"
/// Container : "CRXU3016164"
/// Size : "20"
/// Type : "HD"

class LoadingListUpdate {
  LoadingListUpdate({
    String? weight,
    String? imco,
    String? status,
    String? stow,
    String? remark,
    String? transportation,
    String? partycode,
    String? vesselname,
    String? voyage,
    String? container,
    num? size,
    String? type,
  }) {
    _weight = weight;
    _imco = imco;
    _status = status;
    _stow = stow;
    _remark = remark;
    _transportation = transportation;
    _partycode = partycode;
    _vesselname = vesselname;
    _voyage = voyage;
    _container = container;
    _size = size;
    _type = type;
  }

  LoadingListUpdate.fromJson(dynamic json) {
    _weight = json['Weight'];
    _imco = json['IMCO'];
    _status = json['Status'];
    _stow = json['Stow'];
    _remark = json['Remark'];
    _transportation = json['Transportation'];
    _partycode = json['partycode'];
    _vesselname = json['vesselname'];
    _voyage = json['voyage'];
    _container = json['Container'];
    _size = json['Size'];
    _type = json['Type'];
  }
  String? _weight;
  String? _imco;
  String? _status;
  String? _stow;
  String? _remark;
  String? _transportation;
  String? _partycode;
  String? _vesselname;
  String? _voyage;
  String? _container;
  num? _size;
  String? _type;
  LoadingListUpdate copyWith({
    String? weight,
    String? imco,
    String? status,
    String? stow,
    String? remark,
    String? transportation,
    String? partycode,
    String? vesselname,
    String? voyage,
    String? container,
    num? size,
    String? type,
  }) =>
      LoadingListUpdate(
        weight: weight ?? _weight,
        imco: imco ?? _imco,
        status: status ?? _status,
        stow: stow ?? _stow,
        remark: remark ?? _remark,
        transportation: transportation ?? _transportation,
        partycode: partycode ?? _partycode,
        vesselname: vesselname ?? _vesselname,
        voyage: voyage ?? _voyage,
        container: container ?? _container,
        size: size ?? _size,
        type: type ?? _type,
      );
  String? get weight => _weight;
  String? get imco => _imco;
  String? get status => _status;
  String? get stow => _stow;
  String? get remark => _remark;
  String? get transportation => _transportation;
  String? get partycode => _partycode;
  String? get vesselname => _vesselname;
  String? get voyage => _voyage;
  String? get container => _container;
  num? get size => _size;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Weight'] = _weight;
    map['IMCO'] = _imco;
    map['Status'] = _status;
    map['Stow'] = _stow;
    map['Remark'] = _remark;
    map['Transportation'] = _transportation;
    map['partycode'] = _partycode;
    map['vesselname'] = _vesselname;
    map['voyage'] = _voyage;
    map['Container'] = _container;
    map['Size'] = _size;
    map['Type'] = _type;
    return map;
  }
}
