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
  String dersAdi = "Matematik";
  int dersKredi = 4;
  double harfDeger = 4.0;
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
          items: krediItems(),
          value: dersKredi,
          onChanged: (secilenKredi) {
            setState(() {
              dersKredi = secilenKredi == null ? 1 : secilenKredi;
            });
          },
        ),
        Container(child:Text("Agnonuz: $agno"),padding: MarginPadding.padding,),
        DropdownButton<double>(
          items: harfNotItems(),
          value: harfDeger,
          onChanged: (harf) {
            setState(() {
              harfDeger = harf == null ? 4 : harf;
            });
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
        }else if(userValue.length<1){
          return "Ders ismi boş olamaz...";
        }
      },
      onSaved: (savedValue) {
        dersAdi = savedValue.toString();
        setState(() {
          allLessons.add(Ders(dersAdi,harfNotu,harfDeger, dersKredi));
        });
      },
    );
  }

  List<DropdownMenuItem<int>> krediItems() {
    List<DropdownMenuItem<int>> items = [];

    for (int i = 1; i < 15; i++) {
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

  Widget getLesson(BuildContext context, int index) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.account_balance_wallet_outlined),
        title: Text(allLessons[index].dersAdi),
        subtitle: Text(allLessons[index].kredi.toString() + " kredi"),
        trailing: Text((allLessons[index].harfdegeri*allLessons[index].kredi.toDouble()).toString()),
      ),
    );
  }
}

class Ders {
  String dersAdi = "";
  String harfi = "";
  double harfdegeri = 0.0;
  int kredi = 1;

  Ders(this.dersAdi, this.harfi,this.harfdegeri, this.kredi);
}
