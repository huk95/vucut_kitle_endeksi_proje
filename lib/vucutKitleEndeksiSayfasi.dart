import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class vucutKitleEndeksiSayfasi extends StatefulWidget {
  const vucutKitleEndeksiSayfasi({super.key});

  @override
  State<vucutKitleEndeksiSayfasi> createState() =>
      _vucutKitleEndeksiSayfasiState();
}

class _vucutKitleEndeksiSayfasiState extends State<vucutKitleEndeksiSayfasi> {
  double boy = 0;
  int kilo = 0;
  double ort = 0;
  var durum = "";
  var tf1 = TextEditingController();
  var tf2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vücut Kitle Endeksi Hesapla"),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: TextField(
                  controller: tf1,
                  textAlign: TextAlign.center,
                  decoration:
                      InputDecoration(label: Text("Boyunuzu giriniz(m)"))),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: TextField(
                  controller: tf2,
                  textAlign: TextAlign.center,
                  decoration:
                      InputDecoration(label: Text("Kilonuzu giriniz(kg)"))),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                child: Text("Hesapla"),
                onPressed: () {
                  boy = double.parse(tf1.text);
                  kilo = int.parse(tf2.text);
                  ort = kilo / (boy * boy);
                  if (ort <= 18.5) {
                    setState(() {
                      durum = "Zayıf";
                    });
                  } else if (ort >= 18.5 && ort <= 24.9) {
                    setState(() {
                      durum = "Normal Ağırlıkta";
                    });
                  } else if (ort >= 25 && ort <= 29.9) {
                    setState(() {
                      durum = "Kilolu";
                    });
                  } else if (ort >= 30 && ort <= 34.9) {
                    setState(() {
                      durum = "1.derece obezite";
                    });
                  } else if (ort >= 35 && ort <= 39.9) {
                    setState(() {
                      durum = "2.derece obezite";
                    });
                  } else {
                    setState(() {
                      durum = "3.derece obezite";
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Endeks: $ort",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text("Durum: $durum",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red)),
            )
          ],
        ),
      ),
    );
  }
}
