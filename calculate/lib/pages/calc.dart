import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  //const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {


  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController result = TextEditingController();

    @override
  void initState() {
    // TODO: implement initState

    result.text = "your height: 0 your weight: 0, and BMI is 0";
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child: Column(
              children: [
                Image.asset('wm.png'),
                Text(
                  "BMI calculate",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: height,
                  decoration: InputDecoration(
                      labelText: 'height (cm)', border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: weight,
                  decoration: InputDecoration(
                      labelText: 'weight (kg)', border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    var _height = double.parse(height.text) / 100;
                    var cal =
                        ((double.parse(weight.text) / (_height * _height)))
                            .toStringAsFixed(2);

                    setState(() {
                      result.text =
                          "heigh: ${height.text} cm your weight: ${weight.text} kg, and your BMI is $cal";
                    });
                    print("height: ${height.text}");
                    print("weight: ${weight.text}");
                  },
                  child: Text("calculate"),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff00ced1)),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.fromLTRB(50, 20, 50, 20)),
                      textStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 20))),
                ),
                SizedBox(height: 10),
                Text(result.text),
              ],
            ),
          ),
        ),
      ],
    );
  }
}