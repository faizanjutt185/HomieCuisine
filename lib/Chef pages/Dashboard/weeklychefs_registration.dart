import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';

class weeklychefsregistration extends StatefulWidget {
  @override
  weeklychefsregistrationState createState() => weeklychefsregistrationState();
}

class weeklychefsregistrationState extends State<weeklychefsregistration> {
  final _formKey = GlobalKey<FormState>();
  final chefsReference = FirebaseFirestore.instance.collection('weeklychefs');

  String chef_name = '';
  String PerMeal = '';
  String costperdays = '';

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
              text: 'WEEKLY CHEF REGISTRATION',
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
                    chef_name = value;
                  });
                },
              ),
              SizedBox(height: Dimensions.height20,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'PerMeal',
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
                    PerMeal = value;
                  });
                },
              ),
              SizedBox(height: Dimensions.height20,),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'costperdays',
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
                    costperdays = value;
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
      'chef_name': chef_name,
      'costperdays': costperdays,
      'PerMeal': PerMeal,
    });
  }
}
