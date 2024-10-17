// ignore_for_file: unused_field, prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Register1 extends StatefulWidget {
  const Register1({super.key});

  @override
  State<Register1> createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Function to pick image from gallery
  Future<void> _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void clearText(TextEditingController controller) {
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'RichPich',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  TextSpan(
                      text: '\nSculpting Success One Rep at a Time',
                      style: TextStyle(fontSize: 18)),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: () => _pickImage(),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: _image != null ? FileImage(_image!) : null,
                child: _image == null ? Icon(Icons.person, size: 50) : null,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            customTextField(
              textController: _username,
              hintText: 'Username',
              clearText: () => clearText(_username),
            ),
            customTextField(
              textController: _email,
              hintText: 'Email',
              clearText: () => clearText(_email),
            ),
            customTextField(
              textController: _password,
              hintText: 'Password',
              clearText: () => clearText(_password),
            ),
          ],
        ),
      ),
    );
  }
}

class customTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final VoidCallback clearText;
  customTextField(
      {super.key,
      required this.textController,
      required this.hintText,
      required this.clearText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, bottom: 30, right: 30, left: 30),
      child: SizedBox(
        height: 50,
        child: TextField(
          controller: textController,
          decoration: InputDecoration(
            suffix: IconButton(onPressed: clearText, icon: Icon(Icons.clear)),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
