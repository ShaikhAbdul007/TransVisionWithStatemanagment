/// Br : "INNSA"
/// ETD : "01-05-2022 00:00:00"
/// FPOD : "AEJEA"
/// blact : "TSVINNSA22042947"
/// blno : "2947"
/// bookingno : "5796"
/// fpodbr : "AEJEA4"
/// issuedate : "04-05-2022 00:00:00"
/// partyname : "COGO PORT PVT LTD"
/// place : "NHAVA SHEVA"
/// podis : "JEBEL ALI, UAE"
/// pol : "NHAVA SHEVA"
/// sailing : "30-04-2022 00:00:00"
/// vessel : "M.V. BINDI ISPA 177"

class BillOfLadingORefershModel {
  BillOfLadingORefershModel({
      String? br, 
      String? etd, 
      String? fpod, 
      String? blact, 
      String? blno, 
      String? bookingno, 
      String? fpodbr, 
      String? issuedate, 
      String? partyname, 
      String? place, 
      String? podis, 
      String? pol, 
      String? sailing, 
      String? vessel,}){
    _br = br;
    _etd = etd;
    _fpod = fpod;
    _blact = blact;
    _blno = blno;
    _bookingno = bookingno;
    _fpodbr = fpodbr;
    _issuedate = issuedate;
    _partyname = partyname;
    _place = place;
    _podis = podis;
    _pol = pol;
    _sailing = sailing;
    _vessel = vessel;
}

  BillOfLadingORefershModel.fromJson(dynamic json) {
    _br = json['Br'];
    _etd = json['ETD'];
    _fpod = json['FPOD'];
    _blact = json['blact'];
    _blno = json['blno'];
    _bookingno = json['bookingno'];
    _fpodbr = json['fpodbr'];
    _issuedate = json['issuedate'];
    _partyname = json['partyname'];
    _place = json['place'];
    _podis = json['podis'];
    _pol = json['pol'];
    _sailing = json['sailing'];
    _vessel = json['vessel'];
  }
  String? _br;
  String? _etd;
  String? _fpod;
  String? _blact;
  String? _blno;
  String? _bookingno;
  String? _fpodbr;
  String? _issuedate;
  String? _partyname;
  String? _place;
  String? _podis;
  String? _pol;
  String? _sailing;
  String? _vessel;
BillOfLadingORefershModel copyWith({  String? br,
  String? etd,
  String? fpod,
  String? blact,
  String? blno,
  String? bookingno,
  String? fpodbr,
  String? issuedate,
  String? partyname,
  String? place,
  String? podis,
  String? pol,
  String? sailing,
  String? vessel,
}) => BillOfLadingORefershModel(  br: br ?? _br,
  etd: etd ?? _etd,
  fpod: fpod ?? _fpod,
  blact: blact ?? _blact,
  blno: blno ?? _blno,
  bookingno: bookingno ?? _bookingno,
  fpodbr: fpodbr ?? _fpodbr,
  issuedate: issuedate ?? _issuedate,
  partyname: partyname ?? _partyname,
  place: place ?? _place,
  podis: podis ?? _podis,
  pol: pol ?? _pol,
  sailing: sailing ?? _sailing,
  vessel: vessel ?? _vessel,
);
  String? get br => _br;
  String? get etd => _etd;
  String? get fpod => _fpod;
  String? get blact => _blact;
  String? get blno => _blno;
  String? get bookingno => _bookingno;
  String? get fpodbr => _fpodbr;
  String? get issuedate => _issuedate;
  String? get partyname => _partyname;
  String? get place => _place;
  String? get podis => _podis;
  String? get pol => _pol;
  String? get sailing => _sailing;
  String? get vessel => _vessel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Br'] = _br;
    map['ETD'] = _etd;
    map['FPOD'] = _fpod;
    map['blact'] = _blact;
    map['blno'] = _blno;
    map['bookingno'] = _bookingno;
    map['fpodbr'] = _fpodbr;
    map['issuedate'] = _issuedate;
    map['partyname'] = _partyname;
    map['place'] = _place;
    map['podis'] = _podis;
    map['pol'] = _pol;
    map['sailing'] = _sailing;
    map['vessel'] = _vessel;
    return map;
  }

}