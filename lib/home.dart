import 'package:calculator/customButton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String resultview = "";
  String savednum = "";
  String savedOperator = "";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "calculator",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            child: Text(
              resultview,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(
                  title: "7",
                  onCliked: digitCliked,
                ),
                CustomButton(title: "8", onCliked: digitCliked),
                CustomButton(title: "9", onCliked: digitCliked),
                CustomButton(title: "/", onCliked: onOperatorClicked),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(title: "4", onCliked: digitCliked),
                CustomButton(title: "5", onCliked: digitCliked),
                CustomButton(title: "6", onCliked: digitCliked),
                CustomButton(title: "*", onCliked: onOperatorClicked),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(title: "1", onCliked: digitCliked),
                CustomButton(title: "2", onCliked: digitCliked),
                CustomButton(title: "3", onCliked: digitCliked),
                CustomButton(title: "-", onCliked: onOperatorClicked),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(title: ".", onCliked: digitCliked),
                CustomButton(title: "0", onCliked: digitCliked),
                CustomButton(title: "=", onCliked: onEqualClicked),
                CustomButton(title: "+", onCliked: onOperatorClicked),
              ],
            ),
          ),
           Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               ElevatedButton(
                 onPressed: () {
                   onClearClicked();
                 },
                 child: Text("Clear",style:TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
               ),
             ],
           )

        ],
      ),
    );
  }

  onOperatorClicked(String operator) {
    if (savednum.isEmpty) {
      savednum = resultview;
      savedOperator = operator;
      setState(() {
        resultview = "";
      });
    } else {
      var lhs = savednum;
      var rhs = resultview;
      savednum = calculation(lhs, rhs, savedOperator);
      setState(() {
        resultview = "";
      });
    }
  }

  onEqualClicked(String operator) {
    var lhs = savednum;
    var rhs = resultview;
    var res = calculation(lhs, rhs, savedOperator);
    resultview = res;
    setState(() {
      savednum = "";
      savedOperator = "";
    });
  }

  calculation(String lhs, String rhs, String savedoperator) {
    double n1 = double.parse(lhs);
    double n2 = double.parse(rhs);
    double result = 0.0;
    if (savedOperator == "/") {
      result = n1 / n2;
    } else if (savedOperator == "*") {
      result = n1 * n2;
    } else if (savedOperator == "-") {
      result = n1 - n2;
    } else if (savedOperator == "+") {
      result = n1 + n2;
    }
    return result.toString();
  }

  digitCliked(String title) {
    print("digit is $title");

    setState(() {
      resultview += title;
    });
  }
  onClearClicked(){
    setState(() {
      resultview="";
      savednum="";
      savedOperator="";
    });
  }
}
