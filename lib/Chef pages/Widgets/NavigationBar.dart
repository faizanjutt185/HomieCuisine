import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../pages/Chat/chatSCREEN.dart';
import '../Dashboard/Chef_Upload.dart';
import '../../pages/Cart/cart_page.dart';
import '../../pages/account/account_page.dart';
import '../../pages/auth/sign_in_page.dart';
import '../../pages/home/main_foodpage.dart';
import '../Dashboard/Chef_Profile.dart';
import '../Dashboard/Dashboard.dart';
import '../Dashboard/Pending_orders.dart';

class NavigationBars extends StatefulWidget {
  const NavigationBars({Key? key}) : super(key: key);

  @override
  State<NavigationBars> createState() => _NavigationBars();

}

class _NavigationBars extends State<NavigationBars> {
  int _selectedIndex = 0;
  late PersistentTabController _controller;
  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState(){
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }
  List<Widget> _buildScreens() {
    return [
      Dashboard(),
      ChefUI(),
      ChatScreen(conversationId: 'faizan', username: 'Chef',),
      PendingOrders(),
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: Colors.deepOrange,
        inactiveColorPrimary: Colors.black54,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cloud_upload),
        title: ("Upload"),
        activeColorPrimary: Colors.deepOrange,
        inactiveColorPrimary: Colors.black54,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.mail),
        title: ("Msgs"),
        activeColorPrimary: Colors.deepOrange,
        inactiveColorPrimary: Colors.black54,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.time),
        title: ("Orders"),
        activeColorPrimary: Colors.deepOrange,
        inactiveColorPrimary: Colors.black54,
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}
