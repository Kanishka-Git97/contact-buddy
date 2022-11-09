class Contact {
  //Table Structure
  static const tblContact = 'contacts';
  static const colId = 'id';
  static const colName = 'name';
  static const colMobile = 'mobile';
  static const colEmail = 'email';

  Contact({this.id, this.name, this.mobile, this.email});

  int? id;
  String? name;
  String? mobile;
  String? email;

  Contact.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    name = map[colName];
    mobile = map[colMobile];
    email = map[colEmail];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colName: name,
      colMobile: mobile,
      colEmail: email
    };
    if (id != null) map[colId] = id;
    return map;
  }
}
