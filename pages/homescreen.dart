import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizmaster/pages/quizpage.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> images = [
    "taj.jpg",
    "rajya.jpg",
    "cap.png",
    "abdulji.jpg",
    "modi.jpg",
  ];


  Widget customcard(String quizname, String pic){
    return Padding(
        padding: EdgeInsets.all(
            20.0,
        ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => getjson(quizname),
          ));
        },

        child: Material(
          color: Colors.indigo,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ) ,
                        child: Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(110.0),
                          child:Container(
                            height: 200.0,
                            width: 200.0,
                            child:ClipOval(
                              child:Image(
                                fit: BoxFit.cover,
                                image:AssetImage('images/$pic'),
                              ),
                            ),
                          ),
                        ),
                ),
                Center(
                  child:Text(
                    quizname,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ),
                Container(
                  padding:EdgeInsets.all(20.0),
                  child: Text(
                    ' A detailed Quiz on "$quizname" ',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontFamily: "Alike",
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      backgroundColor: Colors.cyan,
      drawer: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Drawer(
          elevation: 20.0,
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            

            children: [
              const DrawerHeader(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(bottom: 20.0),

                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                ),
                child: Image(
                  image: AssetImage("images/uc.jpg",

                  ),

                ),
              ),
              ListTile(
                tileColor: Colors.blueAccent,
                onTap: (){},
                leading: Icon(
                  Icons.login,
                  size: 35.0,

                  color: Colors.black87,
                ),

                title: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              ListTile(
                tileColor: Colors.blueAccent,
                onTap: (){},
                leading: Icon(
                  Icons.transit_enterexit_sharp,
                  size: 35.0,

                  color: Colors.black87,
                ),

                title: Text(
                  "Exit",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              ListTile(
                tileColor: Colors.blueAccent,
                onTap: (){},
                leading: Icon(
                  Icons.info_outline,
                  size: 35.0,

                  color: Colors.black87,
                ),

                title: Text(
                  "About Us",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          )
        ),
      ),
      appBar: AppBar(
        toolbarHeight:70.0,

        title: Text(
            'QuizMaster',
          style: TextStyle(
            fontFamily: "Quando",
            fontWeight: FontWeight.bold,
            fontSize: 26.0,
            letterSpacing: 1,
          ),
        ),
      ),
      body:ListView(
        children:[
          customcard("Seven wonders of world",images[0]),
          customcard("states of india",images[1]),
          customcard("Capital cities",images[2]),
          customcard("presidents of India",images[3]),
          customcard("Prime ministers of India",images[4]),


        ],
      )
    );
  }
}
