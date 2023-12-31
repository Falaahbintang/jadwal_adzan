import 'package:flutter/material.dart';
import 'package:jadwal_adzan/data_adzan.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Mainmenu(),
    );
  }
}

class Mainmenu extends StatefulWidget {
  const Mainmenu({super.key});

  @override
  State<Mainmenu> createState() => menustate();
}

class menustate extends State<Mainmenu> {
  late dynamic kota;
  Autogenerated data_fetch = Autogenerated();
  TextEditingController input = TextEditingController();

  void getData() async {
    kota = data_fetch.getUpcoming();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text("Jadwal Adzan"),
      ),
      backgroundColor: Colors.teal,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 350,
            height: 35,
            decoration: const BoxDecoration(
              border: Border.fromBorderSide(BorderSide(
                  color: Colors.black, style: BorderStyle.solid, width: 1)),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.fromLTRB(
              20,
              10,
              0,
              0,
            ),
            child: TextField(
              controller: input,
              onChanged: (text) {
                setState(() {
                  data_fetch.namakota = text;
                  data_fetch.getJadwal();
                });
              },
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                hintText: "Cari nama kota...",
                border: InputBorder.none,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
          ),
          Center(
              child: Text(
            data_fetch.namakota,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 50,
            ),
          )),
          const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
          Container(
            width: 355,
            height: 475,
            decoration: const BoxDecoration(
                border: Border.fromBorderSide(BorderSide(
                    color: Colors.black, style: BorderStyle.solid, width: 1)),
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.white54),
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
              ),
              Text(
                "Imsyak : ${data_fetch.imsyak}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
              ),
              Text(
                "Subuh   : ${data_fetch.shubuh}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
              ),
              Text(
                "Terbit    : ${data_fetch.terbit}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
              ),
              Text(
                "Zhuhur  : ${data_fetch.dzuhur}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
              ),
              Text(
                "Ashar    : ${data_fetch.ashr}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
              ),
              Text(
                "Magrib  : ${data_fetch.magrib}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
              ),
              Text(
                "Isya       : ${data_fetch.isya}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
