/// code : "DV"
/// containerType : "DRY VAN"

class TypeModel {
  TypeModel({
    String? code,
    String? containerType,
  }) {
    _code = code;
    _containerType = containerType;
  }

  TypeModel.fromJson(dynamic json) {
    _code = json['code'];
    _containerType = json['containerType'];
  }
  String? _code;
  String? _containerType;

  TypeModel copyWith({
    String? code,
    String? containerType,
  }) =>
      TypeModel(
        code: code ?? _code,
        containerType: containerType ?? _containerType,
      );
  String? get code => _code;
  String? get containerType => _containerType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['containerType'] = _containerType;
    return map;
  }

  @override
  toString() => '$_containerType';
}
