import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:quizmaster/pages/resultpage.dart';


class getjson extends StatelessWidget {

  String quizname;
  getjson(this.quizname);
  String assettoload="";

  // a function
  // sets the asset to a particular JSON file
  // and opens the JSON
  setasset() {
    if (quizname == "Seven wonders of world") {
      assettoload = "assets/cpp.json";
    } else if (quizname == "states of india") {
      assettoload = "assets/java.json";
    } else if (quizname == "Capital cities") {
      assettoload = "assets/cap_rajya.json";
    } else if (quizname == "presidents of India") {
      assettoload = "assets/cpp.json";
    } else {
      assettoload = "assets/java.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(assettoload, cache: false),
        builder: (context,snapshot){
          List mydata = json.decode(snapshot.data.toString());
          if(mydata == null)
            {

              return const Scaffold(
                body:Center(
                  child: Text(
                    "Loading",
                  ),
                ),
              );
            }
          else
            {
              return quizpage(mydata: mydata);

            }

        },
    );
  }
}
class quizpage extends StatefulWidget {

  var mydata;
  quizpage({Key? key , @required this.mydata}):super(key : key);

  @override
  _quizpageState createState() => _quizpageState(mydata);
}

class _quizpageState extends State<quizpage> {

  var mydata;
  _quizpageState(this.mydata);

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks=0;
 int i=1;
 int timer=30;
 String showtimer="30";
  Map<String, Color> btncolor={
    "a" :Colors.indigoAccent,
    "b" :Colors.indigoAccent,
    "c" :Colors.indigoAccent,
    "d" :Colors.indigoAccent,
    };

  bool canceltimer =false;


  @override
  void initState() {
    starttimer();
    super.initState();
  }


  void starttimer()async{
    const onesec =Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setStateIfMounted(() {
      if(timer<1)
        {
          t.cancel();
          nextquestion();
        }
      else if(canceltimer==true)
        {
          t.cancel();
        }
      else
        {
          timer=timer-1;

        }
      showtimer = timer.toString();
     });
    });
  }



  void nextquestion()
  {
    canceltimer=false;
    timer=30;
  setState(() {
    if(i<10)
    {
      i++;
    }

    else
    {
      canceltimer=true;

    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context)=> result(marks: marks),
    ));
    }
    btncolor["a"]=Colors.indigoAccent;
    btncolor["b"]=Colors.indigoAccent;
    btncolor["c"]=Colors.indigoAccent;
    btncolor["d"]=Colors.indigoAccent;
  });
  starttimer();
  }

  void checkanswer(String k)
  {
   if(mydata[2][i.toString()]==mydata[1][i.toString()][k])
     {
       marks=marks+10;
       colortoshow=right;
     }
   else{
     colortoshow=wrong;
     }
   setStateIfMounted(() {
     btncolor[k]=colortoshow;
     canceltimer =true;
   });

   Timer(Duration(seconds: 1),nextquestion);
  }

  Widget choicebutton(String k){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(

        onPressed: ()=> checkanswer(k),
        child: Text(
          mydata[1][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Alike",
            fontSize: 16.0,
          ),

        ),
        color: btncolor[k],
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
        height: 45.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0) ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,DeviceOrientation.portraitUp,
    ]);

    return  Scaffold(
         body: Column(
           children: [
             Expanded(
                 flex: 3,
                 child: Container(
                   padding: EdgeInsets.all(20.0),
                   alignment: Alignment.bottomLeft,
                   child: Text(
                     mydata[0][i.toString()],
                     style: TextStyle(
                       fontSize: 16.0,
                       fontFamily: "Quando",
                     ),

                   ),
                 )

             ),

             Expanded(
               flex: 6,
               child: Container(
                 child: Column(
                   mainAxisAlignment:MainAxisAlignment.center,
                   children: [

                     choicebutton('a'),
                     choicebutton('b'),
                     choicebutton('c'),
                     choicebutton('d'),
                   ],
                 ),
               ),
             ),

             Expanded(
                 flex: 1,
                 child: Container(
                   alignment: Alignment.topCenter,
                   child: Text(
                     showtimer,
                     style: TextStyle(
                       fontSize: 32.0,
                       fontFamily: 'Times New Roman',
                       fontWeight: FontWeight.w700,
                     ),
                   ),
                 )

             ),

           ],
         ),
       );

  }
}

