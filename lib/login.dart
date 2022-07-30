import 'package:flutter/material.dart';
import 'package:projek_akhir3/beranda.dart';
import 'package:projek_akhir3/model/akun.dart';
import 'package:projek_akhir3/services/category_services.dart';
//import 'package:projek_akhir2/beranda.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerId = TextEditingController();
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerNamaLogin = TextEditingController();
  TextEditingController controllerPasswordLogin = TextEditingController();

  var _akun = Akun();
  var _akunService = CategoryService();
  nama() {
    return controllerUsername;
  }

  _regisformdialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            title: Text("Registrasi"),
            content: SingleChildScrollView(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Nama   :",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.only(bottomLeft: Radius.zero))),
                    controller: controllerNama,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Username     :",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.only(bottomLeft: Radius.zero))),
                    controller: controllerUsername,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Password    :",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.only(bottomLeft: Radius.zero))),
                    controller: controllerPassword,
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
                                controllerUsername.clear();
                                controllerPassword.clear();
                              }),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Ink(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                              backgroundBlendMode: BlendMode.darken,
                              // shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
                              child: Text("Registrasi"),
                              onPressed: () async {
                                Navigator.pop(context);
                                print("REGISTRASI");
                                _akun.id = null;
                                _akun.nama = controllerNama.text;
                                _akun.username = controllerUsername.text;
                                _akun.password = controllerPassword.text;
                                var result = await _akunService.saveAkun(_akun);
                                print(result);
                                //SnackBar snackBar = SnackBar(
                                //  content: Text("Berhasil Menyimpan"),
                                //  action: SnackBarAction(
                                //    label: 'Beranda',
                                //    onPressed: () {
                                //      Navigator.push(context,
                                //          MaterialPageRoute(builder: (context) {
                                //        return Beranda();
                                //      }));
                                //    },
                                //  ),
                                //);
                                //if (result > 0) {
                                //  ScaffoldMessenger.of(context)
                                //      .showSnackBar(snackBar);
                                //}
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blueGrey, buttonColor: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text(
            "MY SEMBAKO",
            textAlign: TextAlign.center,
          ),
        )),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("SELAMAT DATANG DI MY SEMBAKO"),
                Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.only(bottom: 20.0),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/542px-Unknown_person.jpg'),
                          fit: BoxFit.fill)),
                ),
                TextField(
                  maxLength: 20,
                  controller: controllerNamaLogin,
                  decoration: InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                TextField(
                  maxLength: 8,
                  controller: controllerPasswordLogin,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 36),
                      primary: Colors.blueGrey),
                  onPressed: () {
                    if (controllerNamaLogin.text == "user" &&
                        controllerPasswordLogin.text == "1234") {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return Beranda();
                      }));
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                content: Text("Gagal Login"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {}, child: Text("OK"))
                                ],
                              ));
                    }
                  },
                  child: Text("Login"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 36),
                      primary: Colors.blueGrey),
                  onPressed: () {
                    _regisformdialog(context);
                  },
                  child: Text("Registrasi"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
