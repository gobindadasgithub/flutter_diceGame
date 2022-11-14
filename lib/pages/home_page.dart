import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final dice_list=<String> [
    'images/d1.png',
    'images/d2.png',
    'images/d3.png',
    'images/d4.png',
    'images/d5.png',
    'images/d6.png',

  ];
  int index_1=0, index_2=0, dice_sum=0, _point=0;
  final random=Random.secure();
  bool hasGameStarted=false;
  bool gameOver=false;
  String status='';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Game'),
        centerTitle: true,
      ),
      body: Center(
       child: hasGameStarted? _gameSelction() : _startGameSelected(),
      ),

    );
  }

  Widget _startGameSelected(){

    return ElevatedButton(onPressed: (){
      setState(() {
        hasGameStarted=true;
      });
    },

        child: Text("Start"));
  }
  Widget _gameSelction(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(dice_list[index_1],width: 100,height: 100,),
            const SizedBox(width: 10,),

            Image.asset(dice_list[index_2],width: 100,height: 100,),


          ],

        ),
        const SizedBox(height: 10,),
        SizedBox(
          height: 50,
          width: 200,
          child: ElevatedButton(
            onPressed: gameOver?null :_rollTheDice,
            child: Text('Roll'),
          ),
        ),
        const SizedBox(height: 10,),
        Text('Dice Sum : $dice_sum',style: TextStyle(fontSize: 22),),
        const SizedBox(height: 10,),
        if(_point>0)
          Text('Your Point : $_point',style: TextStyle(fontSize: 22,color: Colors.green),),
        const SizedBox(height: 10,),
        if(_point>0 && !gameOver)
          Text('Keep Rolling until your match your point : $_point',style: TextStyle(fontSize: 22,backgroundColor: Colors.amber),),
        const SizedBox(height: 10,),
        if(gameOver)
          Text(status,style: TextStyle(fontSize: 10,color: Colors.deepPurple),),
        const SizedBox(height: 10,),
        if(gameOver)
          SizedBox(
            child: ElevatedButton(
              onPressed: resetGame,
              child: Text('Play Again'),
            ),
          )
      ],
    );
  }
  void _rollTheDice(){
    setState(() {
      index_1=random.nextInt(6);
      index_2=random.nextInt(6);
      dice_sum=index_1 * index_2 +2;
      if(_point >0){
        checkSecondThrow();
      }else{
        checkFirstThrow();
      }

    });
  }




  void resetGame() {
   setState(() {
     index_1=0;
     index_2=0;
     dice_sum=0;
     _point=0;
     gameOver=false;
     hasGameStarted=false;
   });
  }

  void checkSecondThrow() {
    if(dice_sum==_point){
      status='You Win!!!';
      gameOver=true;

    }
    else if(dice_sum==7){
      status='You Loss!!!';
      gameOver=true;

    }

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
        _point=dice_sum;
        break;



    }
  }
}
