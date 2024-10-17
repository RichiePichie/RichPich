import 'package:flutter/material.dart';
import 'package:richpich/register/widgets.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  final List<String> _titles = [
    'Beginner - 0-1 year',
    'Intermediate 1-5 years',
    'Expert 5+ years'
  ];

  int? selectedIndex; // To store the selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('I am a', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _titles.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: CustomWidget(
                      edgeInset: 50,
                      title: _titles[index],
                      isSelected: selectedIndex == index, 
                      onTap: () {
                        setState(() {
                          selectedIndex = index; 
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

