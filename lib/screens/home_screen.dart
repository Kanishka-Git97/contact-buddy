import 'package:contact_buddy_app/components/contact_card.dart';
import 'package:contact_buddy_app/components/custom_input.dart';
import 'package:contact_buddy_app/screens/add_contact.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Row(children: const [
              SizedBox(
                width: 20,
              ),
              Text(
                'My Contacts',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                ),
              )
            ]),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: CustomTextField(
                hintTxt: 'Search your Contact',
                lableTxt: 'Search',
                mode: false,
                controller: _searchController,
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: const [
                  ContactCard(),
                  ContactCard(),
                  ContactCard(),
                  ContactCard(),
                  ContactCard(),
                  ContactCard()
                ],
              ),
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddContactScreen()));
        },
        label: const Text('Add Contact'),
        icon: const Icon(Icons.add_circle_outline_outlined),
      ),
    );
  }
}
