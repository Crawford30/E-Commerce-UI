import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //solved overflow bottom error https://github.com/flutter/flutter/issues/13339
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.2,
                width: double.infinity,
                // color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                   Text("Register",
                   style: TextStyle(
                     fontSize: 50,
                     fontWeight: FontWeight.bold
                   ),
                   ),

                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                height:400,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                // color: Colors.blue,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                       //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [


                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Username",

                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),


                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "E-mail",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),



                        TextFormField(
                          decoration: InputDecoration(

                            suffixIcon: GestureDetector(
                              onTap: (){
                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(Icons.visibility, color: Colors.black,),
                            ),

                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Colors.black,

                            ),

                            border: OutlineInputBorder(),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Phone Number",
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),

                            border: OutlineInputBorder(),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),


                        Container(
                          height: 45,
                          width: double.infinity,
                          child: RaisedButton(
                            child: Text("Register"),
                            color: Colors.blueGrey[400],
                            onPressed: (){

                          },
                          ),
                        ),
                        Row(
                          children: [
                            Text("I Have Already An Account"),
                            GestureDetector(
                              child: Text("Login", style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 20,
                              ),
                              ),
                            )
                          ],
                        ),





                      ],
                    ),
                  ),

              ),
            ],
          ),
        ),


      ),
    );
  }
}
