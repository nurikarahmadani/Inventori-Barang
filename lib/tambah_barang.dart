import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:projek_akhir3/beranda.dart';
import 'package:projek_akhir3/main.dart';
import 'package:projek_akhir3/model/barang.dart';
import 'package:projek_akhir3/services/category_services.dart';

class TambahBarang extends StatefulWidget {
  @override
  _TambahBarangState createState() => _TambahBarangState();
}

class _TambahBarangState extends State<TambahBarang> {
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerJumlah = TextEditingController();
  TextEditingController controllerHarga = TextEditingController();
  TextEditingController controllerKeterangan = TextEditingController();
  var _barang = Barang();
  var _barangService = CategoryService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavigasiDrawer(),
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.blueGrey,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Beranda();
                  }));
                }),
            Text("Tambah Barang")
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Nama Barang    :",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.only(bottomLeft: Radius.zero))),
                  controller: controllerNama,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Jumlah Barang   :",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.only(bottomLeft: Radius.zero))),
                  controller: controllerJumlah,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Harga Barang      :",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.only(bottomLeft: Radius.zero))),
                  controller: controllerHarga,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Keterangan          :",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.only(bottomLeft: Radius.zero))),
                  controller: controllerKeterangan,
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Ink(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            backgroundBlendMode: BlendMode.darken,
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor),
                        child: IconButton(
                            icon: Icon(
                              Icons.restore,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              controllerNama.clear();
                              controllerHarga.clear();
                              controllerJumlah.clear();
                              controllerKeterangan.clear();
                            }),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Ink(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            backgroundBlendMode: BlendMode.darken,
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor),
                        child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              print("SIMPAN");
                              _barang.namaBarang = controllerNama.text;
                              int jumlah = int.parse(controllerJumlah.text);
                              int harga = int.parse(controllerHarga.text);
                              _barang.idBarang = null;
                              _barang.jumlahBarang = jumlah;
                              _barang.hargaBarang = harga;
                              var now = DateFormat.yMMMMd().add_jm().format(DateTime.now());
                              _barang.tanggalMasuk = now.toString();
                              _barang.keterangan = controllerKeterangan.text;
                              var result =
                                  await _barangService.saveBarang(_barang);
                              print(result);
                              SnackBar snackBar = SnackBar(
                                content: Text("Berhasil Menyimpan"),
                                action: SnackBarAction(
                                  label: 'Beranda',
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Beranda();
                                    }));
                                  },
                                ),
                              );
                              if (result > 0) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}