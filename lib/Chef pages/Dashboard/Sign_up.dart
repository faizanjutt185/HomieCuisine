import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:homie_cuisine/Methods/Methods.dart';

import '../../base/show_custom_Snackbar.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';
import 'Sign_in.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    bool isLoading = false;


    var signupImages = [
      "f.png",
      "I.png",
      "tw.png"

    ];
    void _registration(){
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if(name.isEmpty){
        showCustomSnackBar("Type in your name",title: "Name");
      }else if(phone.isEmpty){
        showCustomSnackBar("Type in your phone number",title: "Phone number");

      }else if(email.isEmpty){
        showCustomSnackBar("Type in your email address",title: "Email address");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Type in a valid email address",title: "Valid email address");

      }else if(password.isEmpty){
        showCustomSnackBar("Type in your password",title: "password");
      }else if(password.length<6){
        showCustomSnackBar("Password can't be less than six characters",title: "Password");
      }else{
        showCustomSnackBar("All went well",title: "Perfect");

      }
    }
    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: Dimensions.screenHeight*0.05,),
          //app logo
          Container(
            height: Dimensions.screenHeight*0.25,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 120,
                backgroundImage: AssetImage(
                    "assets/images/Faizans.jpg"
                ),
              ),
            ),
          ),
          //your email
          AppTextField(textController: emailController,
              icon: Icons.email,
              hintText: "Email"),
          SizedBox(height: Dimensions.height20,),
          //your password
          AppTextField(textController: passwordController,
              icon: Icons.password_sharp,
              hintText: "Password"),
          SizedBox(height: Dimensions.height20,),
          //your name
          AppTextField(textController: nameController,
              icon: Icons.person,
              hintText: "Name"),
          SizedBox(height: Dimensions.height20,),
          //your Phone
          AppTextField(textController: phoneController,
              icon: Icons.phone,
              hintText: "Phone"),
          SizedBox(height: Dimensions.height20,),
          //signup button
          GestureDetector(
            onTap: (){
              if(nameController.text.isNotEmpty && emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                setState((){
                  isLoading = true;
                });
                createAccount(nameController.text, emailController.text, passwordController.text).then((user) {
                  if (user != null){
                    setState((){
                      isLoading = false;
                    });
                    print("Account Created Sucessfull");
                  } else {
                    print("Login Failed");
                  }
                });
              }else{
                print("Please enter Fields");
              }
              Signin();
            },
            child: Container(
              width: Dimensions.screenWidth/2,
              height: Dimensions.screenHeight/13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: Colors.deepOrange
              ),

              child: Center(
                child: Bigtext(
                  text: "Sign up",
                  size: Dimensions.font20+Dimensions.font20/2,
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.height10,),
          //tag line
          RichText(
              text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                  text: "Have an account already?",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font20
                  )
              )
          ),
          SizedBox(height: Dimensions.screenHeight*0.03,),
          //signup options
          RichText(
              text: TextSpan(
                  text: "Sign up using one of the following methods?",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font16
                  )
              )
          ),
          Wrap(
            children: List.generate(3, (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: Dimensions.radius30,
                backgroundImage: AssetImage(
                    "assets/images/"+signupImages[index]

                ),

              ),
            )),
          )

        ],
      ),

    );
  }

  void setState(Null Function() param0) {}
}
