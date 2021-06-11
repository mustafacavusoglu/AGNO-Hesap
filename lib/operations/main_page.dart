import 'package:agno_hesap/constansts/style_const.dart';
import 'package:agno_hesap/constansts/decoration_constants.dart';
import 'package:agno_hesap/constansts/lesson.dart';
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
  int dersKredi = 0;
  double harfDeger = 10;
  String harfNotu = "Seçiniz...";
  List<Ders> allLessons = [];

  var formKey = GlobalKey<FormState>();
  double agno = 0;

  @override
  void initState() {
    super.initState();
    allLessons = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(AppStrings.title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            formKey.currentState!.reset();
            dersKredi = 0;
            harfDeger = 10;
          }
        },
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
            key: formKey,
            child: getTextFormField(),
          ),
          rowWidget(),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemBuilder: getLesson,
                itemCount: allLessons.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row rowWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DropdownButton<int>(
          items: DecorationConst.krediItems(),
          value: dersKredi,
          onChanged: (secilenKredi) {
            setState(() {
              dersKredi = secilenKredi == null ? 1 : secilenKredi;
            });
          },
        ),
        Container(
          child: Text("Agnonuz: $agno"),
          padding: MarginPadding.padding,
        ),
        DropdownButton<double>(
          items: DecorationConst.harfNotItems(),
          value: harfDeger,
          onChanged: (harf) {
            if (harf == 4) {
              setState(() {
                harfNotu = "AA";
                harfDeger = harf == null ? 4 : harf;
              });
            } else if (harf == 3.5) {
              setState(() {
                harfNotu = "BA";
                harfDeger = harf == null ? 4 : harf;
              });
            } else if (harf == 3) {
              setState(() {
                harfNotu = "BB";
                harfDeger = harf == null ? 4 : harf;
              });
            } else if (harf == 2.5) {
              setState(() {
                harfNotu = "CB";
                harfDeger = harf == null ? 4 : harf;
              });
            } else if (harf == 2) {
              setState(() {
                harfNotu = "CC";
                harfDeger = harf == null ? 4 : harf;
              });
            } else if (harf == 1.5) {
              setState(() {
                harfNotu = "DC";
                harfDeger = harf == null ? 4 : harf;
              });
            } else if (harf == 1) {
              setState(() {
                harfNotu = "DD";
                harfDeger = harf == null ? 4 : harf;
              });
            } else if (harf == 0.5) {
              setState(() {
                harfNotu = "FD";
                harfDeger = harf == null ? 4 : harf;
              });
            } else if (harf == 0) {
              setState(() {
                harfNotu = "FF";
                harfDeger = harf == null ? 4 : harf;
              });
            }
          },
        )
      ],
    );
  }

  TextFormField getTextFormField() {
    return TextFormField(
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: DecorationConst.dersDecoration,
      validator: (userValue) {
        if (userValue == null) {
          return null;
        } else if (userValue.length < 1) {
          return "Ders ismi boş olamaz...";
        }
      },
      onSaved: (savedValue) {
        dersAdi = savedValue.toString();
        setState(() {
          allLessons.add(Ders(dersAdi, harfNotu, harfDeger, dersKredi));
          agno = 0;
          agno = agnoHesapla();
        });
      },
    );
  }

  Widget getLesson(BuildContext context, int index) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.account_balance_wallet_outlined,
          color: allLessons[index].harfi == "FF" ? Colors.red : Colors.blue,
        ),
        title: Text(
          allLessons[index].dersAdi,
          style: TextStyle(
            color: allLessons[index].harfi == "FF" ? Colors.red : Colors.blue,
          ),
        ),
        subtitle: Text(
          allLessons[index].kredi.toString() + " kredi",
          style: TextStyle(
            color: allLessons[index].harfi == "FF" ? Colors.red : Colors.blue,
          ),
        ),
        trailing: Text(
          allLessons[index].harfi,
          style: TextStyle(
            color: allLessons[index].harfi == "FF" ? Colors.red : Colors.blue,
          ),
        ),
      ),
    );
  }

  double agnoHesapla() {
    List krediler = [];
    List harfDegerler = [];
    double sonuc = 0;

    for (var ders in allLessons) {
      int kredi = ders.kredi;
      krediler.add(kredi);
      double harfdeger = ders.harfdegeri;
      harfDegerler.add(harfdeger);
    }

    for (int i = 0; i == krediler.length; i++) {
      double result = krediler[i] * harfDegerler[i];
      sonuc += result;
    }

    return sonuc;
  }
}
