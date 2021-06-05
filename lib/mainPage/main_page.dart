import 'package:agno_hesap/constansts/decoration_constants.dart';
import 'package:agno_hesap/constansts/margin_padding_constants.dart';
import 'package:flutter/material.dart';
import '../constansts/string_constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dersAdi = "";
  int dersKredi = 1;
  double harfDeger = 4.0;
  String harfNotu = "AA";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(AppStrings.title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: agnoMainBody(),
    );
  }

  Widget agnoMainBody() {
    return Container(
      margin: MarginPadding.margin,
      padding: MarginPadding.padding,
      child: Column(
        children: [
          Form(
            child: getTextFormField(),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<int>(
                items: krediItems(),
                value: dersKredi,
                onChanged: (secilenKredi) {
                  setState(() {
                    dersKredi = secilenKredi == null ? 1 : secilenKredi;
                  });
                },
              ),
              SingleChildScrollView(
                child: DropdownButton<double>(
                  items: harfNotItems(),
                  value: harfDeger,
                  onChanged: (harf) {
                    setState(() {
                      harfDeger = harf == null ? 4 : harf;
                      print(harfDeger);
                    });
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  TextFormField getTextFormField() {
    return TextFormField(
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: DecorationConst.dersDecoration,
      validator: (userValue) {
        if (userValue != null) {
          return "Boş değilmiş";
        } else
          return "Boşmuş!!";
      },
      onSaved: (savedValue) {},
    );
  }

  List<DropdownMenuItem<int>> krediItems() {
    List<DropdownMenuItem<int>> items = [];

    for (int i = 1; i < 25; i++) {
      DropdownMenuItem<int> item = DropdownMenuItem<int>(
        value: i,
        child: Text("$i kredi"),
      );
      items.add(item);
    }
    return items;
  }

  List<DropdownMenuItem<double>> harfNotItems() {
    List<DropdownMenuItem<double>> items = [];
    List<String> harfler = [
      "AA",
      "BA",
      "BB",
      "CB",
      "CC",
      "DC",
      "DD",
      "FD",
      "FF"
    ];
    List<double> harfDegerleri = [4.0, 3.5, 3.0, 2.5, 2.0, 1.5, 1.0, 0.5, 0.0];

    for (int i = 0; i < 9; i++) {
      items.add(
        DropdownMenuItem<double>(
          child: Text("${harfler[i]}"),
          value: harfDegerleri[i],
        ),
      );
    }

    return items;
  }
}
