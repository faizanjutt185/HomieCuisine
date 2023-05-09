import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../pages/home/main_foodpage.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';

class ChefProfile extends StatelessWidget {
  const ChefProfile({Key? key}) : super(key: key);

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
                text: '        CHEF PROFILE',
                color: Colors.white,
                size: 35,
              ),
            ],
          ),

          // centerTitle: true,
        ),
        body: SingleChildScrollView(
          child:
          Column(
            children: [
              Container(
                height: 40,
                color: Colors.white,
                padding: EdgeInsets.only(top: 0, left: 5 ,right: 0),
                child: Row(
                  children: [
                    Text(
                      "Name:" ,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: Dimensions.screenWidth,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Your Name",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide:  BorderSide(
                              color: Colors.deepOrange
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: Colors.deepOrange,
                          )
                      )
                  ),
                ),
              ),
              Container(
                height: 40,
                color: Colors.white,
                padding: EdgeInsets.only(top: 0, left: 5 ,right: 0),
                child: Row(
                  children: [
                    Text(
                      "Phone Number:" ,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: Dimensions.screenWidth,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Your Phone Number",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide:  BorderSide(
                              color: Colors.deepOrange
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: Colors.deepOrange,
                          )
                      )
                  ),
                ),
              ),
              Container(
                height: 40,
                color: Colors.white,
                padding: EdgeInsets.only(top: 0, left: 5 ,right: 0),
                child: Row(
                  children: [
                    Text(
                      "Address:" ,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: Dimensions.screenWidth,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Enter your current address",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide:  BorderSide(
                              color: Colors.deepOrange
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: Colors.deepOrange,
                          )
                      )
                  ),
                ),
              ),
              Container(
                height: 40,
                color: Colors.white,
                padding: EdgeInsets.only(top: 0, left: 5 ,right: 0),
                child: Row(
                  children: [
                    Text(
                      "Password:" ,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: Dimensions.screenWidth,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Your password",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide:  BorderSide(
                              color: Colors.deepOrange
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: Colors.deepOrange,
                          )
                      )
                  ),
                ),
              ),
              Container(
                height: 40,
                color: Colors.white,
                padding: EdgeInsets.only(top: 0, left: 5 ,right: 0),
                child: Row(
                  children: [
                    Text(
                      "Change Password" ,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: Dimensions.screenWidth,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Enter New Password",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide:  BorderSide(
                              color: Colors.deepOrange
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: Colors.deepOrange,
                          )
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: Dimensions.screenWidth / 2,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: Colors.deepOrange),
                child: Center(
                  child: TextButton(
                    onPressed: () => Get.to(() => const Mainfoodpage()),
                    child: Bigtext(
                      text: "Save",
                      size: Dimensions.font20 + Dimensions.font20 / 2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.03,
              ),

            ],),
        )
    );
  }
}
