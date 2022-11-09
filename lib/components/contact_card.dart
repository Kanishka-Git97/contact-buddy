import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatefulWidget {
  const ContactCard({Key? key}) : super(key: key);

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        child: Column(
          children: [
            SizedBox(
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
                SizedBox(
                  width: 30,
                ),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sample Name'),
                    Text('+94776721937'),
                    Text('purnakanishka97@gmail.com'),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
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
                    onPressed: () {},
                    splashRadius: 20,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Delete Contact'),
                          content: Text(
                              'Are you sure you want to delete this contact ?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: null,
                              child: Text('Delete',
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
