import 'package:flutter/material.dart';
import 'package:my_app/Lab_4/Lab_Assignment/screens/weight_Selection.dart';
import 'package:my_app/Lab_4/Lab_Assignment/widgets/genderCard.dart';
import '../widgets/appbar.dart';
import '../widgets/description.dart';

class Gender_Selection extends StatefulWidget {
  const Gender_Selection({Key? key}) : super(key: key);

  @override
  State<Gender_Selection> createState() => _Gender_SelectionState();
}

class _Gender_SelectionState extends State<Gender_Selection> {
  String? _selectedGender = 'Male'; // Default selection

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const CustomAppBar(title: 'BMI CALCULATOR'),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'What is your, ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Gender?',
                              style: TextStyle(
                                color: Color(0xFF59AF94),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      description()
                    ],
                  ),
                  const SizedBox(
                    height: 180,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GenderSelectionItem(
                        icon: Icons.male,
                        label: 'Male',
                        isSelected: _selectedGender == 'Male',
                        backgroundColor: Colors.blue,
                        onTap: () {
                          setState(() {
                            _selectedGender = 'Male';
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WeightSelection()),
                            );
                          });
                        },
                      ),
                      GenderSelectionItem(
                        icon: Icons.female,
                        label: 'Female',
                        isSelected: _selectedGender == 'Female',
                        backgroundColor: Colors.pink.shade400,
                        onTap: () {
                          setState(() {
                            _selectedGender = 'Female';
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WeightSelection()),
                            );
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


