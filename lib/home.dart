import 'package:flutter/material.dart';

import 'game.dart';

class HomePageController extends StatefulWidget {
  const HomePageController({Key? key}) : super(key: key);
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<HomePageController> {
  int _currentIndex = 0;

  void showSnackbar(String? title, String? msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 10),
        content: Text(
          '$msg',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[700],
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void initState() {
    // loadInterstitialAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSnackbar('Welcome', 'Hello Dear');
        },
        backgroundColor: Colors.pinkAccent,
        child: const Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       DrawerHeader(
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           children: [
      //             DesignContainer.rounded(
      //               allPadding: 0,
      //               clipBehavior: Clip.antiAliasWithSaveLayer,
      //               child: CachedNetworkImage(
      //                   height: 64,
      //                   width: 64,
      //                   imageUrl: user!.isAnonymous
      //                       ? AppInformation().skipUserProfile
      //                       : user!.photoURL.toString(),
      //                   fit: BoxFit.cover),
      //             ),
      //             DesignText.b1(
      //               user!.isAnonymous
      //                   ? "Welcome to -"
      //                   : user!.displayName.toString(),
      //               fontWeight: 700,
      //             ),
      //             // SingleChildScrollView(
      //             //   scrollDirection: Axis.horizontal,
      //             //   child: DesignText.b2(
      //             //     user!.isAnonymous
      //             //         ? "Assam Exam Prep. - Complete Mock Test"
      //             //         : user!.email.toString(),
      //             //     fontWeight: 600,
      //             //     xMuted: true,
      //             //   ),
      //             // ),
      //             TextButton(
      //               onPressed: () {
      //                 Navigator.of(context).push(
      //                   MaterialPageRoute(
      //                     builder: (BuildContext context) => const AdminPage(),
      //                   ),
      //                 );
      //               },
      //               child: const DesignText('Admin Page'),
      //             )
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        //     ? DesignColor.blackFront
        //     : Colors.white,
        elevation: _currentIndex == 2 ? 0.0 : 0.6,
        // automaticallyImplyLeading: false,
        // leading: Builder(
        //     builder: (context) => IconButton(
        //         onPressed: () {
        //           Scaffold.of(context).openDrawer();
        //         },
        //         icon: const Icon(
        //           FeatherIcons.alignLeft,
        //         ))),
        // actions: [
        //   Row(
        //     children: [
        //       DarkModeToggle(
        //         onToggleCallback: (v) async {
        //           final themeProvider =
        //               Provider.of<ThemeProvider>(context, listen: false);
        //           await themeProvider.toggleThemeData();
        //           setState(() {});
        //         },
        //       ),
        //     ],
        //   )
        // ],
        actions: const [Icon(Icons.toggle_off)],
        // iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: getBody(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return CustomBottomBar(
      backgroundColor: Colors.black,
      bottomColor: const Color.fromARGB(255, 3, 246, 177),
      containerHeight: 60,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 8,
      curve: Curves.easeInOutBack,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomBarItem>[
        BottomBarItem(
            icon: Icon(_currentIndex == 0 ? Icons.abc_sharp : Icons.games),
            title: const Text('Play')),
        BottomBarItem(
          icon: Icon(_currentIndex == 1 ? Icons.wallet : Icons.wallet_giftcard),
          title: const Text('Wallet'),
          activeColor: Colors.purpleAccent,
        ),
      ],
    );
  }

  Widget getBody() {
    List<Widget> pages = const [
      GamesScreen(),
      GamesScreen(),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.backgroundColor,
    this.bottomColor,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
  })  : assert(items.length >= 1 && items.length <= 3),
        super(key: key);

  final int selectedIndex;
  final double iconSize;
  final Color? backgroundColor;
  final Color? bottomColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomBarItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).bottomAppBarColor;
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: bottomColor,
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: containerHeight,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: items.map((item) {
              var index = items.indexOf(item);
              return GestureDetector(
                onTap: () => onItemSelected(index),
                child: _ItemWidget(
                  item: item,
                  iconSize: iconSize,
                  isSelected: index == selectedIndex,
                  backgroundColor: bgColor,
                  itemCornerRadius: itemCornerRadius,
                  animationDuration: animationDuration,
                  curve: curve,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final BottomBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;

  const _ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.itemCornerRadius,
    required this.iconSize,
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        height: isSelected ? 60 : 30,
        duration: animationDuration,
        curve: curve,
        decoration: BoxDecoration(
          color:
              isSelected ? item.activeColor.withOpacity(0.2) : backgroundColor,
          borderRadius: BorderRadius.circular(itemCornerRadius),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: 60,
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(width: 05),
                IconTheme(
                  data: IconThemeData(
                    size: iconSize,
                    color: isSelected
                        ? item.activeColor.withOpacity(1)
                        : item.inactiveColor ?? item.activeColor,
                  ),
                  child: item.icon,
                ),
                if (isSelected)
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: DefaultTextStyle.merge(
                        style: TextStyle(
                          color: item.activeColor,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        textAlign: item.textAlign,
                        child: item.title,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomBarItem {
  BottomBarItem({
    required this.icon,
    required this.title,
    this.activeColor = Colors.blue,
    this.textAlign,
    this.inactiveColor,
  });

  final Widget icon;
  final Widget title;
  final Color activeColor;
  final Color? inactiveColor;
  final TextAlign? textAlign;
}
