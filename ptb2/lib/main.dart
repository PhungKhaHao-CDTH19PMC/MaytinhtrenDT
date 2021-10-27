import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController num1 = new TextEditingController();
  TextEditingController num2 = new TextEditingController();
  TextEditingController num3 = new TextEditingController();
  String result = '';
  String result1 = '';
  String result2 = '';
  String result3 = '';
  String result4 = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(32, 32, 32, 0),
                child: Text(
                  'Vui lòng chỉ nhập số nguyên',
                  style: const TextStyle(fontSize: 30, color: Colors.red),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
                child: Text(
                  'khi giải phương trình',
                  style: const TextStyle(fontSize: 30, color: Colors.red),
                ),
              ),
              Container(
                padding: EdgeInsets.all(32),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Nhập số thứ nhất',
                    hintText: 'Nhập số thứ nhất',
                  ),
                  controller: num1,
                ),
              ),
              Container(
                padding: EdgeInsets.all(32),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Nhập số thứ hai',
                    hintText: 'Nhập số thứ hai',
                  ),
                  controller: num2,
                ),
              ),
              Container(
                padding: EdgeInsets.all(32),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Nhập số thứ ba',
                    hintText: 'Nhập số thứ ba',
                  ),
                  controller: num3,
                ),
              ),
              Container(
                padding: EdgeInsets.all(32),
                child: Row(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        if (int.parse(num1.text) == 0) {
                          if (int.parse(num2.text) == 0) {
                            if (int.parse(num3.text) == 0) {
                              result = "phương trình vô số nghiệm";
                            } else {
                              result = "phương trình vô nghiệm";
                            }
                          } else {
                            result = "phương trình có 1 nghiệm duy nhất";
                            double x = -(int.parse(num3.text)) /
                                (int.parse(num2.text));
                          }
                        } else {
                          double delta = (double.parse(num2.text) *
                                  double.parse(num2.text)) -
                              (4 *
                                  double.parse(num1.text) *
                                  double.parse(num3.text));
                          if (delta > 0) {
                            double x1 =
                                (-(double.parse(num2.text)) + sqrt(delta)) /
                                    (2 * double.parse(num1.text));
                            double x2 =
                                (-(double.parse(num2.text)) - sqrt(delta)) /
                                    (2 * double.parse(num1.text));
                            result = "Phương trình có hai nghiệm phân biệt";
                            result1 = x1.toString();
                            result2 = x2.toString();
                          } else if (delta < 0) {
                            result = "Phương trình vô nghiệm";
                          } else {
                            result = "Phương trình có nghiệm kép";
                            double x1 = -(double.parse(num2.text)) /
                                2 *
                                double.parse(num1.text);
                            result1 = x1.toString();
                          }
                        }
                        setState(() {});
                      },
                      child: const Text('Pt bậc hai',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue)),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        double delta = (double.parse(num2.text) *
                                double.parse(num2.text)) -
                            (4 *
                                double.parse(num1.text) *
                                double.parse(num3.text));
                        if (delta > 0) {
                          double t1 =
                              (-(double.parse(num2.text)) + sqrt(delta)) /
                                  (2 * double.parse(num1.text));
                          double t2 =
                              (-(double.parse(num2.text)) - sqrt(delta)) /
                                  (2 * double.parse(num1.text));
                          if ((t1 > 0) && (t2 > 0)) {
                            result = "Phương trình có 4 nghiệm phân biệt";
                            double x1 = sqrt(t1);
                            double x2 = -sqrt(t1);
                            double x3 = sqrt(t2);
                            double x4 = -sqrt(t2);
                            result1 = x1.toString();
                            result2 = x2.toString();
                            result2 = x3.toString();
                            result2 = x4.toString();
                          }
                          if ((t1 < 0) && (t2 < 0)) {
                            result = "Phương trình vô nghiệm";
                          }
                          if ((t1 > 0) && (t2 < 0)) {
                            result = "Phương trình có 2 nghiệm";
                            double x1 = sqrt(t1);
                            double x2 = -sqrt(t1);
                            result1 = x1.toString();
                            result2 = x2.toString();
                          }
                          if ((t1 < 0) && (t2 > 0)) {
                            result = "Phương trình có 2 nghiệm";
                            double x1 = sqrt(t2);
                            double x2 = -sqrt(t2);
                            result1 = x1.toString();
                            result2 = x2.toString();
                          }
                        } else if (delta < 0) {
                          result = "Phương trình vô nghiệm";
                        } else {
                          if (int.parse(num1.text) * int.parse(num2.text) < 0) {
                            result = "Phương trình có 2 nghiêm kép";
                            double x1 = -sqrt((-double.parse(num2.text)) /
                                2 *
                                double.parse(num1.text));
                            double x2 = sqrt((-double.parse(num2.text)) /
                                2 *
                                double.parse(num1.text));
                            result1 = x1.toString();
                            result2 = x2.toString();
                          }
                          if (int.parse(num1.text) * int.parse(num2.text) > 0) {
                            result = "Phương trình vô nghiệm";
                          }
                        }
                        setState(() {});
                      },
                      child: const Text('Pt trùng phương',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue)),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        double Tong =
                            double.parse(num1.text) + double.parse(num2.text);

                        result = "Tổng = " + Tong.toString();
                        setState(() {});
                      },
                      child: const Text("Tính tổng hai số",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue)),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        double Hieu =
                            double.parse(num1.text) - double.parse(num2.text);

                        result = "Hiệu = " + Hieu.toString();
                        setState(() {});
                      },
                      child: const Text("Tính hiệu hai số",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue)),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        double Tich =
                            double.parse(num1.text) * double.parse(num2.text);

                        result = "Tích = " + Tich.toString();
                        setState(() {});
                      },
                      child: const Text("Tính tích hai số",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue)),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        if (double.parse(num2.text) == 0) {
                          result = "Không được chia cho 0!!!!!!";
                        } else {
                          double Thuong =
                              double.parse(num1.text) / double.parse(num2.text);

                          result = "Thương = " + Thuong.toString();
                        }
                        setState(() {});
                      },
                      child: const Text("Tính thương hai số",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue)),
                    ),
                  ],
                ),
              ),
              Text(result),
              Text(result1),
              Text(result2),
              Text(result3),
              Text(result4),
            ],
          ),
        ));
  }
}
