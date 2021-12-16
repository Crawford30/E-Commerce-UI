import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/screens/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}


final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);
bool observeText = true;





class _SignUpState extends State<SignUp> {

  void validation() {
    final FormState?  _form = _formKey.currentState;
    if(_form!.validate()){
      print("YES");
    } else {
      print("NO");
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //solved overflow bottom error https://github.com/flutter/flutter/issues/13339
      body: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              child: Column(
                children: [
                  Container(
                    height:150,
                    //MediaQuery.of(context).size.height*0.3,
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
                              validator: (value){
                                if(value =="") {
                                  return "Please fill Username";
                                } else if(value!.length < 6) {
                                  return "Username Is Too Short";
                                }
                                return "";
                              },
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
                              validator: (value) {
                                if(value == "") {
                                  return "Please Enter E-mail";
                                } else if(!regExp.hasMatch(value!)){
                                  return "E-mail Is Invalid";
                                }
                                return "";
                              },
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
                              obscureText: observeText,
                              validator: (value){
                                if(value == "") {
                                  return "Password Is Required";
                                } else if(value!.length < 8){
                                  return "Password is Too Short";
                                }
                                return "";
                              },
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: (){

                                    setState(() {
                                      observeText = !observeText;
                                    });
                                    FocusScope.of(context).unfocus();
                                  },
                                  child:  Icon(
                                    observeText == true ?  Icons.visibility: Icons.visibility_off,
                                    color: Colors.black,),
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
                              validator: (value){
                                if(value == "") {
                                  return "Phone Number Is Required";
                                } else if(value!.length < 11){
                                  return "Phone Number must be 11";
                                }
                                return "";
                              },
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
                                  validation();
                              },
                              ),
                            ),

                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have An Account?"),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => Login(),),);
                                  },
                                  child: Text("Login", style: TextStyle(
                                    color: Colors.cyan,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
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



      ),
    );
  }
}
