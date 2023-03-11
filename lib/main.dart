import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pokemon_game/button.dart';
import 'package:pokemon_game/characters/boy.dart';
import 'package:pokemon_game/maps/battleScreen.dart';
import 'package:pokemon_game/maps/pokelab.dart';
import 'attacks/fireattack.dart';
import 'attacks/healthbar.dart';
import 'attacks/thunderattack.dart';
import 'characters/charmaner.dart';
import 'characters/oak.dart';
import 'characters/oak2.dart';
import 'characters/pikachu.dart';
import 'maps/littleroot.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double mapX = 1.125;
  double mapY = 0.65;
  //POKELAB
  double labMapX = 0.125;
  double labMapY = 0.4;

  //BATTLESCREEN
  double battleMapX = 1.125;
  double battleMapY = 0.73;

  //professor oak
  String oakDirection = 'front';
  static double oakX = 0.125;
  static double oakY = 0.9;
  bool chatStarted = false;
  int countPressingA = -1;

  //Boy Character
  int boySpriteCount = 0; //0 for standing, 1-2 for walking
  String boyDirection = 'down';


  String currentLocation = 'littleroot';
  double step = 0.25;

  // int timeLeft = 5;
  //
  // void _startCountDown(){
  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //     if (timeLeft > 0) {
  //       setState(() {
  //         timeLeft--;
  //       });
  //     }  else {
  //       timer.cancel();
  //     }
  //   });
  // }
  // void fireShow(){
  //   if (currentLocation == 'battlefinishedscreen' || timeLeft == 0 ) {
  //     FireAttack(
  //       x: battleMapX,
  //       y: battleMapY,
  //       location: currentLocation,
  //     );
  //   }
  // }

  //no mans land for battlefield
  List<List<double>> noMansLandBattle = [
    [3.0,-0.73],
    [3.0,-0.98],
    [3.0,-1.23],
    [3.0,-1.48],
    [2.75,-1.48],
    [2.5,-1.48],
    [2.25,-1.48],
    [2.0,-1.48],
    [1.75,-1.48],
    [1.5,-1.48],
    [1.25,-1.48],
    [1.0,-1.48],
    [0.75,-1.48],
    [0.5,-1.48],
    [0.25,-1.48],
    [0.0,-1.48],
    [-0.25,-1.48],
    [-0.5,-1.48],
    [-0.75,-1.48],
    [-1.0,-1.48],
    [-1.25,-1.48],
    [-1.5,-1.48],
    [-1.75,-1.48],
    [-2.0,-1.48],
    [-2.25,-1.48],
    [-2.5,-1.48],
    [-2.75,-1.48],
    [-3.0,-1.48],
    [-3.0,-1.23],
    [-3.0,-0.98],
    [-3.0,-0.73],
    [-3.0,-0.48],
    [-2.75,-0.48],
    [-2.5,-0.48],
    [-2.25,-0.48],
    [-2.0,-0.48],
    [-1.75,-0.48],
    [-1.5,-0.48],
    [-1.25,-0.48],
    [-1.0,-0.48],
    [-0.75,-0.48],
    [-0.5,-0.48],
    [-0.25,-0.48],
    [0.0,-0.48],
    [0.25,-0.48],
    [0.5,-0.48],
    [0.75,-0.48],
    [1.0,-0.48],
    [1.25,-0.48],
    [1.5,-0.48],
    [1.75,-0.48],
    [2.0,-0.48],
    [2.25,-0.48],
    [2.5,-0.48],
    [2.75,-0.48],
    [3.0,-0.48],
    [-1.5,-0.98]
  ];

  //no mans land for pokelab;
  List<List<double>> noMansLandLab = [
    [0.5,1.77],
    [-1.75,3.77],
    [-1.5,3.77],
    [-1.25,3.77],
    [-1.0,3.77],
    [-0.75,3.77],
    [-0.5,3.77],
    [-0.25,3.77],
    [0.0,3.77],
    [0.25,3.77],
    [0.5,3.77],
    [0.75,3.77],
    [1.0,3.77],
    [1.25,3.77],
    [1.5,3.77],
    [1.75,3.77],
    [2.0,3.52],
    [2.0,3.27],
    [2.0,3.02],
    [2.0,2.77],
    [2.0,2.52],
    [2.0,2.27],
    [2.0,2.02],
    [2.0,1.77],
    [2.0,1.52],
    [2.0,1.27],
    [2.0,1.02],
    [2.0,0.77],
    [2.0,0.52],
    [2.0,0.27],
    [2.0,0.02],
    [2.0,-0.23],
    [2.0,-0.48],
    [2.0,-0.73],
    [2.0,-0.98],
    [2.0,-1.23],
    [2.0,-1.48],
    [2.0,-1.73],
    [2.0,-1.98],
    [2.0,-2.23],
    [2.0,-2.48],
    [2.0,-2.73],
    [2.0,-2.98],
    [2.0,-3.23],
    [2.0,-3.48],
    [1.75,-3.48],
    [1.5,-3.48],
    [1.25,-3.48],
    [1.0,-3.48],
    [0.75,-3.48],
    [0.5,-3.48],
    [0.25,-3.48],
    [0.0,-3.48],
    [-0.25,-3.48],
    [-0.5,-3.48],
    [-0.75,-3.48],
    [-1.0,-3.48],
    [-1.25,-3.48],
    [-1.5,-3.48],
    [-1.75,-3.48],
    [-2.0,-3.48],
    [-2.0,-3.23],
    [-2.0,-2.98],
    [-2.0,-2.73],
    [-2.0,-2.48],
    [-2.0,-2.23],
    [-2.0,-1.98],
    [-2.0,-1.73],
    [-2.0,-1.48],
    [-2.0,-1.23],
    [-2.0,-0.98],
    [-2.0,-0.73],
    [-2.0,-0.48],
    [-2.0,-0.23],
    [-2.0,0.02],
    [-2.0,0.27],
    [-2.0,0.52],
    [-2.0,0.77],
    [-2.0,1.02],
    [-2.0,1.27],
    [-2.0,1.52],
    [-2.0,1.77],
    [-2.0,2.02],
    [-2.0,2.27],
    [-2.0,2.52],
    [-2.0,2.77],
    [-2.0,3.02],
    [-2.0,3.27],
    [-2.0,3.52],
    [-2.0,3.77],
    [1.75,3.27],
    [1.5,3.27],
    [1.5,3.02],
    [1.5,2.77],
    [1.5,2.52],
    [1.75,2.52],
    [1.75,2.27],
    [1.75,2.02],
    [1.75,1.77],
    [1.25,2.27],
    [0.0,3.02],
    [0.0,2.77],
    [0.0,2.52],
    [-0.25,2.52],
    [-0.5,2.52],
    [-0.75,2.52],
    [-0.75,2.77],
    [-0.75,3.02],
    [-0.5,3.02],
    [-0.25,3.02],
    [-1.75,2.52],
    [-1.5,2.52],
    [-1.5,2.27],
    [-1.75,2.02],
    [-1.75,1.77],
    [-1.0,1.77],
    [-1.0,1.52],
    [-1.0,1.27],
    [-1.0,1.02],
    [1.75,0.77],
    [1.5,0.77],
    [1.25,0.77],
    [1.0,0.77],
    [1.0,0.52],
    [1.0,0.27],
    [1.0,0.02],
    [1.0,-0.23],
    [1.0,-0.48],
    [1.25,-0.48],
    [1.5,-0.48],
    [1.75,-0.48],
    [0.75,3.27],
    [0.75,3.02],
    [0.75,2.77],
    [-1.75,-0.23],
    [-1.75,-0.48],
    [-1.5,-0.48],
    [-1.25,-0.48],
    [-1.25,-0.23],
    [-1.25,0.02],
    [-1.25,0.27],
    [-1.5,-0.23],
    [1.75,-1.98],
    [1.75,-2.23],
    [1.75,-2.48],
    [1.75,-2.73],
    [1.5,-2.73],
    [1.5,-2.48],
    [1.25,-2.23],
    [1.25,-1.98],
    [1.5,-1.73],
    [1.5,-1.48],
    [0.75,-3.23],
    [-1.75,-1.48],
    [-1.75,-1.73],
    [-1.75,-1.98],
    [-1.75,-2.23],
    [-1.75,-2.48],
    [-1.75,-2.73],
    [-1.5,-2.73],
    [-1.5,-2.48],
    [-1.5,-2.23],
    [-1.25,-1.98],
    [-1.5,-1.98],
    [-1.5,-1.73],
    [-1.5,-1.48],






  ];

  //no mans land for little root;
  List<List<double>> noMansLandLittleRoot = [
    [0.625,0.9],
    [0.875,1.15],
    [0.875,1.4],
    [0.875,1.65],
    [0.875,1.9],
    [1.125,1.9],
    [1.375,1.9],
    [1.375,1.65],
    [1.375,1.4],
    [1.375,1.15],
    [1.375,0.9],
    [1.125,0.9],
    [0.875,0.9],
    [1.875,0.9],
    [1.875,0.4],
    [1.625,0.65],
    [1.375,0.4],
    [-0.625,0.9],
    [-0.875,1.15],
    [-0.875,1.4],
    [-0.875,1.65],
    [-0.875,1.9],
    [-1.125,1.9],
    [-1.375,1.9],
    [-1.375,1.65],
    [-1.375,1.4],
    [-1.375,1.15],
    [-0.875,0.9],
    [-1.125,0.9],
    [-1.375,0.9],
    [-1.125,-0.35],
    [-1.375,0.4],
    [-1.625,0.4],
    [-1.875,1.15],
    [-1.875,0.65],
    [-1.625,0.9],
    [0.125,-1.1],
    [0.125,-1.35],
    [0.375,-1.35],
    //[0.625,-1.35],
    [0.875,-1.35],
    [1.125,-1.35],
    [1.125,-1.1],
    [1.125,-0.85],
    [1.125,-0.6],
    [1.125,-0.35],
    [0.875,-0.35],
    [0.625,-0.35],
    [0.375,-0.35],
    [0.125,-0.35],
    [0.125,-0.6],
    [0.125,-0.85],
    [1.375,-1.6],
    [1.125,-1.6],
    [0.875,-1.6],
    //[0.625,-1.6],
    [1.375,-1.85],
    [1.125,-1.85],
    [0.875,-1.85],
    [0.125,3.65],
    [0.125,3.4],
    [0.125,3.15],
    [0.125,2.9],
    [0.375,2.9],
    [0.625,2.9],
    [0.875,2.9],
    [1.125,2.9],
    [1.375,2.9],
    [1.625,2.9],
    [1.875,2.9],
    [1.875,2.65],
    [1.875,2.4],
    [2.125,2.4],
    [2.125,2.15],
    [2.125,1.9],
    [2.125,1.65],
    [2.125,1.4],
    [2.125,1.15],
    [2.125,0.9],
    [2.125,0.65],
    [2.125,0.4],
    [2.125,0.15],
    [2.125,-0.1],
    [2.125,-0.35],
    [2.125,-0.6],
    [2.125,-0.85],
    [2.125,-1.1],
    [2.125,-1.35],
    [1.875,-1.6],
    [1.875,-1.85],
    [1.875,-2.1],
    [1.625,-2.35],
    [1.375,-2.35],
    [1.125,-2.35],
    [0.875,-2.35],
    [0.625,-2.35],
    [0.375,-2.35],
    [0.125,-2.35],
    [-0.125,-2.35],
    [-0.375,-2.35],
    [-0.625,-2.35],
    [-0.875,-2.35],
    [-1.125,-2.35],
    [-1.375,-2.1],
    [-1.375,-1.85],
    [-1.625,-1.6],
    [-1.625,-1.35],
    [-1.625 ,-1.1],
    [-1.875 ,-1.1],
    [-2.125 ,-1.1],
    [-2.125,-0.85],
    [-2.125,-0.6],
    [-2.125,-0.35],
    [-2.125,-0.1],
    [-2.125,0.15],
    [-2.125,0.4],
    [-2.125,0.65],
    [-2.125,0.9],
    [-2.125,1.15],
    [-2.125,1.4],
    [-2.125,1.65],
    [-2.125,1.9],
    [-2.125,2.15],
    [-2.125,2.4],
    [-1.875,2.4],
    [-1.625,2.4],
    [-1.625,2.65],
    [-1.625,2.9],
    [-1.375,2.9],
    [-1.125,2.9],
    [-0.875,2.9],
    [-0.625,2.9],
    [-0.625,3.15],
    [-0.625,3.4],
    [-0.625,3.65],
    [-0.125,3.65],
    [-0.375,3.65],
    [0.625,-1.1],
    [-0.125,0.9]

      ];

  void moveUp(){
    boyDirection = 'up';
    if (currentLocation == 'littleroot') {
      if(canMoveTo(boyDirection, noMansLandLittleRoot, mapX, mapY)) {
        setState(() {
          mapY += step;
        });
      }
      //enter pokelab
      if (double.parse((mapX).toStringAsFixed(4)) == 0.625 &&
          double.parse((mapY).toStringAsFixed(4)) == -1.35) {
        setState(() {
          currentLocation = 'pokelab';
          labMapX = 0;
          labMapY = -2.73;
        });
      }
      // enter battle screen
      if (double.parse((mapX).toStringAsFixed(4)) == -0.875 &&
          double.parse((mapY).toStringAsFixed(4)) == 0.65) {
        setState(() {
          currentLocation = 'battlefinishedscreen';
          battleMapX = 0.0;
          battleMapY = -0.73;


        });
      }

      animateWalk();
    } else {
      if (currentLocation == 'pokelab') {
        if (canMoveTo(boyDirection, noMansLandLab, labMapX, labMapY)) {
          setState(() {
            labMapY += step;
          });
        }
        //enter littleroot
        if (double.parse((labMapX).toStringAsFixed(4)) == 0.75 &&
            double.parse((labMapY).toStringAsFixed(4)) == 2.52) {
          setState(() {
            currentLocation = 'littleroot';
            mapX = 1.125;
            mapY = 0.65;
          });
        }
        animateWalk();
      }
    }
    if (currentLocation == 'battlefinishedscreen') {
      if(canMoveTo(boyDirection, noMansLandBattle, battleMapX, battleMapY)){
        setState(() {
          battleMapY += step;
        });
      }
      animateWalk();
    }

  }

  void moveDown(){
    boyDirection = 'down';
    if (currentLocation == 'littleroot') {
      if(canMoveTo(boyDirection, noMansLandLittleRoot, mapX, mapY)) {
        setState(() {
          mapY -= step;
        });
      }
      animateWalk();
    }else{
      if (currentLocation == 'pokelab') {
        if (canMoveTo(boyDirection, noMansLandLab, labMapX, labMapY)) {
          setState(() {
            labMapY -= step;
          });
        }
        animateWalk();
      }
    }
    if (currentLocation == 'battlefinishedscreen') {
      if(canMoveTo(boyDirection, noMansLandBattle, battleMapX, battleMapY)){
        setState(() {
          battleMapY -= step;
        });
      }
      if (double.parse((battleMapX).toStringAsFixed(4)) == 2.75 &&
          double.parse((battleMapY).toStringAsFixed(4)) == -1.23) {
        setState(() {
          currentLocation = 'littleroot';
          mapX = 1.125;
          mapY = 0.65;
        });
      }
      animateWalk();
    }
  }

  void moveLeft(){
    boyDirection = 'left';
    if (currentLocation == 'littleroot') {
      if(canMoveTo(boyDirection, noMansLandLittleRoot, mapX, mapY)) {
        setState(() {
          mapX += step;
        });
      }
      animateWalk();
    }else{
      if (currentLocation == 'pokelab') {
        if (canMoveTo(boyDirection, noMansLandLab, labMapX, labMapY)) {
          setState(() {
            labMapX += step;
          });
        }
        animateWalk();
      }
    }
    if (currentLocation == 'battlefinishedscreen') {
      if(canMoveTo(boyDirection, noMansLandBattle, battleMapX, battleMapY)){
        setState(() {
          battleMapX += step;
        });
      }
      animateWalk();
    }
  }

  void moveRight(){
    boyDirection = 'right';
    if (currentLocation == 'littleroot') {
      if(canMoveTo(boyDirection, noMansLandLittleRoot, mapX, mapY)) {
        setState(() {
          mapX -= step;
        });
      }
      animateWalk();
    }else{
      if (currentLocation == 'pokelab') {
        if (canMoveTo(boyDirection, noMansLandLab, labMapX, labMapY)) {
          setState(() {
            labMapX -= step;
          });
        }
        animateWalk();
      }
    }
    if (currentLocation == 'battlefinishedscreen') {
      if(canMoveTo(boyDirection, noMansLandBattle, battleMapX, battleMapY)){
        setState(() {
          battleMapX -= step;
        });
      }
      animateWalk();
    }
  }

  void pressedA(){
    setState(() {
      currentLocation = 'battlefinishedscreen';
      battleMapX = 0.0;
      battleMapY = -0.73;
    });
  }

  void pressedB(){
    setState(() {
      currentLocation = 'littleroot';
      labMapX = 1.125;
      labMapY = 0.65;
    });
  }

  void animateWalk(){

    print('x: ' + mapX.toString() + ' , y: ' + mapY.toString());
    print('labx: ' + labMapX.toString()+ ' , laby: ' + labMapY.toString());
    print('battlex: ' + battleMapX.toString() + ' , battley: ' + battleMapY.toString());

    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        boySpriteCount++;
      });
      if(boySpriteCount == 3){
        boySpriteCount = 0;
        timer.cancel();
      }
    });
  }

  double clearNum(double num){
    return double.parse(num.toStringAsFixed(4));
  }


  bool canMoveTo(String direction, var noMansLand, double x, double y){
    double stepX = 0;
    double stepY = 0;
    if (direction == 'left') {
      stepX = step;
      stepY = 0;
    } else if (direction == 'right') {
      stepX = - step;
      stepY = 0;
    } else if (direction == 'up') {
      stepX = 0;
      stepY = step;
    }  else if (direction == 'down') {
      stepX = 0;
      stepY = -step;
    }
    for(int i=0 ; i<noMansLand.length; i++ ){
      if((clearNum(noMansLand[i][0]) == clearNum(x + stepX)) &&
          (clearNum(noMansLand[i][1]) == clearNum(y + stepY))) {
        return false;
      }
    }
    return true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.2,
              child: Container(
                color: Colors.black,
                child: Stack(
                  children: [
                    //little root
                  LittleRoot(
                    x: mapX,
                    y: mapY,
                    currentMap: currentLocation,
                    ),

                    //pokelab
                    MyPokeLab(
                        x: labMapX,
                        y: labMapY,
                        currentMap: currentLocation,
                    ),
                    BattleScreen(
                      x: battleMapX,
                      y: battleMapY,
                      currentMap: currentLocation,

                    ),

                    // Boy character
                    Container(
                      alignment: Alignment(0, 0),
                      child: MyBoy(
                        location: currentLocation,
                        boySpriteCount: boySpriteCount,
                        direction: boyDirection,
                      ),
                    ),
                    //prof oak
                    Container(
                      alignment: Alignment(0,0),
                      child: ProfOak(
                        x: mapX,
                        y: mapY - 0.05,
                        location: currentLocation,
                        oakDirection: oakDirection,
                      ),
                    ),
                    Container(
                      alignment: Alignment(0,0),
                      child: Pikachu(
                        x: battleMapX,
                        y: battleMapY,
                        location: currentLocation,
                      ),
                    ),
                    Container(
                      alignment: Alignment(0,0),
                      child: Charmander(
                        x: battleMapX,
                        y: battleMapY,
                        location: currentLocation,
                      ),
                    ),
                    Container(
                      alignment: Alignment(0,0),
                      child: Oak2(
                        x: battleMapX,
                        y: battleMapY,
                        location: currentLocation,
                      ),
                    ),
                    Container(
                      alignment: Alignment(0,0),
                      child: FireAttack(
                        x: battleMapX,
                        y: battleMapY,
                        location: currentLocation,
                      ),
                    ),
                    Container(
                      alignment: Alignment(0,0),
                      child: ThunderAttack(
                        x: battleMapX,
                        y: battleMapY,
                        location: currentLocation,
                      ),
                    ),
                    Container(
                      alignment: Alignment(0,0),
                      child: HealthBar(
                        x: battleMapX,
                        y: battleMapY,
                        location: currentLocation,
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:const [
                         Text(
                          'G A M E B O Y',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '  ♥  ',
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 20,
                          ),
                        ),
                        Text(
                          'F L U T T E R',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: '←',
                                  function: moveLeft,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                MyButton(
                                  text: '↑',
                                  function: moveUp,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: '↓',
                                  function: moveDown,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: '→',
                                  function: moveRight,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: 'b',
                                  function: pressedB,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                MyButton(
                                  text: 'a',
                                  function: pressedA,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                        'C R E A T E D B Y A R',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

