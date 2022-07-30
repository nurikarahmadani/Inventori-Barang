class Barang {
  int? idBarang;
  String? namaBarang;
  int? jumlahBarang;
  int? hargaBarang;
  String? tanggalMasuk;
  String? keterangan;

  barangMap() {
    var mapping = Map<String, dynamic>();
    mapping['idBarang'] = idBarang;
    mapping['namaBarang'] = namaBarang;
    mapping['jumlahBarang'] = jumlahBarang;
    mapping['hargaBarang'] = hargaBarang;
    mapping['tanggalMasuk'] = tanggalMasuk;
    mapping['keterangan'] = keterangan;
    return mapping;
  }
}
