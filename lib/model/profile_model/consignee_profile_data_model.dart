/// add1 : "160HARE STREET 1ST FLOOR "
/// add2 : "ROOM NO 1&amp;amp;160"
/// add3 : ""
/// br : "INCCU"
/// city : "KOLKATA"
/// code : "C16"
/// contactperson : "Mr Kamaluddin Siddiquee"
/// contno : "3340056413"
/// country : "INDIA"
/// email : "kamalplpl10@gmail.com"
/// email1 : "kamalplpl10@gmail.com"
/// email2 : ""
/// firmno : "123"
/// fyr : "2022-2023"
/// gstno : "07AAECP4817B1ZQ"
/// mail : "Y"
/// mobno : "3340056413"
/// name : "Perfect Logicare Pvt. Ltd."
/// panno : "AAECP4817B"
/// passemail : "0"
/// password : "TSV12345"
/// pincode : "700001"
/// state : "WB"
/// statecode : "WB"
/// staxno : "AAECP4817B"
/// username : "C16"

class Userdetails {
  Userdetails({
    String? add1,
    String? add2,
    String? add3,
    String? br,
    String? city,
    String? code,
    String? contactperson,
    String? contno,
    String? country,
    String? email,
    String? email1,
    String? email2,
    String? firmno,
    String? fyr,
    String? gstno,
    String? mail,
    String? mobno,
    String? name,
    String? panno,
    String? passemail,
    String? password,
    String? pincode,
    String? state,
    String? statecode,
    String? staxno,
    String? username,
  }) {
    _add1 = add1;
    _add2 = add2;
    _add3 = add3;
    _br = br;
    _city = city;
    _code = code;
    _contactperson = contactperson;
    _contno = contno;
    _country = country;
    _email = email;
    _email1 = email1;
    _email2 = email2;
    _firmno = firmno;
    _fyr = fyr;
    _gstno = gstno;
    _mail = mail;
    _mobno = mobno;
    _name = name;
    _panno = panno;
    _passemail = passemail;
    _password = password;
    _pincode = pincode;
    _state = state;
    _statecode = statecode;
    _staxno = staxno;
    _username = username;
  }

  Userdetails.fromJson(dynamic json) {
    _add1 = json['add1'];
    _add2 = json['add2'];
    _add3 = json['add3'];
    _br = json['br'];
    _city = json['city'];
    _code = json['code'];
    _contactperson = json['contactperson'];
    _contno = json['contno'];
    _country = json['country'];
    _email = json['email'];
    _email1 = json['email1'];
    _email2 = json['email2'];
    _firmno = json['firmno'];
    _fyr = json['fyr'];
    _gstno = json['gstno'];
    _mail = json['mail'];
    _mobno = json['mobno'];
    _name = json['name'];
    _panno = json['panno'];
    _passemail = json['passemail'];
    _password = json['password'];
    _pincode = json['pincode'];
    _state = json['state'];
    _statecode = json['statecode'];
    _staxno = json['staxno'];
    _username = json['username'];
  }
  String? _add1;
  String? _add2;
  String? _add3;
  String? _br;
  String? _city;
  String? _code;
  String? _contactperson;
  String? _contno;
  String? _country;
  String? _email;
  String? _email1;
  String? _email2;
  String? _firmno;
  String? _fyr;
  String? _gstno;
  String? _mail;
  String? _mobno;
  String? _name;
  String? _panno;
  String? _passemail;
  String? _password;
  String? _pincode;
  String? _state;
  String? _statecode;
  String? _staxno;
  String? _username;
  Userdetails copyWith({
    String? add1,
    String? add2,
    String? add3,
    String? br,
    String? city,
    String? code,
    String? contactperson,
    String? contno,
    String? country,
    String? email,
    String? email1,
    String? email2,
    String? firmno,
    String? fyr,
    String? gstno,
    String? mail,
    String? mobno,
    String? name,
    String? panno,
    String? passemail,
    String? password,
    String? pincode,
    String? state,
    String? statecode,
    String? staxno,
    String? username,
  }) =>
      Userdetails(
        add1: add1 ?? _add1,
        add2: add2 ?? _add2,
        add3: add3 ?? _add3,
        br: br ?? _br,
        city: city ?? _city,
        code: code ?? _code,
        contactperson: contactperson ?? _contactperson,
        contno: contno ?? _contno,
        country: country ?? _country,
        email: email ?? _email,
        email1: email1 ?? _email1,
        email2: email2 ?? _email2,
        firmno: firmno ?? _firmno,
        fyr: fyr ?? _fyr,
        gstno: gstno ?? _gstno,
        mail: mail ?? _mail,
        mobno: mobno ?? _mobno,
        name: name ?? _name,
        panno: panno ?? _panno,
        passemail: passemail ?? _passemail,
        password: password ?? _password,
        pincode: pincode ?? _pincode,
        state: state ?? _state,
        statecode: statecode ?? _statecode,
        staxno: staxno ?? _staxno,
        username: username ?? _username,
      );
  String? get add1 => _add1;
  String? get add2 => _add2;
  String? get add3 => _add3;
  String? get br => _br;
  String? get city => _city;
  String? get code => _code;
  String? get contactperson => _contactperson;
  String? get contno => _contno;
  String? get country => _country;
  String? get email => _email;
  String? get email1 => _email1;
  String? get email2 => _email2;
  String? get firmno => _firmno;
  String? get fyr => _fyr;
  String? get gstno => _gstno;
  String? get mail => _mail;
  String? get mobno => _mobno;
  String? get name => _name;
  String? get panno => _panno;
  String? get passemail => _passemail;
  String? get password => _password;
  String? get pincode => _pincode;
  String? get state => _state;
  String? get statecode => _statecode;
  String? get staxno => _staxno;
  String? get username => _username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['add1'] = _add1;
    map['add2'] = _add2;
    map['add3'] = _add3;
    map['br'] = _br;
    map['city'] = _city;
    map['code'] = _code;
    map['contactperson'] = _contactperson;
    map['contno'] = _contno;
    map['country'] = _country;
    map['email'] = _email;
    map['email1'] = _email1;
    map['email2'] = _email2;
    map['firmno'] = _firmno;
    map['fyr'] = _fyr;
    map['gstno'] = _gstno;
    map['mail'] = _mail;
    map['mobno'] = _mobno;
    map['name'] = _name;
    map['panno'] = _panno;
    map['passemail'] = _passemail;
    map['password'] = _password;
    map['pincode'] = _pincode;
    map['state'] = _state;
    map['statecode'] = _statecode;
    map['staxno'] = _staxno;
    map['username'] = _username;
    return map;
  }
}
