import 'package:flutter/material.dart';
import 'package:homie_cuisine/Cutomer%20to%20chef2/Dish.dart';
import 'package:homie_cuisine/pages/auth/sign_in_page.dart';
import 'package:provider/provider.dart';

import '../../pages/Cart/CartProvider.dart';
import '../../pages/Chat/chatSCREEN.dart';
import 'Dashboard.dart';

class PendingOrders extends StatelessWidget {

  const PendingOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    var cartItems = cartProvider.cart.items.entries.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          onPressed: () => Dashboard(),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Pending Orders",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    conversationId: 'chef',
                    username: 'chef',
                  ),
                ),
              );
            },
            icon: Icon(Icons.chat),
          ),
        ],
      ),
      body: cartItems.isEmpty
          ? Center(
        child: Text(
          "There are no pending orders",
          style: TextStyle(fontSize: 20),
        ),
      )
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          Dish dish = cartItems[index].key;
          int quantity = cartItems[index].value;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(dish.image.toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dish.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        dish.description,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "\$${dish.price}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Quantity: $quantity",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
