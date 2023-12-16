import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: const Text('Intro Page'),
      ),
      body: Container(
                alignment: Alignment.bottomRight,
                  child:
                    ElevatedButton(onPressed: (){

                    }, child: Text('>>', style: TextStyle(fontSize: 21, color: Colors.black),)),
              ),



    );
  }
}
