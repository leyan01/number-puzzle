import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Myapp(),
    ),
  );
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  //code//

  List lable_list = ["", "", "", "", "", "", "", "", ""];
  List winList = ["1", "2", "3", "4", "5", "6", "7", "8", ""];
  bool game_start = false;
  String resultLable = "";
  String timeText = "";
  int a = 0;

  void random_lable_generator() {
    for (int i = 0; i < 9; i++) {
      while (true) {
        int a = Random().nextInt(9);
        if (!lable_list.contains("$a")) {
          lable_list[i] = "$a";
          break;
        }
      }
    }
    for (int i = 0; i < 9; i++) {
      if (lable_list[i] == "0") {
        lable_list[i] = "";
      }
    }
  }

  void timmer(int a) async {
    if (a == 0) {
      resultLable = "you lost";
      game_start = false;
      setState(() {});
    }

    while (a >= 0) {
      if (game_start == false) {
        timeText = "0";

        break;
      }
      timeText = a.toString();
      setState(() {});
      await Future.delayed(
        Duration(seconds: 1),
      ).then((value) => timmer(a - 1));
    }
  }

  void start() {
    if (a == 0) {
      if (game_start == false) {
        random_lable_generator();
        game_start = true;
        timmer(30);
        resultLable = "";
        setState(() {});
      }
    }
    a = 1;
  }

  void reset() {
    if (game_start = true) {
      lable_list = ["", "", "", "", "", "", "", "", ""];
      game_start = false;
      timeText = "";
      resultLable = "";
      a = 0;
      setState(() {});
    }
  }

  void win() {
    if (lable_list.indexOf("") == 8) {
      if (lable_list.toString() == winList.toString()) {
        resultLable = "You Won";
        game_start = false;
      }
    }
    setState(() {});
  }

  void working(String lable) {
    int indexOfBlank = lable_list.indexOf("");
    int indexOfLable = lable_list.indexOf(lable);

    // if (lable_list.indexOf("") == 0 ||
    //     lable_list.indexOf("") == 3 ||
    //     lable_list.indexOf("") == 6) {
    //   if (indexOfBlank - indexOfLable == 3 ||
    //       indexOfBlank - indexOfLable == (-3)) {
    //     lable_list[indexOfBlank] = lable_list[indexOfLable];
    //     lable_list[indexOfLable] = "";
    //   } else if (indexOfBlank - indexOfLable == (-1)) {
    //     lable_list[indexOfBlank] = lable_list[indexOfLable];
    //     lable_list[indexOfLable] = "";
    //   }
    // } else if (lable_list.indexOf("") == 1 ||
    //     lable_list.indexOf("") == 4 ||
    //     lable_list.indexOf("") == 7) {
    //   if (indexOfBlank - indexOfLable == 3 ||
    //       indexOfBlank - indexOfLable == (-3)) {
    //     lable_list[indexOfBlank] = lable_list[indexOfLable];
    //     lable_list[indexOfLable] = "";
    //   } else if (indexOfBlank - indexOfLable == (-1)) {
    //     lable_list[indexOfBlank] = lable_list[indexOfLable];
    //     lable_list[indexOfLable] = "";
    //   } else if (indexOfBlank - indexOfLable == 1) {
    //     lable_list[indexOfBlank] = lable_list[indexOfLable];
    //     lable_list[indexOfLable] = "";
    //   }
    // } else if (lable_list.indexOf("") == 2 ||
    //     lable_list.indexOf("") == 5 ||
    //     lable_list.indexOf("") == 8) {
    //   if (indexOfBlank - indexOfLable == 3 ||
    //       indexOfBlank - indexOfLable == (-3)) {
    //     lable_list[indexOfBlank] = lable_list[indexOfLable];
    //     lable_list[indexOfLable] = "";
    //   } else if (indexOfBlank - indexOfLable == 1) {
    //     lable_list[indexOfBlank] = lable_list[indexOfLable];
    //     lable_list[indexOfLable] = "";
    //   }
    // }

    lable_list[indexOfBlank] = lable_list[indexOfLable];
    lable_list[indexOfLable] = "";
    setState(() {});
  }

  Widget btn_builder(String lable) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () {
          if (game_start) {
            working(lable);
            win();
          } else {}
        },
        child: Text(
          lable,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  //code//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Number Puzzle"), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                timeText,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  start();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text(
                  "Start",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btn_builder(lable_list[0]),
                  btn_builder(lable_list[1]),
                  btn_builder(lable_list[2]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btn_builder(lable_list[3]),
                  btn_builder(lable_list[4]),
                  btn_builder(lable_list[5]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btn_builder(lable_list[6]),
                  btn_builder(lable_list[7]),
                  btn_builder(lable_list[8]),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => reset(),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text(
                  "Reset",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                resultLable,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
