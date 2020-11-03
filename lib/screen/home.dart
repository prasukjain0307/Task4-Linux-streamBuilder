import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Linux"),
        backgroundColor: Colors.black87,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.laptop_chromebook), onPressed: null)
        ],
      ),
    
      body:
      Container(
    alignment: Alignment.center,
    width: double.infinity,
    height: double.infinity,
    color: Colors.grey.shade200,
    
    child: Column(

      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey,
              width: 3,
            ),
          ),
          margin: EdgeInsets.all(50),
       
          alignment: Alignment.center,
          width: 500,
          height: 270,
         

          child:Container(
            decoration: BoxDecoration(
               image: DecorationImage(
            image:NetworkImage(
                    'https://cdn.pixabay.com/photo/2013/07/12/16/59/linux-151619__340.png'),
                fit: BoxFit.fill,
              ),
              ),
              
          
        ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey,
              width: 5,
            ),
          ),

          width:double.infinity,
          height: 50,
          margin: EdgeInsets.all(20),
          //color:Colors.black54,
          child: Center(
            child: Text('Register Here',
            style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
          ),
        ),
        
  
       Center(
        child: Container(
          width: 300,
          height:100,
          child: Column(
            children: <Widget>
            [
              Material(
                color: Colors.cyan.shade600,
                borderRadius: BorderRadius.circular(20),
                elevation: 10,
                child:MaterialButton(
                  minWidth: 200,
                  height: 40,
                  child: Text('register'),
                  onPressed: ()
                  {
                    Navigator.pushNamed(context, "reg");
                  },)

              ),
              SizedBox(
                height: 30,
              ),

              //  Material(
              //   color: Colors.redAccent,
              //   borderRadius: BorderRadius.circular(20),
              //   elevation: 10,
              //   child:MaterialButton(
              //     minWidth: 200,
              //     height: 40,
              //     child: Text('login'),
              //     onPressed: ()
              //     {
              //       Navigator.pushNamed(context, "login");
              //     },)

              // )
            ]
          ),
        ),
      ),
          ],
    ),
 ),

    );
  
    
  }
}