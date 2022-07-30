import 'package:flutter/material.dart';
import 'package:projek_akhir3/beranda.dart';
import 'package:projek_akhir3/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blueGrey, buttonColor: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

class NavigasiDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 20),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/542px-Unknown_person.jpg'),
                                fit: BoxFit.fill)),
                      ),
                      Text("User")
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Beranda"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Beranda();
                  }));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Log-out"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Login();
                  }));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
