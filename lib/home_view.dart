import 'package:flutter/material.dart';
import 'package:material_by_haseeb/widgets_screens/10AnimatedOutlinedElevatedButton.dart';
import 'package:material_by_haseeb/widgets_screens/1responsive_icon.dart';
import 'package:material_by_haseeb/widgets_screens/2ripple_animation.dart';
import 'package:material_by_haseeb/widgets_screens/3progress_button_1.dart';
import 'package:material_by_haseeb/widgets_screens/4animated_listview.dart';
import 'package:material_by_haseeb/widgets_screens/5expandable_widget.dart';
import 'package:material_by_haseeb/widgets_screens/6flip_card.dart';
import 'package:material_by_haseeb/widgets_screens/7like_button.dart';
import 'package:material_by_haseeb/widgets_screens/8spring_button.dart';
import 'package:material_by_haseeb/widgets_screens/9HoverTextEffect.dart';

/*This project is going to contain most of the beautiful widgets and components from the flutter Animation app and the flutter plugin app.
Here is the list of the widgets that we are going to cover in this project.

From the flutter animations app:
Icon Animations : Responsive Icon 
Loop Animation : Ripple Animation
Button Animation : Progress Button 1
Animated List view 3
Other Animations: Expandable widget

from the flutter plugin app:
Plugins for cards: FlibCard Animation
Plugins for buttons: Like Button, Spring Button


After all this we will implement a custom widget that will use the hover of the mouse to display cool randomizing text with glow of the cursor.
After all this we will implement a custom widget that will use the hover of the mouse to display cool randomizing text with glow of the cursor.
Now that we have implemented everything. Now it is time to create a special elevated button "AnimatedOutlinedElevatedButton" with the following  abilities,

When the cursor hovers over the elevated button the size of the button should increase slightly.
The outline of the button should be animated like a progress indicator from top left corner all the way around the button and back to the top left corner.
 */

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
          ],
        ),
      ),
    );
  }
}
