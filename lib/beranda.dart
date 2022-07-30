import 'package:flutter/material.dart';
import 'package:projek_akhir3/lihat.dart';
import 'package:projek_akhir3/main.dart';
import 'package:projek_akhir3/tambah_barang.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      endDrawer: NavigasiDrawer(),
      appBar: AppBar(
        title: Center(child: Text("          INVENTARIS SEMBAKO")),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context)
              .size
              .width, //agar ukuran container dapat menyesuaikan layar device yg digunakan
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Stack(children: [
                    Card(
                      elevation: 30,
                      child: Container(
                        //CONTAINER TAMBAH BARANG
                        margin: EdgeInsets.all(20),
                        height: 110,
                        width: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tambah \nBarang",
                              textAlign: TextAlign.center,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.blueGrey),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0)))),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return TambahBarang();
                                  }));
                                },
                                child: Icon(Icons.add)),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
              Row(
                children: [
                  Stack(children: [
                    Card(
                      elevation: 30,
                      child: Container(
                        //CONTAINER LIHAT BARANG
                        margin: EdgeInsets.all(20),
                        height: 110,
                        width: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Daftar\nBarang",
                              textAlign: TextAlign.center,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.blueGrey),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0)))),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DaftarBarang();
                                  }));
                                },
                                child: Icon(Icons.list)),
                          ],
                        ),
                      ),
                    ),
                  ])
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
