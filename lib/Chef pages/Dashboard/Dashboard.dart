import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:homie_cuisine/utils/dimensions.dart';
import '../../pages/Weekly Meal Plan/Proceed_Order.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import '../Widgets/MenuBar.dart';

class Dashboard extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}
  // const Dashboard({Key? key}) : super(key: key);

class _NavState extends State<Dashboard> {

  bool? ischecked = false;

  TextEditingController dateController = TextEditingController();

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
              text: 'CHEF PAGE',
              color: Colors.white,
              size: 35,
            ),
            Row(
              children: [
                // Smalltext(text: '     Order Hygienic Homemade Food', color: Colors.white,size: 16,)
              ],
            )
          ],
        ),

        // centerTitle: true,
      ),
      drawer: MenuBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5),
              ),
              Bigtext(
                text: "MENU",
                size: 25,
                color: Colors.black54,
              ),
             /* Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: GroupButton(
                      buttons: [
                        "M",
                        "T",
                        "W",
                        "T",
                        "F",
                      ],
                      isRadio: false,
                      maxSelected: 5,
                    ),
                  ),
                ],
              ),*/
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 65.0,
                            height: 65.0,
                            color: Colors.deepOrange,
                            child: CircleAvatar(
                              backgroundColor: Colors.deepOrange,
                              foregroundColor: Colors.deepOrange,
                              backgroundImage:
                                  AssetImage("assets/images/Faizans.jpg"),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Bigtext(
                                text: "Desi Saag | 2 Roti",
                                size: 23,
                                color: Colors.black54,
                              ),
                              //Icon(Icons.star), Icon(Icons.star), Icon(Icons.star),
                              Smalltext(
                                text: "Price 500 per Meal",
                                size: 18,
                                color: Colors.black54,
                              ),

                              //Set the date or time here for Meal Plan

                              Column(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 170,
                                    child: TextField(
                                      controller: dateController,
                                      decoration: const InputDecoration(
                                          icon: Icon(Icons.calendar_today),
                                          labelText: "Select Date/Time"),
                                      readOnly: true,
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2021),
                                                lastDate: DateTime(2023));
                                        if (pickedDate != null) {
                                        } else {
                                          print("Not Selected");
                                        }
                                      },
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                         Container(
                           alignment: Alignment.center,
                           padding: EdgeInsets.symmetric(
                             horizontal: 0.0, vertical: 5.0),
                           child: Checkbox(
                             value: ischecked,
                             activeColor: Colors.deepOrange,
                             onChanged: (newBool){
                               setState(() {
                                 ischecked = newBool;
                               });
                             },
                           ),
                           ),
                         /* Container(
                            color: Colors.deepOrange,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 0.0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProceedOrder()));
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                textStyle: TextStyle(
                                  color: Colors.deepOrange,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2)),
                                ),
                              ),
                              child: Text(
                                "Add Cart",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),*/
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProceedOrder()));
                      },
                      child: Smalltext(
                        text: 'Proceed to Order',
                        size: 18,
                        color: Colors.black54,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
