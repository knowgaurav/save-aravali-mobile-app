import 'package:first_app/pages/facebook_feed.dart';
import 'package:first_app/pages/twitter_feed.dart';
import 'package:first_app/pages/instagram_feed.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialFeed extends StatefulWidget {
  const SocialFeed({Key? key}) : super(key: key);

  @override
  _SocialFeedState createState() => _SocialFeedState();
}

class _SocialFeedState extends State<SocialFeed>
    with SingleTickerProviderStateMixin {
  late WebViewController controller;

  late Animation<double> _animation;
  late AnimationController _animationController;

  final screens = [FacebookFeed(), TwitterFeed(), InstagramFeed()];

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          toolbarHeight: 0,
        ),
        body: screens[currentIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

        //Init Floating Action Bubble
        floatingActionButton: FloatingActionBubble(
          // Menu items
          items: <Bubble>[
            // Floating action menu item
            Bubble(
              title: "Instagram",
              iconColor: Colors.white,
              bubbleColor: Colors.green,
              icon: FontAwesomeIcons.instagram,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                setState(() {
                  currentIndex = 2;
                });
                _animationController.reverse();
              },
            ),
            // Floating action menu item
            Bubble(
              title: "Twitter",
              iconColor: Colors.white,
              bubbleColor: Colors.green,
              icon: FontAwesomeIcons.twitter,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                setState(() {
                  currentIndex = 1;
                });
                _animationController.reverse();
              },
            ),
            //Floating action menu item
            Bubble(
              title: "Facebook",
              iconColor: Colors.white,
              bubbleColor: Colors.green,
              icon: FontAwesomeIcons.facebook,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                setState(() {
                  currentIndex = 0;
                });

                // Navigator.push(context, itemBuilder);
                // itemBuilder:
                // (context, index) => InkWell(
                //       onTap: () {
                //         setState(
                //           () {
                //             currentIndex = 0;
                //           },
                //         );
                //       },
                //     );
                // new MaterialPageRoute(
                //     builder: (BuildContext context) => TwitterFeed()));
                _animationController.reverse();
              },
            ),
          ],

          // animation controller
          animation: _animation,

          // On pressed change animation state
          onPress: () => _animationController.isCompleted
              ? _animationController.reverse()
              : _animationController.forward(),

          // Floating Action button Icon color
          iconColor: Colors.green,

          // Flaoting Action button Icon
          iconData: FontAwesomeIcons.hashtag,
          backGroundColor: Colors.white,
        ));
  }
}
