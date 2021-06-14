import 'package:agno_hesap/constansts/decoration_constants.dart';
import 'package:agno_hesap/constansts/margin_padding_constants.dart';
import 'package:agno_hesap/constansts/style_const.dart';
import 'package:agno_hesap/model/lesson_model.dart';
import 'package:flutter/material.dart';
import '../constansts/string_constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dersAdi = "";
  int sayac = 0;
  int dersKredi = 4;
  double harfDeger = 4;
  String harfNotu = "AA";
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
    return getScaffold();
  }

  Scaffold getScaffold() {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(AppStrings.title),
        centerTitle: true,
      ),
      floatingActionButton: getFloatingActionButton(),
      body: agnoMainBody(),
    );
  }

  FloatingActionButton getFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: Colors.blueGrey,
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          formKey.currentState!.reset();
          dersKredi = 4;
          harfDeger = 4;
          harfNotu = "AA";
        }
      },
      child: Icon(Icons.add),
    );
  }

  Widget agnoMainBody() {
    return Container(
      /* decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/ytumakina.jpg"),
          fit:BoxFit.cover,
        ),
      ), */
      //margin: MarginPadding.margin,
      padding: MarginPadding.padding,
      child: getMainColumn(),
    );
  }

  Column getMainColumn() {
    return Column(
      children: [
        Form(
          key: formKey,
          child: getTextFormField(),
        ),
        rowWidget(),
        Container(
          child: Text(
            allLessons.length > 0
                ? "Agnonuz: ${agno.toStringAsFixed(2)}"
                : "Agnonuz: 0",
            style: TextStyle(fontSize: 25),
          ),
          padding: MarginPadding.padding,
        ),
        Expanded(
          child: Container(
            child: DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.2,
              maxChildSize: 0.9,
              builder: (context, controller) => ClipRect(
                child: ListView.builder(
                  controller: controller,
                  itemBuilder: getLesson,
                  itemCount: allLessons.length,
                ),
              ),
            ),
          ),
        ),
      ],
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
        color: Colors.white,
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
          agnoHesapla();
        });
      },
    );
  }

  Widget getLesson(BuildContext context, int index) {
    return getCard(index);
  }

  Dismissible getCard(int index) {
    sayac++;
    return Dismissible(
      key: Key(sayac.toString()),
      //direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        setState(() {
          allLessons.removeAt(index);
          agnoHesapla();
        });
      },
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: getListtile(index),
      ),
    );
  }

  ListTile getListtile(int index) {
    return ListTile(
      leading: getLeading(index),
      title: getTitle(index),
      subtitle: getSubtitle(index),
      trailing: getTrailing(index),
    );
  }

  Icon getLeading(int index) {
    return Icon(
      Icons.account_balance_wallet_outlined,
      color: allLessons[index].harfi == "FF" ? Colors.red : Colors.blue,
    );
  }

  Text getTrailing(int index) {
    return Text(
      allLessons[index].harfi,
      style: TextStyle(
        color: allLessons[index].harfi == "FF" ? Colors.red : Colors.blue,
      ),
    );
  }

  Text getSubtitle(int index) {
    return Text(
      allLessons[index].kredi.toString() +
          "  kredi \n" +
          (allLessons[index].kredi * allLessons[index].harfdegeri).toString() +
          " puan katkı sağlıyor",
      style: TextStyle(
        color: allLessons[index].harfi == "FF" ? Colors.red : Colors.blue,
      ),
    );
  }

  Text getTitle(int index) {
    return Text(
      allLessons[index].dersAdi,
      style: TextStyle(
        color: allLessons[index].harfi == "FF" ? Colors.red : Colors.blue,
      ),
    );
  }

  void agnoHesapla() {
    int krediToplam = 0;
    double sonucToplam = 0;

    for (var ders in allLessons) {
      krediToplam += ders.kredi;
      sonucToplam += ders.kredi * ders.harfdegeri;
    }

    if ((sonucToplam / krediToplam) == null) {
      agno = 0;
    } else {
      agno = sonucToplam / krediToplam;
    }
  }
}
