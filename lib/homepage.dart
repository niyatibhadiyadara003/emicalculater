import 'dart:math';

import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  double emi = 0;
  double LoanAmountsliderval = 1;
  double InterestRatesliderval = 1;
  double LoanTenureliderval = 1;

  TextStyle title = TextStyle(
    fontSize: 20,
    color: Color(0xff484848),
    fontWeight: FontWeight.bold,
  );
  TextStyle style = TextStyle(
    color: Color(0xffe5e6e8),
    fontSize: 40,
    fontWeight: FontWeight.bold,
    letterSpacing: 5,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EMI Calculator"),
        centerTitle: true,
        leading: Icon(Icons.menu),
        backgroundColor: Color(0xff20295c),
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Color(0xff20295c),
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Your loan EMI is",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "$emi",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: " / month",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 35),
                Container(
                  child: Column(
                    children: [
                      mywidget(
                          "Loan Amount", LoanAmountsliderval, 1, 100000, 0),
                      mywidget(
                          "Interest Rate", InterestRatesliderval, 1, 100, 1),
                      mywidget("Loan Tenure", LoanTenureliderval, 1, 12, 2),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          backgroundColor: Color(0xffe7eaff),
                          primary: Colors.deepPurpleAccent,
                          side: BorderSide(
                            color: Color(0xff20295c),
                          ),
                        ),
                        child: Text(
                          "Calculate",
                          style: TextStyle(
                            fontSize: 35,
                            color: Color(0xff2c3568),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            InterestRatesliderval =
                                InterestRatesliderval / 12 / 100;

                            double emi = (LoanTenureliderval *
                                    InterestRatesliderval *
                                    (pow(1 + InterestRatesliderval,
                                        LoanTenureliderval)) /
                                    (pow(1 + InterestRatesliderval,
                                        LoanTenureliderval)) -
                                1);
                          });
                          print(emi);
                        },
                      ),
                    ],
                  ),
                  height: MediaQuery.of(context).size.height * 0.825,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget mywidget(
      String heading, double sliderval, double min1, double max1, int i) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(heading, style: title),
        SizedBox(
          height: 20,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Text(
              heading,
              style: style,
            ),
            (i == 1)
                ? Text(
                    "${sliderval} %",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                : Text(
                    "${sliderval}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
          ],
        ),
        Slider(
          value: sliderval,
          min: min1,
          max: max1,
          thumbColor: Color(0xff12205a),
          activeColor: Color(0xffbecceb),
          inactiveColor: Color(0xffbecceb),
          onChanged: (val) {
            setState(() {
              if (i == 0) {
                LoanAmountsliderval = val;
                sliderval = val;
              } else if (i == 1) {
                InterestRatesliderval = val;
                sliderval = val;
              } else if (i == 2) {
                LoanTenureliderval = val;
                sliderval = val;
              }
            });
          },
        ),
      ],
    );
  }
}
