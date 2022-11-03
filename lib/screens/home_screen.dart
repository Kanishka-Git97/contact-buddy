import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            child: Column(children: [
              Row(children: [
                const Text(
                  'My Contacts',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: ((value) => {print(value)}),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Search',
                    hintText: 'Search your Contact Here',
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
