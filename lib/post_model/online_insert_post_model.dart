/// classs : ""
/// commodity : "General"
/// freight : "0"
/// icdfrom : ""
/// icdto : ""
/// partycode : "P236"
/// pod : "AEJEA"
/// pol : "INNSA"
/// qty : "4"
/// rateagreedby : ""
/// result : "1 record inserted succesfully"
/// size : "20"
/// type : "HD"
/// unno : ""
/// weight : "14"

class BookingResDataModel {
  BookingResDataModel({
    num? classs,
    String? commodity,
    String? freight,
    String? icdfrom,
    String? icdto,
    String? partycode,
    String? pod,
    String? pol,
    String? qty,
    String? rateagreedby,
    String? result,
    String? size,
    String? type,
    String? unno,
    String? weight,
  }) {
    _classs = classs;
    _commodity = commodity;
    _freight = freight;
    _icdfrom = icdfrom;
    _icdto = icdto;
    _partycode = partycode;
    _pod = pod;
    _pol = pol;
    _qty = qty;
    _rateagreedby = rateagreedby;
    _result = result;
    _size = size;
    _type = type;
    _unno = unno;
    _weight = weight;
  }

  BookingResDataModel.fromJson(dynamic json) {
    _classs = json['classs'];
    _commodity = json['commodity'];
    _freight = json['freight'];
    _icdfrom = json['icdfrom'];
    _icdto = json['icdto'];
    _partycode = json['partycode'];
    _pod = json['pod'];
    _pol = json['pol'];
    _qty = json['qty'];
    _rateagreedby = json['rateagreedby'];
    _result = json['result'];
    _size = json['size'];
    _type = json['type'];
    _unno = json['unno'];
    _weight = json['weight'];
  }
  num? _classs;
  String? _commodity;
  String? _freight;
  String? _icdfrom;
  String? _icdto;
  String? _partycode;
  String? _pod;
  String? _pol;
  String? _qty;
  String? _rateagreedby;
  String? _result;
  String? _size;
  String? _type;
  String? _unno;
  String? _weight;
  BookingResDataModel copyWith({
    num? classs,
    String? commodity,
    String? freight,
    String? icdfrom,
    String? icdto,
    String? partycode,
    String? pod,
    String? pol,
    String? qty,
    String? rateagreedby,
    String? result,
    String? size,
    String? type,
    String? unno,
    String? weight,
  }) =>
      BookingResDataModel(
        classs: classs ?? _classs,
        commodity: commodity ?? _commodity,
        freight: freight ?? _freight,
        icdfrom: icdfrom ?? _icdfrom,
        icdto: icdto ?? _icdto,
        partycode: partycode ?? _partycode,
        pod: pod ?? _pod,
        pol: pol ?? _pol,
        qty: qty ?? _qty,
        rateagreedby: rateagreedby ?? _rateagreedby,
        result: result ?? _result,
        size: size ?? _size,
        type: type ?? _type,
        unno: unno ?? _unno,
        weight: weight ?? _weight,
      );
  num? get classs => _classs;
  String? get commodity => _commodity;
  String? get freight => _freight;
  String? get icdfrom => _icdfrom;
  String? get icdto => _icdto;
  String? get partycode => _partycode;
  String? get pod => _pod;
  String? get pol => _pol;
  String? get qty => _qty;
  String? get rateagreedby => _rateagreedby;
  String? get result => _result;
  String? get size => _size;
  String? get type => _type;
  String? get unno => _unno;
  String? get weight => _weight;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['classs'] = _classs;
    map['commodity'] = _commodity;
    map['freight'] = _freight;
    map['icdfrom'] = _icdfrom;
    map['icdto'] = _icdto;
    map['partycode'] = _partycode;
    map['pod'] = _pod;
    map['pol'] = _pol;
    map['qty'] = _qty;
    map['rateagreedby'] = _rateagreedby;
    map['result'] = _result;
    map['size'] = _size;
    map['type'] = _type;
    map['unno'] = _unno;
    map['weight'] = _weight;
    return map;
  }
}
