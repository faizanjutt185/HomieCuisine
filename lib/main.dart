import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homie_cuisine/Chef%20pages/Dashboard/Chef_Upload.dart';
import 'package:homie_cuisine/controllers/popular_product_controller.dart';
import 'package:homie_cuisine/pages/Alerts/AfterPayment.dart';
import 'package:homie_cuisine/pages/Alerts/Payments.dart';
import 'package:homie_cuisine/pages/Alerts/PromoCode.dart';
import 'package:homie_cuisine/pages/Cart/Addcart.dart';
import 'package:homie_cuisine/pages/Cart/CartItems.dart';
import 'package:homie_cuisine/pages/Cart/CartProvider.dart';
import 'package:homie_cuisine/pages/Cart/Cart_Class.dart';
import 'package:homie_cuisine/pages/Cart/OrderConfirmation.dart';
import 'package:homie_cuisine/pages/Cart/cart_page.dart';
import 'package:homie_cuisine/pages/Chat/chatSCREEN.dart';
import 'package:homie_cuisine/pages/Chefs/All_chefs.dart';
import 'package:homie_cuisine/pages/Chefs/Dishes.dart';
import 'package:homie_cuisine/pages/Disease%20search/Disease_page.dart';
import 'package:homie_cuisine/pages/Splash/splash_page.dart';
import 'package:homie_cuisine/pages/Weekly%20Meal%20Plan/Home_Chefs.dart';
import 'package:homie_cuisine/pages/Weekly%20Meal%20Plan/Meal_Plan.dart';
import 'package:homie_cuisine/pages/Weekly%20Meal%20Plan/Proceed_Order.dart';
import 'package:homie_cuisine/pages/Weekly%20Meal%20Plan/SelectedDishesPage.dart';
import 'package:homie_cuisine/pages/Weekly%20Meal%20Plan/weekly_chefs.dart';
import 'package:homie_cuisine/pages/account/account_page.dart';
import 'package:homie_cuisine/pages/auth/sign_in_page.dart';
import 'package:homie_cuisine/pages/auth/sign_up_page.dart';
import 'package:homie_cuisine/pages/food/PopularFoodDetail.dart';
import 'package:homie_cuisine/pages/food/popular_food_detail.dart';
import 'package:homie_cuisine/pages/home/home_page.dart';
import 'package:homie_cuisine/pages/home/main_foodpage.dart';
import 'package:homie_cuisine/routes/route_helper.dart';
import 'package:provider/provider.dart';
import 'Chef pages/Dashboard/Chef_Profile.dart';
import 'Chef pages/Dashboard/Controller.dart';
import 'Chef pages/Dashboard/Dashboard.dart';
import 'Chef pages/Dashboard/Pending_orders.dart';
import 'Chef pages/Dashboard/Sign_in.dart';
import 'Chef pages/Dashboard/Sign_up.dart';
import 'Chef pages/Dashboard/chefs_registration.dart';
import 'Chef pages/Dashboard/weeklychefs_registration.dart';
import 'Chef pages/Widgets/NavigationBar.dart';
import 'Chef to Customer/Dishess.dart';
import 'Cutomer to chef2/Dish.dart';
import 'Chef pages/Dashboard/WeeklyDishes.dart';
import 'pages/Weekly Meal Plan/customer_weekly.dart';
import 'helper/dependencies.dart' as dep;
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  await Firebase.initializeApp(
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get selectedDishes => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    //Get.find<PopularProductController>().getPopularProductList();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CartProvider()),
        ],
    child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

     // home: AllChefsPage(),
      // home: PendingOrders(),
     // home: ChefUI(),
     // home: OrderConfirmation(cartItems: [],),
      //home: AllChefsPage(),
     // home: MealPlan(),
     // home: WeeklyChef(),
      home: WeeklyCustomer(),
     // home: SelectedDishesPage(selectedDishes: [],),
      // home:  ProceedOrderPage(),



      // Uncomment this for whole project
      //initialRoute: RouteHelper.getSplashPage(),
      //getPages: RouteHelper.routes,
    ),
    );
  }
}


