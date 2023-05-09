import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Cutomer to chef2/Dish.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import 'package:image_picker/image_picker.dart';

final dishesCollection = FirebaseFirestore.instance.collection('dishes');

class ChefUI extends StatefulWidget {
  @override
  _ChefUIState createState() => _ChefUIState();
}


class _ChefUIState extends State<ChefUI> {
   final picker = ImagePicker();
   PickedFile? pickedFile;
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

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
              text: '        UPLOAD DISHES',
              color: Colors.white,
              size: 35,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 30,
                color: Colors.white,
                padding: EdgeInsets.only(top: 0, left: 5, right: 0),
                child: Row(
                  children: [
                    Text(
                      "Upload:",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
                         ElevatedButton(onPressed: _pickImage, child: Text('Upload')),
              Container(
                color: Colors.white,
                             child: pickedFile == null ?
                             Center(child: Text('no image selected')) : Image.file(File(pickedFile!.path)),
                height: 150,
                width: 150,
              ),
            /*  Container(
                height: 130,
                width: Dimensions.screenWidth,
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                  label: Text(
                    "Add Photo",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),*/
              Container(
                height: 40,
                color: Colors.white,
                padding: EdgeInsets.only(top: 10, left: 5, right: 0),
                child: Row(
                  children: [
                    Text(
                      "Food Name:",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: Dimensions.screenWidth,
                height: 45,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: 'Enter Food Name',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                        ),
                      )
                  ),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                color: Colors.white,
                padding: EdgeInsets.only(top: 10, left: 5, right: 0),
                child: Row(
                  children: [
                    Text(
                      "Description:",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: Dimensions.screenWidth,
                height: 45,
                child: TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(hintText: 'Enter Description',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                        ),
                      )
                  ),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                color: Colors.white,
                padding: EdgeInsets.only(top: 10, left: 5, right: 0),
                child: Row(
                  children: [
                    Text(
                      "Price:",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: Dimensions.screenWidth,
                height: 45,
                child: TextField(
                  controller: priceController,
                  decoration: InputDecoration(hintText: 'Enter Aomunt',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                        ),
                      )
                  ),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: Colors.deepOrange),
                child: Center(
                  child: TextButton(
                    child: Bigtext(
                      text: 'Add Dish', size: 25, color: Colors.black87,),
                    onPressed: () {
                      final dish = Dish(
                        name: nameController.text,
                        description: descriptionController.text,
                        price: priceController.text,
                        image: '',
                      );
                      addDish(dish);
                      nameController.clear();
                      descriptionController.clear();
                      priceController.clear();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void addDish(Dish dish) async {
    await dishesCollection.add(dish.toJson());
  }
  Future<void> _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      this.pickedFile = pickedFile!;
    });
  }
}
