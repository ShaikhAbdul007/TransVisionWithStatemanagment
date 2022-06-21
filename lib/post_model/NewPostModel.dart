/// partycode : "P236"
/// qty : "4"
/// size : "20"
/// type : "HD"
/// commodity : "General"
/// classs : ""
/// unno : ""
/// freight : "0"
/// weight : "14"
/// icdfrom : ""
/// icdto : ""
/// pol : "INNSA"
/// pod : "AEJEA"
/// rateagreedby : ""

class NewPostModel {
  NewPostModel({
      String? partycode, 
      String? qty, 
      String? size, 
      String? type, 
      String? commodity, 
      String? classs, 
      String? unno, 
      String? freight, 
      String? weight, 
      String? icdfrom, 
      String? icdto, 
      String? pol, 
      String? pod, 
      String? rateagreedby,}){
    _partycode = partycode;
    _qty = qty;
    _size = size;
    _type = type;
    _commodity = commodity;
    _classs = classs;
    _unno = unno;
    _freight = freight;
    _weight = weight;
    _icdfrom = icdfrom;
    _icdto = icdto;
    _pol = pol;
    _pod = pod;
    _rateagreedby = rateagreedby;
}

  NewPostModel.fromJson(dynamic json) {
    _partycode = json['partycode'];
    _qty = json['qty'];
    _size = json['size'];
    _type = json['type'];
    _commodity = json['commodity'];
    _classs = json['classs'];
    _unno = json['unno'];
    _freight = json['freight'];
    _weight = json['weight'];
    _icdfrom = json['icdfrom'];
    _icdto = json['icdto'];
    _pol = json['pol'];
    _pod = json['pod'];
    _rateagreedby = json['rateagreedby'];
  }
  String? _partycode;
  String? _qty;
  String? _size;
  String? _type;
  String? _commodity;
  String? _classs;
  String? _unno;
  String? _freight;
  String? _weight;
  String? _icdfrom;
  String? _icdto;
  String? _pol;
  String? _pod;
  String? _rateagreedby;
NewPostModel copyWith({  String? partycode,
  String? qty,
  String? size,
  String? type,
  String? commodity,
  String? classs,
  String? unno,
  String? freight,
  String? weight,
  String? icdfrom,
  String? icdto,
  String? pol,
  String? pod,
  String? rateagreedby,
}) => NewPostModel(  partycode: partycode ?? _partycode,
  qty: qty ?? _qty,
  size: size ?? _size,
  type: type ?? _type,
  commodity: commodity ?? _commodity,
  classs: classs ?? _classs,
  unno: unno ?? _unno,
  freight: freight ?? _freight,
  weight: weight ?? _weight,
  icdfrom: icdfrom ?? _icdfrom,
  icdto: icdto ?? _icdto,
  pol: pol ?? _pol,
  pod: pod ?? _pod,
  rateagreedby: rateagreedby ?? _rateagreedby,
);
  String? get partycode => _partycode;
  String? get qty => _qty;
  String? get size => _size;
  String? get type => _type;
  String? get commodity => _commodity;
  String? get classs => _classs;
  String? get unno => _unno;
  String? get freight => _freight;
  String? get weight => _weight;
  String? get icdfrom => _icdfrom;
  String? get icdto => _icdto;
  String? get pol => _pol;
  String? get pod => _pod;
  String? get rateagreedby => _rateagreedby;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['partycode'] = _partycode;
    map['qty'] = _qty;
    map['size'] = _size;
    map['type'] = _type;
    map['commodity'] = _commodity;
    map['classs'] = _classs;
    map['unno'] = _unno;
    map['freight'] = _freight;
    map['weight'] = _weight;
    map['icdfrom'] = _icdfrom;
    map['icdto'] = _icdto;
    map['pol'] = _pol;
    map['pod'] = _pod;
    map['rateagreedby'] = _rateagreedby;
    return map;
  }

}