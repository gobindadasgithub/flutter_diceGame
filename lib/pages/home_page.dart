

import 'package:dice_game/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Game'),
        centerTitle: true,
      ),
      body: Consumer<GameProvider>(
        builder:(context,provider,_)=>Center(

         child: provider.hasGameStarted? _gameSelction(provider) : _startGameSelected(provider),
        ),
      ),

    );
  }

  Widget _startGameSelected(GameProvider provider){

    return ElevatedButton(onPressed: (){ {

provider.start();

      };
    },

        child: Text("Start"));
  }
  Widget _gameSelction(GameProvider provider){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(provider.dice_list[provider.index_1],width: 100,height: 100,),
            const SizedBox(width: 10,),

            Image.asset(provider.dice_list[provider.index_2],width: 100,height: 100,),


          ],

        ),
        const SizedBox(height: 10,),
        SizedBox(
          height: 50,
          width: 200,
          child: ElevatedButton(
            onPressed: provider.gameOver?null :provider.rollTheDice,
            child: Text('Roll'),
          ),
        ),
        const SizedBox(height: 10,),
        Text('Dice Sum : $provider.dice_sum',style: TextStyle(fontSize: 22),),
        const SizedBox(height: 10,),
        if(provider.point>0)
          Text('Your Point : $provider.point',style: TextStyle(fontSize: 22,color: Colors.green),),
        const SizedBox(height: 10,),
        if(provider.point>0 && !provider.gameOver)
          Text('Keep Rolling until your match your point : $provider.point',style: TextStyle(fontSize: 22,backgroundColor: Colors.amber),),
        const SizedBox(height: 10,),
        if(provider.gameOver)
          Text(provider.status,style: TextStyle(fontSize: 10,color: Colors.deepPurple),),
        const SizedBox(height: 10,),
        if(provider.gameOver)
          SizedBox(
            child: ElevatedButton(
              onPressed:provider.resetGame,
              child: Text('Play Again'),
            ),
          )
      ],
    );
  }

}
