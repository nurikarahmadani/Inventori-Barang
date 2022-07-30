//import 'dart:js_util';

class Akun {
  int? id;
  String? nama;
  String? username;
  String? password;
  String? email;
  String? nope;

  akunMap() {
    var mappingAkun = Map<String, dynamic>();
    mappingAkun['id'] = null;
    mappingAkun['nama'] = nama;
    mappingAkun['username'] = username;
    mappingAkun['password'] = password;
    // if (idBarang != null) mapping['idBarang'] == idBarang;
    return mappingAkun;
  }
}
