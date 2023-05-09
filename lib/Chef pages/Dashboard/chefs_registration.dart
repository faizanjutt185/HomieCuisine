import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';

class ChefRegistrationPage extends StatefulWidget {
  @override
  _ChefRegistrationPageState createState() => _ChefRegistrationPageState();
}

class _ChefRegistrationPageState extends State<ChefRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final chefsReference = FirebaseFirestore.instance.collection('chefs');

  String _chefName = '';
  String _qualifications = '';
  int _experience = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.deepOrange,
        titleSpacing: 0,
        title: Column(
          children: [
            Bigtext(
              text: '     CHEF REGISTRATION',
              color: Colors.white,
              size: 26,
            ),
          ],
        ),

        // centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Chef Name',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter chef name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _chefName = value;
                  });
                },
              ),
              SizedBox(height: Dimensions.height20,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Qualifications',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter chef name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _qualifications = value;
                  });
                },
              ),
              SizedBox(height: Dimensions.height20,),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Experience',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter chef name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _experience = int.parse(value ?? '0');
                  });
                },
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 120.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.deepOrange),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      _saveChefDetails();
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Register Chef'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveChefDetails() {
    chefsReference.add({
      'chef_name': _chefName,
      'qualifications': _qualifications,
      'experience': _experience,
    });
  }
}
