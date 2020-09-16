class CountryCodeModel {
  String name;
  String dialCode;
  String code;
  String flag;

  CountryCodeModel({this.name, this.dialCode, this.code, this.flag});

  CountryCodeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dialCode = json['dial_code'];
    code = json['code'];
    flag = json["flag"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['dial_code'] = this.dialCode;
    data['code'] = this.code;
    data['flag'] = this.flag;
    return data;
  }

  @override
  String toString() {
    return this.name;
  }
}
