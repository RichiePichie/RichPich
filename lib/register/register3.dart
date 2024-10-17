import 'package:flutter/material.dart';
import 'package:richpich/register/widgets.dart';

class Register3 extends StatefulWidget {
  const Register3({super.key});

  @override
  State<Register3> createState() => _Register3State();
}

class _Register3State extends State<Register3> {
  final List<String> _titles = [
    'Weight loss',
    'Muscle gain',
    'General Fintess',
    'Endurance/Strength Training',
    'Flexibility/Mobility',
    'Performance/Spotr-specific Training',
    'Rehabilitation/Recovery',
  ];

  int? selectedIndex; // To store the selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose one goal that\n fits you best',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              // height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _titles.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: CustomWidget(
                      edgeInset: 30,
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
