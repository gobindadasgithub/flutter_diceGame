import 'dart:math';

import 'package:flutter/cupertino.dart';

class GameProvider extends ChangeNotifier{
  final dice_list=<String> [
    'images/d1.png',
    'images/d2.png',
    'images/d3.png',
    'images/d4.png',
    'images/d5.png',
    'images/d6.png',

  ];
  int index_1=0, index_2=0, dice_sum=0, point=0;
  final random=Random.secure();
  bool hasGameStarted=false;
  bool hasGameRunning=false;
  bool gameOver=false;
  String status='';




start(){
  hasGameStarted=true;
  hasGameRunning=true;
  notifyListeners();

}
  void  rollTheDice(){
     {
      index_1=random.nextInt(6);
      index_2=random.nextInt(6);
      dice_sum=index_1 * index_2 +2;
      if(point >0){
        checkSecondThrow();
      }else{
        checkFirstThrow();
      }

    };
   notifyListeners();
  }
  void resetGame() {
    {
      index_1=0;
      index_2=0;
      dice_sum=0;
      point=0;
      gameOver=false;
      hasGameStarted=false;
    };
    notifyListeners();
  }

  void checkSecondThrow() {
    if(dice_sum==point){
      status='You Win!!!';
      gameOver=true;

    }
    else if(dice_sum==7){
      status='You Loss!!!';
      gameOver=true;

    }
    notifyListeners();

  }

  void checkFirstThrow() {
    switch(dice_sum){
      case 7:
      case 11:
        status='You Win!!!';
        gameOver=true;
        break;
      case 2:
      case 3:
        status='You Loss!!!';
        gameOver=true;
        break;
      default:
        point=dice_sum;
        break;



    }
    notifyListeners();
  }

}