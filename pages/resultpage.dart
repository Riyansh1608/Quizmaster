import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizmaster/pages/homescreen.dart';

class result extends StatefulWidget {
  int marks;
  result({Key? key , required this.marks}): super(key : key);
@override
  _resultState createState() => _resultState(marks);
}

class _resultState extends State<result> {

  List<String> images =[
    "images/success.png",
    "images/good.jpg",
    "images/worst.jpg",
  ];
  int marks;
  _resultState(this.marks);
  String resultimage="";
  String message="";
  String score="";
  Color sc= Colors.lightGreenAccent;


  @override

  void initState()
  {
    if(marks==100)
      {
        resultimage=images[0];
        message="You Did Very Well...." ;
        score="SCORE : $marks/100";
      }
    else if(marks<40)
      {
        resultimage=images[2];
        message="You Should Try Hard...." ;
        score="SCORE : $marks/100";
        sc = Colors.red;
      }
    else
      {
        resultimage=images[1];
        message="You Can Do Better...." ;
        score="SCORE : $marks/100";
        sc = Colors.amber;
      }
  }







  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Result',
        ),
      ),
      body:Column(
        children: [
          Expanded(
            flex:5,

              child:Material(
                child: Container(
                  child: ClipRect(
                    child: Image(
                      image : AssetImage(
                        resultimage,
                      ),
                    ),
                  ),
                ),
              ),

          ),
         // SizedBox(width: 10,height: 15,),
     /*     Expanded(
            flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 15.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text(
                      message,
                      style: TextStyle(
                        fontFamily: "Satisfy",
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,

                      ),
                    )
                    ),
                  ],
                ),
              )
          ),
*/
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text(
                      score,
                      style: TextStyle(
                        fontFamily: "Alike",
                        fontSize: 40.0,
                        fontWeight: FontWeight.w600,
                        color: sc,

                      ),
                    )
                    ),
                  ],
                ),
              )
          ),
          Expanded(
            flex : 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(

                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Home(),
                        ));
                      },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 50), primary: Colors.indigoAccent[600]),


                      child: Text(
                        "Continue",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22.0,
                          fontFamily: "Times New Roman",
                          fontStyle: FontStyle.italic

                        ),
                      ),


                  ),
                ],
              ),
          ),
        ],
      )
    );
  }
}
