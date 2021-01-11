class CardModel {
  String number;
  String name;
  String expiry;
  String securityCode;

  CardModel({
    this.number,
    this.name,
    this.expiry,
    this.securityCode,
  });

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["number"] = number;
    map["name"] = name;
    map["expiry"] = expiry;
    map["securityCode"] = securityCode;
    return map;
  }

  CardModel.fromMap(Map<String, dynamic> map) {
    this.number = map["number"];
    this.name = map["name"];
    this.expiry = map["expiry"];
    this.securityCode = map["securityCode"];
  }
}
