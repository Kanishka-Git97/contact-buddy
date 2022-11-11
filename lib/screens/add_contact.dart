import 'package:contact_buddy_app/components/msg_box.dart';
import 'package:contact_buddy_app/components/custom_button.dart';
import 'package:contact_buddy_app/components/custom_input.dart';
import 'package:contact_buddy_app/models/contact.dart';
import 'package:contact_buddy_app/screens/home_screen.dart';
import 'package:contact_buddy_app/utils/database_helper.dart';
import 'package:flutter/material.dart';

class AddContactScreen extends StatefulWidget {
  AddContactScreen({Key? key}) : super(key: key);

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();

  Contact _contact = Contact();
  DatabaseHelper _dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    setState(() {
      _dbHelper = DatabaseHelper.instance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            //Header Section
            Stack(
              children: [
                const SizedBox(
                  height: 180.0,
                  width: double.infinity,
                  child: Image(
                    image: AssetImage('assets/images/bg.webp'),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.low,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 20,
                  child: Row(children: [
                    GestureDetector(
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onTap: () => Navigator.pop(context),
                    ),
                    const Text(
                      'Create new Contact',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ]),
                ),
                Positioned(
                  bottom: 20,
                  left: 30,
                  child: Center(
                    child: Stack(children: const [
                      SizedBox(
                        height: 75,
                        width: 75,
                        child: CircleAvatar(
                          radius: 80.0,
                          backgroundImage:
                              AssetImage('assets/images/sampleuser.webp'),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.add_circle_rounded,
                          color: Color.fromARGB(255, 3, 96, 126),
                          size: 28.0,
                        ),
                      )
                    ]),
                  ),
                ),
              ],
            ),
            //Form Content
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                const SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  hintTxt: 'Joe Fernando',
                  lableTxt: 'Full Name',
                  mode: false,
                  controller: _nameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintTxt: '+94123456789',
                  lableTxt: 'Phone Number',
                  mode: false,
                  controller: _mobileController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintTxt: 'sample@gmail.com',
                  lableTxt: 'Email Address',
                  mode: false,
                  controller: _emailController,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                    height: 50,
                    btnColor: Colors.blue,
                    fontColor: Colors.white,
                    fontSize: 15,
                    btnText: 'Add Contact',
                    onPress: _onSubmit),
              ]),
            )
          ],
        ),
      )),
    ));
  }

  _onSubmit() async {
    if (_emailController.text.isEmpty ||
        _mobileController.text.isEmpty ||
        _nameController.text.isEmpty) {
      return showDialog(
        context: context,
        builder: (context) => const CustomAlert(
            title: 'Error',
            msg: 'Please Fill the Required Field and try Again!',
            btnText: 'Done'),
      );
    }

    _contact.name = _nameController.text;
    _contact.mobile = _mobileController.text;
    _contact.email = _emailController.text;

    await _dbHelper.insertContact(_contact);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
