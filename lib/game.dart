import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({Key? key}) : super(key: key);
  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  ConnectionState refreshIndicator = ConnectionState.waiting;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        strokeWidth: 1.5,
        onRefresh: () async {
          setState(() {
            refreshIndicator = ConnectionState.waiting;
          });
        },
        child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            primary: false,
            padding: const EdgeInsets.all(6.0),
            children: const [NewGamesItem()]));
  }
}

class NewGamesItem extends StatelessWidget {
  const NewGamesItem({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        elevation: 2,
        margin: const EdgeInsets.all(4),
        color: Colors.black,
        child: Stack(
          children: [
            Image.network(
              height: 200,
              width: double.infinity,
              'https://image.shutterstock.com/image-vector/vector-illustration-neon-future-game-260nw-1861318969.jpg',
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 10,
              right: 0,
              child: DesignButtons.customRadius(
                  bottomRight: 0,
                  topRight: 0,
                  onPressed: () {},
                  textLabel: '${12} ',
                  colorText: Colors.white,
                  icon: const Icon(Icons.play_circle, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class TournamentsScreen extends StatelessWidget {
  const TournamentsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Colors.blueAccent,
        title: const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            'Title',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 2,
            // backgroundColor: Colors.blueAccent,
            automaticallyImplyLeading: false,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                TabBar(
                  automaticIndicatorColorAdjustment: true,
                  tabs: [
                    Tab(
                        child: Text('New',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                    // Tab(
                    //     child: DesignText.b1("Ongoing",
                    //         color: Colors.white, fontWeight: 800)),
                    Tab(
                        child: Text('Results',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  ],
                )
              ],
            ),
          ),
          body: const TabBarView(
            children: [Text('Hello 1'), Text('Hello 2')],
          ),
        ),
      ),
    );
  }
}

class DesignButtons extends StatelessWidget {
  final Function onPressed;
  final String textLabel;
  final Icon icon;
  final Color? color;
  final Color? colorText;
  final double? bottomLeft;
  final double? bottomRight;
  final double? topLeft;
  final double? topRight;
  final bool? elevated;
  final double? pdleft;
  final double? pdtop;
  final double? pdright;
  final double? pdbottom;
  const DesignButtons.icon({
    Key? key,
    required this.onPressed,
    this.color,
    this.colorText,
    required this.textLabel,
    required this.icon,
    this.bottomLeft = 4,
    this.bottomRight = 4,
    this.topLeft = 4,
    this.topRight = 4,
    this.elevated = false,
    this.pdleft,
    this.pdtop,
    this.pdright,
    this.pdbottom,
  }) : super(key: key);
  const DesignButtons.customRadius({
    Key? key,
    required this.onPressed,
    this.color,
    this.colorText,
    required this.textLabel,
    required this.icon,
    this.bottomLeft = 4,
    this.bottomRight = 4,
    this.topLeft = 4,
    this.topRight = 4,
    this.elevated = false,
    this.pdleft,
    this.pdtop,
    this.pdright,
    this.pdbottom,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (elevated == false) {
      return TextButton.icon(
        style: TextButton.styleFrom(
          backgroundColor: color ?? Colors.blue.withOpacity(0.2),
          padding: EdgeInsets.fromLTRB(
              pdleft ?? 4, pdtop ?? 0, pdright ?? 4, pdbottom ?? 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(bottomLeft ?? 4),
              bottomRight: Radius.circular(bottomRight ?? 4),
              topLeft: Radius.circular(topLeft ?? 4),
              topRight: Radius.circular(topRight ?? 4),
            ),
          ),
        ),
        icon: icon,
        onPressed: () {
          onPressed();
        },
        label: Text(
          textLabel,
          style: TextStyle(
              color: colorText ?? Colors.black,
              // color: Colors.white,
              fontWeight: FontWeight.w800),
        ),
      );
    } else {
      return ElevatedButton.icon(
        // style: TextButton.styleFrom(
        //   backgroundColor: color ?? Colors.blue.withOpacity(0.2),
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.only(
        //       bottomLeft: Radius.circular(bottomLeft ?? 4),
        //       bottomRight: Radius.circular(bottomRight ?? 4),
        //       topLeft: Radius.circular(topLeft ?? 4),
        //       topRight: Radius.circular(topRight ?? 4),
        //     ),
        //   ),
        // ),
        style: TextButton.styleFrom(
          padding: EdgeInsets.fromLTRB(
              pdleft ?? 19, pdtop ?? 18, pdright ?? 19, pdbottom ?? 18),
          backgroundColor: color,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(bottomLeft ?? 4),
              bottomRight: Radius.circular(bottomRight ?? 4),
              topLeft: Radius.circular(topLeft ?? 4),
              topRight: Radius.circular(topRight ?? 4),
            ),
          ),
        ),
        icon: icon,
        onPressed: () {
          onPressed();
        },
        label: Text(textLabel,
            style: TextStyle(
              color: colorText ?? Colors.white,
              fontWeight: FontWeight.w700,
            )),
      );
    }
  }
}
