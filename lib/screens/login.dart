import 'package:e_commerce_app/screens/signup.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);
bool observeText = true;

class _LoginState extends State<Login> {


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
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: double.infinity,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Login", style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
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
                        border: OutlineInputBorder(),
                        hintText: "E-mail",
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
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
                        border: OutlineInputBorder(),
                        hintText: "Password",
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              observeText = !observeText;

                            });
                          },
                          child:  Icon(observeText == true ? Icons.visibility : Icons.visibility_off , color: Colors.black,),
                        ),
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),


                    Container(
                      height: 45,
                      width: double.infinity,
                      child: RaisedButton(

                        child: Text("Login"),
                        color: Colors.grey,
                        onPressed: (){
                          validation();
                        },
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't Have An Account?"),
                        SizedBox(width: 10,),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => SignUp(),),);
                          },
                          child: Text("Sign Up",
                          style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 20,

                          ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
