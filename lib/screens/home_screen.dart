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
  List<Contact> _displayContacts = [];

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
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(40, 74, 74, 74),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextFormField(
                        controller: _searchController,
                        onChanged: (value) => _searchContacts(value),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Search',
                          hintText: 'Search your Contact',
                          hintStyle: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
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
                      _displayContacts.length.toString(),
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
                    name: _displayContacts[index].name.toString(),
                    mobile: _displayContacts[index].mobile.toString(),
                    email: _displayContacts[index].email.toString(),
                    id: _displayContacts[index].id.toString(),
                    contact: _displayContacts[index],
                  );
                },
                itemCount: _displayContacts.length,
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
      _displayContacts = contacts;
    });
  }

  void _searchContacts(String value) {
    setState(() {
      _displayContacts = _contacts
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }
}
