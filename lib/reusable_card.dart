import 'package:flutter/material.dart';
class ResuableCard extends StatelessWidget {
  ResuableCard({@required this.colour,this.cardChild,this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child:cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:colour,
        ),
      ),
    );
  }
}
