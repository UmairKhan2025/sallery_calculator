// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController salaryController = TextEditingController();
  TextEditingController taxPercentageController = TextEditingController();
  TextEditingController grossValueController = TextEditingController();
  TextEditingController salaryPercentageController = TextEditingController();

  void _calculate() {
    double salary = double.tryParse(salaryController.text) ?? 0;
    double taxPercentage = double.tryParse(taxPercentageController.text) ?? 0;

    double taxAmount = (salary * taxPercentage) / 100;
    double grossValue = salary - taxAmount;
    double salaryPercentage = (grossValue / salary) * 100;

    setState(() {
      grossValueController.text = grossValue.toStringAsFixed(2);
      salaryPercentageController.text = salaryPercentage.toStringAsFixed(2);
    });
  }

  void _clear() {
    setState(() {
      salaryController.clear();
      taxPercentageController.clear();
      grossValueController.clear();
      salaryPercentageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        
        title: const Text(' Sallery Calculator',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Colors.white),
        textAlign: TextAlign.center,),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: salaryController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    filled: true,
                    hintText: 'Salary',
                    labelText: 'Net Salary',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: taxPercentageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    filled: true,
                    hintText: 'Tax Percentage',
                    labelText: 'Tax Percentage (%)',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: grossValueController,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    filled: true,
                    hintText: 'Gross value',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: salaryPercentageController,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    filled: true,
                    hintText: 'Salary Percentage',
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: 340,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: _calculate,
                  child: const Text('Calculate',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25, color: Colors.white)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: 340,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: _clear,
                  child: const Text('Clear',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25, color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}