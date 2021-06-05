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

              DropdownButton<String>(items: harfNotItems(),value: harfNotu,onChanged: (harf){
                setState(() {
                  harfNotu = harf==null?"AA":harf;
                });
              },)
            ],
          )
        ],
      ),
    );
  }

  TextFormField getTextFormField() {
    return TextFormField(
      style: TextStyle(color: Colors.black,),
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

  List<DropdownMenuItem<String>> harfNotItems() {
    List<DropdownMenuItem<String>> items = [];
    List harfler = ["AA","BA","BB","CB","CC","DC","DD","FD","FF"];

    harfler.forEach((element) {
      items.add(DropdownMenuItem<String>(
        value:  element,
        child: Text("$element"),
      ));
    });
    return items;
  }
}
