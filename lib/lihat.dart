import 'package:flutter/material.dart';
import 'package:projek_akhir3/beranda.dart';
import 'package:projek_akhir3/main.dart';
import 'package:projek_akhir3/model/barang.dart';
import 'package:projek_akhir3/services/category_services.dart';

class DaftarBarang extends StatefulWidget {
  @override
  _DaftarBarangState createState() => _DaftarBarangState();
}

class _DaftarBarangState extends State<DaftarBarang> {
  TextEditingController controllerEditNama = TextEditingController();
  TextEditingController controllerEditJumlah = TextEditingController();
  TextEditingController controllerEditHarga = TextEditingController();
  TextEditingController controllerEditKeterangan = TextEditingController();
  var _barangService = CategoryService();
  List<Barang> _barangList = <Barang>[];
  var _barang = Barang();
  var barangedit;
  @override
  initState() {
    super.initState();
    getAllBarang();
  }

  getAllBarang() async {
    _barangList = <Barang>[];
    var barang = await _barangService.readBarang();
    barang.forEach((barang) {
      setState(() {
        var barangModel = Barang();
        barangModel.idBarang = barang['idBarang'];
        barangModel.namaBarang = barang['namaBarang'];
        barangModel.tanggalMasuk = barang['tanggalMasuk'];
        barangModel.jumlahBarang = barang['jumlahBarang'];
        barangModel.hargaBarang = barang['hargaBarang'];
        barangModel.keterangan = barang['keterangan'];
        _barangList.add(barangModel);
      });
    });
  }

  _editBarang(BuildContext context, barangId) async {
    barangedit = await _barangService.readBarangByID(barangId);
    setState(() {
      controllerEditNama.text = barangedit[0]['namaBarang'] ?? 'No Name';
      controllerEditJumlah.text = barangedit[0]['jumlahBarang'].toString();
      controllerEditHarga.text = barangedit[0]['hargaBarang'].toString();
      controllerEditKeterangan.text = barangedit[0]['keterangan'];
    });
    _editFormDialog(context);
  }

  _editFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            title: Text("Edit Data Form"),
            content: SingleChildScrollView(
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
                      controller: controllerEditNama,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Jumlah Barang    :",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.only(bottomLeft: Radius.zero))),
                      controller: controllerEditJumlah,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Harga Barang    :",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.only(bottomLeft: Radius.zero))),
                      controller: controllerEditHarga,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "Keterangan    :",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.only(bottomLeft: Radius.zero))),
                      controller: controllerEditKeterangan,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Ink(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          backgroundBlendMode: BlendMode.darken,
                          color: Theme.of(context).primaryColor),
                      child: ElevatedButton(
                          child: Text("Update"),
                          onPressed: () async {
                            print("SIMPAN");
                            int jumlah = int.parse(controllerEditJumlah.text);
                            int harga = int.parse(controllerEditHarga.text);
                            _barang.idBarang = barangedit[0]['idBarang'];
                            _barang.namaBarang = controllerEditNama.text;
                            _barang.jumlahBarang = jumlah;
                            _barang.hargaBarang = harga;
                            _barang.tanggalMasuk = barangedit[0]['tanggalMasuk'];
                            _barang.keterangan = controllerEditKeterangan.text;
                            var result =
                                await _barangService.updateBarang(_barang);
                            print(result);
                            if (result > 0) {
                              Navigator.pop(context);
                              getAllBarang()();
                            }
                          }),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  _deleteFormDialog(BuildContext context, barangId) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: <Widget>[
              ElevatedButton(
                // color: Colors.green,
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                // color: Colors.red,
                onPressed: () async {
                  var result = await _barangService.deleteBarang(barangId);
                  if (result > 0) {
                    Navigator.pop(context);
                    getAllBarang()();
                  }
                },
                child: Text('Delete'),
              ),
            ],
            title: Text('Anda Yakin Ingin Mengapus ?'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      endDrawer: NavigasiDrawer(),
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Beranda();
                  }));
                }),
            Text("Lihat Daftar Sembako")
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: _barangList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
              child: Card(
                elevation: 8.0,
                child: ListTile(
                  leading: IconButton(
                      onPressed: () {
                        _editBarang(context, _barangList[index].idBarang);
                      },
                      icon: Icon(Icons.edit)),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_barangList[index].namaBarang ?? ''),
                      IconButton(
                          onPressed: () {
                            _deleteFormDialog(
                                context, _barangList[index].idBarang);
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Id Barang            : " +
                            _barangList[index].idBarang.toString()),
                        Text("Jumlah Stok      : " +
                            _barangList[index].jumlahBarang.toString()),
                        Text("Harga                  : " +
                            _barangList[index].hargaBarang.toString()),
                        Text("Keterangan        : " +
                            _barangList[index].keterangan.toString()),
                        Text("Tanggal Masuk : " +
                            _barangList[index].tanggalMasuk.toString()),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}