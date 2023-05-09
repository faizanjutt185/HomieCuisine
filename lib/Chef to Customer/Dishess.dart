import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Cutomer to chef2/Dish.dart';
import '../pages/food/PopularFoodDetail.dart';
import '../widgets/big_text.dart';

final dishesCollection = FirebaseFirestore.instance.collection('dishes');

class CustomerUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.deepOrange,
        titleSpacing: 0,
        title: Column(
          children: [
            Align(
              alignment: Alignment.center,
            ),
            Bigtext(
              text: "Categories",
              color: Colors.white,
              size: 33,
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: dishesCollection.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final dishes = snapshot.data!.docs.map((doc) => Dish.fromJson(doc.data() as Map<String, dynamic>)).toList();
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: dishes.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PopulaarFoodDetail(dish: dishes[index],imageUrl: dishes[index].image,),
                  ),
                );
              },
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: dishes[index].image != null
                            ? DecorationImage(
                          image: NetworkImage(dishes[index].image!),
                          fit: BoxFit.cover,
                        )
                            : null,

                       /* image: DecorationImage(
                          image: NetworkImage(dishes[index].image),
                          fit: BoxFit.cover,
                        ),*/
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dishes[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            dishes[index].description,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${dishes[index].price}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Icon(Icons.add_shopping_cart),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
