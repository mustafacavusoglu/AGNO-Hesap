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
          Expanded(
            child: Container(
              color: Colors.red.shade600,
              child: Form(
                child: Container(
                  child: getTextFormField(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField getTextFormField() {

    return TextFormField(
                  decoration: DecorationConst.dersDecoration,
                  validator: (userValue) {
                    if (userValue != null) {
                      return "Boş değilmiş";
                    } else
                      return "Boşmuş!!";
                  },
                  onSaved: (savedValue){

                  },
                );
  }
}
