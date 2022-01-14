import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

final Color highlight = Colors.grey;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double? valueA;
  double? valueB;
  var sbResult = StringBuffer();
  String? operator;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: <Color>[
              Color(0xFF99D972),
              Color(0xFF7ED079),
              Color(0xFF5CBD7A),
              Color(0xFF5CBD7A),
              Color(0xFF5CBD7A),
            ],
          ),
        ),
        child: Column(
          children: [
            // ========================================
            // For Output
            // ========================================
            Expanded(
              key: const Key("top"),
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(right: 17, bottom: 22),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    AutoSizeText(
                      sbResult.toString(),
                      style: const TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 60,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
            // ========================================
            Expanded(
              key: const Key("bottom"),
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(18)),
                  color: Color(0xffFFFFFF),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 15,
                      color: Color(0xffADACAC),
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      key: const Key('Left'),
                      children: [
                        Row(
                          key: const Key("row1"),
                          children: [
                            // Button Clear
                            Container(
                              height: 67,
                              width: 153,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 4,
                                    color: Color(0xffADACAC),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: const Text(
                                  "C",
                                  style: TextStyle(
                                    color: Color(0xff5CBD7A),
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  onPrimary: highlight,
                                  primary: const Color(0xffFFFFFF),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                onPressed: () {
                                  clearValue();
                                },
                              ),
                            ),
                            // Button Backspace
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 23, right: 24),
                              width: 65,
                              height: 67,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0xffADACAC),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: const Icon(
                                  Icons.backspace,
                                  color: Color(0xff747474),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffFFFFFF),
                                  onPrimary: highlight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  deleteValue();
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          key: const Key("row2"),
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 23),
                              width: 65,
                              height: 67,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0xffADACAC),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: const Text(
                                  "7",
                                  style: TextStyle(
                                    color: Color(0xff5B5B5B),
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffFFFFFF),
                                  onPrimary: highlight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  appendValue("7");
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 23),
                              width: 65,
                              height: 67,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0xffADACAC),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: const Text(
                                  "8",
                                  style: TextStyle(
                                    color: Color(0xff5B5B5B),
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffFFFFFF),
                                  onPrimary: highlight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  appendValue("8");
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 23),
                              width: 65,
                              height: 67,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0xffADACAC),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: const Text(
                                  "9",
                                  style: TextStyle(
                                    color: Color(0xff5B5B5B),
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffFFFFFF),
                                  onPrimary: highlight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  appendValue("9");
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.shortestSide / 35,
                        ),
                        Row(
                          key: const Key("row3"),
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 23),
                              width: 65,
                              height: 67,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0xffADACAC),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: const Text(
                                  "4",
                                  style: TextStyle(
                                    color: Color(0xff5B5B5B),
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffFFFFFF),
                                  onPrimary: highlight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  appendValue("4");
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 23),
                              width: 65,
                              height: 67,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0xffADACAC),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: const Text(
                                  "5",
                                  style: TextStyle(
                                    color: Color(0xff5B5B5B),
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffFFFFFF),
                                  onPrimary: highlight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  appendValue("5");
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 23),
                              width: 65,
                              height: 67,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0xffADACAC),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: const Text(
                                  "6",
                                  style: TextStyle(
                                    color: Color(0xff5B5B5B),
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffFFFFFF),
                                  onPrimary: highlight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  appendValue("6");
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.shortestSide / 35,
                        ),
                        Row(
                          key: const Key("row4"),
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 23),
                              width: 65,
                              height: 67,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0xffADACAC),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: const Text(
                                  "1",
                                  style: TextStyle(
                                    color: Color(0xff5B5B5B),
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffFFFFFF),
                                  onPrimary: highlight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  appendValue("1");
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 23),
                              width: 65,
                              height: 67,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0xffADACAC),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: const Text(
                                  "2",
                                  style: TextStyle(
                                    color: Color(0xff5B5B5B),
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffFFFFFF),
                                  onPrimary: highlight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  appendValue("2");
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 23),
                              width: 65,
                              height: 67,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0xffADACAC),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                child: const Text(
                                  "3",
                                  style: TextStyle(
                                    color: Color(0xff5B5B5B),
                                    fontSize: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffFFFFFF),
                                  onPrimary: highlight,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  appendValue("3");
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.shortestSide / 35,
                        ),
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(right: 23),
                            width: 241,
                            height: 67,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0xffADACAC),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              child: const Text(
                                "0",
                                style: TextStyle(
                                  color: Color(0xff5B5B5B),
                                  fontSize: 30,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xffFFFFFF),
                                onPrimary: highlight,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                elevation: 0,
                              ),
                              onPressed: () {
                                appendValue("0");
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      key: const Key('Right'),
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffF5F5F5),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 65,
                                height: 67,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: ElevatedButton(
                                  child: const Text(
                                    "÷",
                                    style: TextStyle(
                                      color: Color(0xff5B5B5B),
                                      fontSize: 30,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    onPrimary: highlight,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    appendValue("÷");
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 65,
                                height: 67,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: ElevatedButton(
                                  child: const Text(
                                    "×",
                                    style: TextStyle(
                                      color: Color(0xff5B5B5B),
                                      fontSize: 30,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    onPrimary: highlight,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    appendValue("×");
                                  },
                                ),
                              ),
                              SizedBox(
                                height: size.shortestSide / 35,
                              ),
                              Container(
                                width: 65,
                                height: 67,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: ElevatedButton(
                                  child: const Text(
                                    "-",
                                    style: TextStyle(
                                      color: Color(0xff5B5B5B),
                                      fontSize: 30,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    onPrimary: highlight,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    appendValue("-");
                                  },
                                ),
                              ),
                              SizedBox(
                                height: size.shortestSide / 35,
                              ),
                              Container(
                                width: 65,
                                height: 67,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: ElevatedButton(
                                  child: const Text(
                                    "+",
                                    style: TextStyle(
                                      color: Color(0xff5B5B5B),
                                      fontSize: 30,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    onPrimary: highlight,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    appendValue("+");
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.shortestSide / 35,
                        ),
                        FloatingActionButton(
                          backgroundColor: const Color(0xff91D774),
                          child: const Text(
                            "=",
                            style: TextStyle(fontSize: 30),
                          ),
                          onPressed: () {
                            appendValue("=");
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    sbResult.write("0");
    operator = "";
  }

  void deleteValue() => setState(() {
        String strResult = sbResult.toString();
        if (strResult.length > 0) {
          String lastCharacter = strResult.substring(strResult.length - 1);
          if (lastCharacter == "÷" ||
              lastCharacter == "×" ||
              lastCharacter == "-" ||
              lastCharacter == "+") {
            operator = "";
          }
          strResult = strResult.substring(0, strResult.length - 1);
          sbResult.clear();
          sbResult.write(strResult.length == 0 ? "0" : strResult);
        }
      });
  void clearValue() => setState(() {
        operator = "";
        sbResult.clear();
        sbResult.write("0");
      });

  void appendValue(String value) => setState(() {
        bool isDoCalculate = false;
        String strResult = sbResult.toString();
        String lastCharacter = strResult.substring(strResult.length - 1);
        if (value == "0" &&
            (lastCharacter == "÷" ||
                lastCharacter == "×" ||
                lastCharacter == "-" ||
                lastCharacter == "+")) {
          return;
        } else if (value == "0" && sbResult.toString() == "0") {
          return;
        } else if (value == "=") {
          isDoCalculate = true;
        } else if (value == "÷" ||
            value == "×" ||
            value == "-" ||
            value == "+") {
          if (operator!.isEmpty) {
            operator = value;
          } else {
            isDoCalculate = true;
          }
        }

        if (!isDoCalculate) {
          if (sbResult.toString() == "0" && value != "0") {
            sbResult.clear();
          }
          sbResult.write(value);
        } else {
          List<String> values = sbResult.toString().split(operator!);
          if (values.length == 2 &&
              values[0].isNotEmpty &&
              values[1].isNotEmpty) {
            valueA = double.parse(values[0]);
            valueB = double.parse(values[1]);
            sbResult.clear();
            double total = 0;
            switch (operator) {
              case "÷":
                total = valueA! / valueB!;
                break;
              case "×":
                total = valueA! * valueB!;
                break;
              case "-":
                total = valueA! - valueB!;
                break;
              case "+":
                total = valueA! + valueB!;
            }
            sbResult.write(total);
            if (value == "÷" || value == "×" || value == "-" || value == "+") {
              operator = value;
              sbResult.write(value);
            } else {
              operator = "";
            }
          } else {
            String strResult = sbResult.toString();
            String lastCharacter = strResult.substring(strResult.length - 1);
            if (value == "÷" || value == "×" || value == "-" || value == "+") {
              sbResult.clear();
              sbResult.write(
                  strResult.substring(0, strResult.length - 1) + "" + value);
              operator = value;
            } else if (value == "=" &&
                (lastCharacter == "÷" ||
                    lastCharacter == "×" ||
                    lastCharacter == "-" ||
                    lastCharacter == "+")) {
              operator = value;
              sbResult.clear();
              sbResult.write(strResult.substring(0, strResult.length - 1));
            }
          }
        }
      });
}
