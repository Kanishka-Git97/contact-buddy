import 'package:contact_buddy_app/models/contact.dart';
import 'package:contact_buddy_app/screens/edit_contact.dart';
import 'package:contact_buddy_app/screens/home_screen.dart';
import 'package:contact_buddy_app/utils/database_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatefulWidget {
  const ContactCard(
      {Key? key,
      required this.name,
      required this.mobile,
      required this.email,
      required this.id,
      required this.contact})
      : super(key: key);

  final String name;
  final String mobile;
  final String email;
  final String id;
  final Contact contact;

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  DatabaseHelper _dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    _dbHelper = DatabaseHelper.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://th.bing.com/th/id/R.ae94ad75f9ce9698fe8dae0cbfe04d84?rik=wMGAMn%2bjzwF4SQ&riu=http%3a%2f%2fbusyliza.com%2fwp-content%2fuploads%2f2016%2f03%2fIMG_0832.jpg&ehk=7ZGnu7QaNouZWPTwc8OiFY3v6txtUrsospFwf0e16lI%3d&risl=&pid=ImgRaw&r=0'),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.mobile,
                      style: const TextStyle(fontWeight: FontWeight.w100),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.email,
                      style: const TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.call),
                    onPressed: () {},
                    splashRadius: 20,
                  ),
                  IconButton(
                    icon: const Icon(Icons.mail),
                    onPressed: () {},
                    splashRadius: 20,
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditContactScreen(contact: widget.contact)));
                    },
                    splashRadius: 20,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Delete Contact'),
                          content: const Text(
                              'Are you sure you want to delete this contact ?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () async {
                                await _dbHelper
                                    .deleteContact(int.parse(widget.id));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              },
                              child: const Text('Delete',
                                  style: TextStyle(color: Colors.redAccent)),
                            ),
                          ],
                        ),
                      );
                    },
                    splashRadius: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
