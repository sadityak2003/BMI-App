import 'package:flutter/material.dart';

import 'Intro Page.dart';

void main() {
  runApp(const HomePage());
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My BMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //BMI APP

  var weights = TextEditingController();
  var feets = TextEditingController();
  var inches = TextEditingController();

  var result = "";
  var image = "";
  var bgColor = Colors.amber;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: const Text('Home Page'),
      ),
      body: Center(
        child: Container(
          width: 300,
          //color: Colors.amber,
          child: Column(
            children: [
             Container(
                 width: 80,
                 height: 80,
                //color: Colors.cyan,
                 child: Image.asset('assets/images/bmi.png'),
            ),

              SizedBox(
                height: 20,
              ),

              TextField(
                controller: weights,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.line_weight,
                  ),
                  label: Text('Enter Your Weight(in Kgs)'),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              TextField(
                controller: feets,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.height,
                  ),
                  label: Text('Enter Your Height(in Feets)'),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              TextField(
                controller: inches,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.height,
                    ),
                    label: Text('Enter Your Height(in Inches)')
                ),
              ),

              SizedBox(
                height: 20,
              ),

              ElevatedButton(
                  onPressed: (){
                    var weight = weights.text.toString();
                    var feet = feets.text.toString();
                    var inch = inches.text.toString();

                    if(weight!="" && feet!="" && inch!=""){

                      var wt = int.parse(weight);
                      var ft = int.parse(feet);
                      var inchs = int.parse(inch);

                      var Feet = (ft*12) + inchs;
                      var CentiM = Feet*2.54;
                      var Meter = CentiM/100;
                      var bmi =(wt)/(Meter*Meter);

                      var message = "";

                      if(bmi>25){
                        message = "You're Overweight!!";
                        bgColor = Colors.amber;
                      }
                      else if(bmi<18){
                        message = "You're Underweight!!";
                        bgColor = Colors.red;
                      }
                      else{
                        message = "You're Healthy!!";
                        bgColor = Colors.green;
                      }

                      setState(() {
                        result = "$message \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                      });
                    }

                    else{
                      setState(() {
                        result = "Please Fill All The Required Fields!!";
                      });
                    }

                  },
                  child: Text('Calculate')),

                  SizedBox(
                    height: 10,
                  ),

                  Text(result, style: TextStyle(fontSize: 16, color: Colors.black),),

              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => IntroPage()));
              }, child: Text('>>', style: TextStyle(fontSize: 21, color: Colors.black),)
              ),


            ],
          ),
        ),
      )
    );
  }
}
