import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../utils/dimensions.dart';
import '../../../widgets/big_text.dart';

class WeeklyChef extends StatefulWidget {
  @override
  _WeeklyChefState createState() => _WeeklyChefState();
}

class _WeeklyChefState extends State<WeeklyChef> {
  final _formKey = GlobalKey<FormState>();
  final chefsReference = FirebaseFirestore.instance.collection('weeklydishes');

  String chefname = '';
  String dishname = '';
  String day = '';
  String price = '';
  bool availability = false;

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
              text: '             Weekly Dishes',
              color: Colors.white,
              size: 26,
            ),
          ],
        ),
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
                    chefname = value;
                  });
                },
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Dish Name',
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
                    return 'Please enter dish name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    dishname = value;
                  });
                },
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Day',
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
                    return 'Please enter day';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    day = value;
                  });
                },
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Price',
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
                    return 'Please enter price';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    price = value;
                  });
                },
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              CheckboxListTile(
                title: Text('Availability'),
                value: availability,
                onChanged: (value) {
                  setState(() {
                    availability = value!;
                  });
                },
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    chefsReference.add({
                      'chefname': chefname,
                      'dishname': dishname,
                      'day': day,
                      'price': price,
                      'availability': availability,
                    }).then((value) => Navigator.of(context).pop());
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
