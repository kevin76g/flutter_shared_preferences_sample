import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardSelectScreen extends StatefulWidget {
  const CardSelectScreen({Key? key}) : super(key: key);

  @override
  State<CardSelectScreen> createState() => _CardSelectScreenState();
}

class _CardSelectScreenState extends State<CardSelectScreen> {
  String? fruit;
  String? message;

  Future<void> getSharedPreferencesData() async {
    final prefs = await SharedPreferences.getInstance();
    fruit = prefs.getString('fruit');
    setState(() {
      message = '$fruit is stored in local storage';
    });
  }

  Future<void> handleRadioButton(String? value) async {
    setState(() {
      fruit = value;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('fruit', value!);
    setState(() {
      message = 'Stored $value in local storage';
    });
  }

  @override
  void initState() {
    super.initState();
    getSharedPreferencesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Apple'),
              leading: Radio(
                value: 'apple',
                groupValue: fruit,
                onChanged: handleRadioButton,
              ),
            ),
            ListTile(
              title: const Text('Avocado'),
              leading: Radio(
                value: 'avocado',
                groupValue: fruit,
                onChanged: handleRadioButton,
              ),
            ),
            ListTile(
              title: const Text('Strawberry'),
              leading: Radio(
                value: 'strawberry',
                groupValue: fruit,
                onChanged: handleRadioButton,
              ),
            ),
            ListTile(
              title: const Text('Banana'),
              leading: Radio(
                value: 'banana',
                groupValue: fruit,
                onChanged: handleRadioButton,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            message != null
                ? Text(
                    message!,
                    style: const TextStyle(fontSize: 16.0),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
