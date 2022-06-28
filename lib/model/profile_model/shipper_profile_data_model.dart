/// CINNo : ""
/// Partyname : "COGO PORT PVT LTD"
/// PassEmail : "0"
/// Vatno : ""
/// accounttype : ""
/// add1 : "7TH FLOOR,S7-8,PINNACLE BUSINESS "
/// add2 : "PARK, MAHAKALI CAVES ROAD ANDHERI "
/// add3 : "ANDHERI EAST"
/// br : "INMUN"
/// city : null
/// contactperson : "Rushi Pathak"
/// country : "INDIA"
/// createdat : "15-09-2017 12:21:50"
/// email : "operations@cogoport.com"
/// email1 : "priyanka@cogoport.com,operations@cogoport.com"
/// firmno : "123"
/// fyr : "2022-2023"
/// gstno : "27AAICC8838P1ZR"
/// mail : "Y"
/// mobno : "8200648902"
/// panno : "AAICC8838P"
/// partycode : "P1140"
/// passEdit : "1"
/// password : "Cogoport@1234"
/// pincode : "400093"
/// state : "MAHARASHTRA"
/// statecode : "27"
/// staxno : ""
/// username : "P1140"

class ShipperProfileData {
  ShipperProfileData({
    String? cINNo,
    String? partyname,
    String? passEmail,
    String? vatno,
    String? accounttype,
    String? add1,
    String? add2,
    String? add3,
    String? br,
    dynamic city,
    String? contactperson,
    String? country,
    String? createdat,
    String? email,
    String? email1,
    String? firmno,
    String? fyr,
    String? gstno,
    String? mail,
    String? mobno,
    String? panno,
    String? partycode,
    String? passEdit,
    String? password,
    String? pincode,
    String? state,
    String? statecode,
    String? staxno,
    String? username,
  }) {
    _cINNo = cINNo;
    _partyname = partyname;
    _passEmail = passEmail;
    _vatno = vatno;
    _accounttype = accounttype;
    _add1 = add1;
    _add2 = add2;
    _add3 = add3;
    _br = br;
    _city = city;
    _contactperson = contactperson;
    _country = country;
    _createdat = createdat;
    _email = email;
    _email1 = email1;
    _firmno = firmno;
    _fyr = fyr;
    _gstno = gstno;
    _mail = mail;
    _mobno = mobno;
    _panno = panno;
    _partycode = partycode;
    _passEdit = passEdit;
    _password = password;
    _pincode = pincode;
    _state = state;
    _statecode = statecode;
    _staxno = staxno;
    _username = username;
  }

  ShipperProfileData.fromJson(dynamic json) {
    _cINNo = json['CINNo'];
    _partyname = json['Partyname'];
    _passEmail = json['PassEmail'];
    _vatno = json['Vatno'];
    _accounttype = json['accounttype'];
    _add1 = json['add1'];
    _add2 = json['add2'];
    _add3 = json['add3'];
    _br = json['br'];
    _city = json['city'];
    _contactperson = json['contactperson'];
    _country = json['country'];
    _createdat = json['createdat'];
    _email = json['email'];
    _email1 = json['email1'];
    _firmno = json['firmno'];
    _fyr = json['fyr'];
    _gstno = json['gstno'];
    _mail = json['mail'];
    _mobno = json['mobno'];
    _panno = json['panno'];
    _partycode = json['partycode'];
    _passEdit = json['passEdit'];
    _password = json['password'];
    _pincode = json['pincode'];
    _state = json['state'];
    _statecode = json['statecode'];
    _staxno = json['staxno'];
    _username = json['username'];
  }
  String? _cINNo;
  String? _partyname;
  String? _passEmail;
  String? _vatno;
  String? _accounttype;
  String? _add1;
  String? _add2;
  String? _add3;
  String? _br;
  dynamic _city;
  String? _contactperson;
  String? _country;
  String? _createdat;
  String? _email;
  String? _email1;
  String? _firmno;
  String? _fyr;
  String? _gstno;
  String? _mail;
  String? _mobno;
  String? _panno;
  String? _partycode;
  String? _passEdit;
  String? _password;
  String? _pincode;
  String? _state;
  String? _statecode;
  String? _staxno;
  String? _username;
  ShipperProfileData copyWith({
    String? cINNo,
    String? partyname,
    String? passEmail,
    String? vatno,
    String? accounttype,
    String? add1,
    String? add2,
    String? add3,
    String? br,
    dynamic city,
    String? contactperson,
    String? country,
    String? createdat,
    String? email,
    String? email1,
    String? firmno,
    String? fyr,
    String? gstno,
    String? mail,
    String? mobno,
    String? panno,
    String? partycode,
    String? passEdit,
    String? password,
    String? pincode,
    String? state,
    String? statecode,
    String? staxno,
    String? username,
  }) =>
      ShipperProfileData(
        cINNo: cINNo ?? _cINNo,
        partyname: partyname ?? _partyname,
        passEmail: passEmail ?? _passEmail,
        vatno: vatno ?? _vatno,
        accounttype: accounttype ?? _accounttype,
        add1: add1 ?? _add1,
        add2: add2 ?? _add2,
        add3: add3 ?? _add3,
        br: br ?? _br,
        city: city ?? _city,
        contactperson: contactperson ?? _contactperson,
        country: country ?? _country,
        createdat: createdat ?? _createdat,
        email: email ?? _email,
        email1: email1 ?? _email1,
        firmno: firmno ?? _firmno,
        fyr: fyr ?? _fyr,
        gstno: gstno ?? _gstno,
        mail: mail ?? _mail,
        mobno: mobno ?? _mobno,
        panno: panno ?? _panno,
        partycode: partycode ?? _partycode,
        passEdit: passEdit ?? _passEdit,
        password: password ?? _password,
        pincode: pincode ?? _pincode,
        state: state ?? _state,
        statecode: statecode ?? _statecode,
        staxno: staxno ?? _staxno,
        username: username ?? _username,
      );
  String? get cINNo => _cINNo;
  String? get partyname => _partyname;
  String? get passEmail => _passEmail;
  String? get vatno => _vatno;
  String? get accounttype => _accounttype;
  String? get add1 => _add1;
  String? get add2 => _add2;
  String? get add3 => _add3;
  String? get br => _br;
  dynamic get city => _city;
  String? get contactperson => _contactperson;
  String? get country => _country;
  String? get createdat => _createdat;
  String? get email => _email;
  String? get email1 => _email1;
  String? get firmno => _firmno;
  String? get fyr => _fyr;
  String? get gstno => _gstno;
  String? get mail => _mail;
  String? get mobno => _mobno;
  String? get panno => _panno;
  String? get partycode => _partycode;
  String? get passEdit => _passEdit;
  String? get password => _password;
  String? get pincode => _pincode;
  String? get state => _state;
  String? get statecode => _statecode;
  String? get staxno => _staxno;
  String? get username => _username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CINNo'] = _cINNo;
    map['Partyname'] = _partyname;
    map['PassEmail'] = _passEmail;
    map['Vatno'] = _vatno;
    map['accounttype'] = _accounttype;
    map['add1'] = _add1;
    map['add2'] = _add2;
    map['add3'] = _add3;
    map['br'] = _br;
    map['city'] = _city;
    map['contactperson'] = _contactperson;
    map['country'] = _country;
    map['createdat'] = _createdat;
    map['email'] = _email;
    map['email1'] = _email1;
    map['firmno'] = _firmno;
    map['fyr'] = _fyr;
    map['gstno'] = _gstno;
    map['mail'] = _mail;
    map['mobno'] = _mobno;
    map['panno'] = _panno;
    map['partycode'] = _partycode;
    map['passEdit'] = _passEdit;
    map['password'] = _password;
    map['pincode'] = _pincode;
    map['state'] = _state;
    map['statecode'] = _statecode;
    map['staxno'] = _staxno;
    map['username'] = _username;
    return map;
  }
}
