import 'package:contact_buddy_app/components/contact_card.dart';
import 'package:contact_buddy_app/components/custom_input.dart';
import 'package:contact_buddy_app/models/contact.dart';
import 'package:contact_buddy_app/screens/add_contact.dart';
import 'package:contact_buddy_app/utils/database_helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();

  List<Contact> _contacts = [];
  DatabaseHelper _dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    _dbHelper = DatabaseHelper.instance;
    _refreshContacts();
  }

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
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
            child: SizedBox(
              width: double.infinity,
              child: Row(children: [
                Expanded(
                  child: CustomTextField(
                    hintTxt: 'Search your Contact',
                    lableTxt: 'Search',
                    mode: false,
                    controller: _searchController,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 50,
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(134, 38, 48, 246),
                    child: Text(
                      _contacts.length.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ]),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ContactCard(
                    name: _contacts[index].name.toString(),
                    mobile: _contacts[index].mobile.toString(),
                    email: _contacts[index].email.toString(),
                    id: _contacts[index].id.toString(),
                    contact: _contacts[index],
                  );
                },
                itemCount: _contacts.length,
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

  _refreshContacts() async {
    List<Contact> contacts = await _dbHelper.fetchContacts();
    setState(() {
      _contacts = contacts;
    });
  }
}
