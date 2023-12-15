import 'package:flutter/material.dart';
import 'package:material_by_haseeb/widgets_screens/10AnimatedOutlinedElevatedButton.dart';
import 'package:material_by_haseeb/widgets_screens/11points_and_line.dart';
import 'package:material_by_haseeb/widgets_screens/1responsive_icon.dart';
import 'package:material_by_haseeb/widgets_screens/2ripple_animation.dart';
import 'package:material_by_haseeb/widgets_screens/3progress_button_1.dart';
import 'package:material_by_haseeb/widgets_screens/4animated_listview.dart';
import 'package:material_by_haseeb/widgets_screens/5expandable_widget.dart';
import 'package:material_by_haseeb/widgets_screens/6flip_card.dart';
import 'package:material_by_haseeb/widgets_screens/7like_button.dart';
import 'package:material_by_haseeb/widgets_screens/8spring_button.dart';
import 'package:material_by_haseeb/widgets_screens/9HoverTextEffect.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    //this is the home view that will contain all the buttons to launch the widgets
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //this is the button to launch the responsive icon widget
            ElevatedButton(
              onPressed: () {
                //push to responsive icon widget without using named routes
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResponsiveIcons(),
                  ),
                );
              },
              child: const Text('Responsive Icon'),
            ),
            //this is the button to launch the ripple animation widget
            ElevatedButton(
              onPressed: () {
                //similar to above navigate to the ripple animation widget
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RippleAnimation(),
                  ),
                );
              },
              child: const Text('Ripple Animation'),
            ),
            //this is the button to launch the progress button 1 widget
            ElevatedButton(
              onPressed: () {
                //without using named routes
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProgressButton1(),
                  ),
                );
              },
              child: const Text('Progress Button 1'),
            ),

            //this is the button to launch the animated list view 3 widget
            ElevatedButton(
              onPressed: () {
                //without using named routes
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SlideAnimation3(),
                  ),
                );
              },
              child: const Text('Animated List View 3'),
            ),
            //this is the button to launch the expandable widget
            ElevatedButton(
              onPressed: () {
                //without using named routes
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExpandableWidget(),
                  ),
                );
              },
              child: const Text('Expandable Widget'),
            ),
            //this is the button to launch the flib card animation widget
            ElevatedButton(
              onPressed: () {
                //withoout using named routes
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlipCardWidget(),
                  ),
                );
              },
              child: const Text('Flip Card Animation'),
            ),
            //this is the button to launch the like button widget
            ElevatedButton(
              onPressed: () {
                //without using named routes
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LikeButtonWidget(),
                  ),
                );
              },
              child: const Text('Like Button'),
            ),
            //this is the button to launch the spring button widget
            ElevatedButton(
              onPressed: () {
                //without using named routes
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SpringButtonWidget(),
                  ),
                );
              },
              child: const Text('Spring Button'),
            ),
            //this is the button to launch the hover text widget
            ElevatedButton(
              onPressed: () {
                //without using named routes
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HoverTextWidget(),
                  ),
                );
              },
              child: const Text('Hover Text'),
            ),

            //this is the button to launch the animated outlined elevated button widget
            ElevatedButton(
              onPressed: () {
                //without using named routes
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimatedOutlinedElevatedButton(),
                  ),
                );
              },
              child: const Text('Animated Outlined Elevated Button'),
            ),

            /*
This is another useful widget that I have been planning to implement for a game.
We will start off creating a point object that has the following properties:
origin
pointRadius
isActivated
detectionRadius
Using the above concept of point, we want to create an interface similar to the android lock screen patter to allow the user to connect two points and draw a straight line while connecting these points. Here is how the user interacts:
the user touches on a point object. The spot on the screen where the user tries to touch the point must be in detection radius of the point. Then the user starts dragging and reaches the detection radius of another point. When this happens, the point will capture the line and then a new line will start from the second point, kind of like the lock screen pattern of android. 
This is gonna be a complicated widget so put some thought and create the widget that achieves the above functionality.
 */

            ElevatedButton(
              onPressed: () {
                //without using named routes
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TwoPointsConnect(),
                  ),
                );
              },
              child: const Text('Point Connect Widget'),
            ),
          ],
        ),
      ),
    );
  }
}
