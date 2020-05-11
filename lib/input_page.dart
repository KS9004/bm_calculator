import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'result_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'bottom_Button.dart';
import 'round_icon_button.dart';
import 'bmi_brain.dart';
enum Gender {
  male,female
}
int height = 180;
int weight = 74;
int age = 19;
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;

  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ResuableCard(
                    onPress:(){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male? kActivecardColor:kInactiveCardColour,
                   cardChild: IconContent(icon:FontAwesomeIcons.mars,label: 'MALE',), ),
                ),
                Expanded(
                  child: ResuableCard(
                    onPress:(){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour:selectedGender == Gender.female? kActivecardColor:kInactiveCardColour,
                    cardChild: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE',),

                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ResuableCard(colour: kActivecardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                Text('HEIGHT',style: kLabelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline:TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(),style:kNumberTextStyle),
                    Text('cm',style: kLabelTextStyle,),
                  ],

                ),
                Expanded(
                    child: SliderTheme(
                      data:SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xff8d8e98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),

                      ),
                      child: Slider(
                      value:height.toDouble(),
                      min:120,
                      max:220,

                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                  ),
                    ),
                ),
              ],
            ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ResuableCard(colour: kActivecardColor,
                  cardChild: Column(
                    children: <Widget>[
                      Text('WEIGHT',style:kLabelTextStyle),
                      Text(weight.toString(),style: kNumberTextStyle,),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon:FontAwesomeIcons.minus,
                            onPress: (){
                              setState(() {
                                weight--;
                              });
                              },),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(icon:FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  weight++;
                                });
                              },),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ),
                ),
                Expanded(
                  child: ResuableCard(colour:kActivecardColor,
                  cardChild: Column(
                    children: <Widget>[
                      Text('AGE',style:kLabelTextStyle),
                      Text(age.toString(),style: kNumberTextStyle,),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon:FontAwesomeIcons.minus,
                              onPress: (){
                                setState(() {
                                  age--;
                                });
                              },),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(icon:FontAwesomeIcons.plus,
                              onPress: (){
                                setState(() {
                                  age++;
                                });
                              },),
                          ],
                        ),
                      ),
                    ],
                  ),),
                ),
              ],
            ),
          ),
         BottomButton(buttonTitle: 'CALCULATE',onTap: (){
           CalculatoBrian calc = CalculatoBrian(height:height,weight:weight);
           Navigator.push(context,MaterialPageRoute(builder:(context)=>ResultPage(
             bmiResult: calc.calculator(),
             resultText: calc.getResult(),
             interpretation: calc.getInterpretation(),
           )));
         },),
        ],
      ),

    );
  }
}







