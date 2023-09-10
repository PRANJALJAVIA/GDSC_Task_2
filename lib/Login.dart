import 'package:flutter/material.dart';
import 'SignUp.dart';
import 'package:quickalert/quickalert.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailText = TextEditingController();
  var passText = TextEditingController();
  var emailId = "jp123@gmail.com";
  var Password = "123456";

  void showAlertWarning() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.warning,
      title: 'Please enter id and password',
    );
  }

  void successAlert() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
    );
  }

  void errorAlertPassword() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      text: 'Invalid password',
      title: 'Invalid credentials',
    );
  }

  void errorAlertEmail() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      text: 'User not exist, plese sign up',
      title: 'Invalid credentials',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 200.0),
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black)),

              SizedBox(height: 30.0,),

              TextField(
                controller: emailText,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                        width: 2,
                      )
                  ),
                  prefixIcon: Icon(Icons.email),
                ),
              ),

              SizedBox(height: 30,),

              TextField(
                controller: passText,
                obscureText: true,
                // obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      )
                  ),
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(5)
                  // )
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                        width: 2,
                      )
                  ),
                  // suffixText: "Enter Name",
                  // prefixText: "Hello",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),

              SizedBox(height: 30.0,),

              ElevatedButton(onPressed: (){

                setState(() {
                  final email = emailText.text;
                  final password = passText.text;

                  if (email.isNotEmpty && password.isNotEmpty) {
                    if (email == emailId && password != Password) {
                      errorAlertPassword();
                    }
                    else if(email != emailId) {
                      errorAlertEmail();
                    }
                    else{
                      successAlert();
                    }
                  } else {
                    showAlertWarning();
                  }
                });

              }, child: Text('Login')),
              // SizedBox(height: 30.0,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text('New User than '),
              //     ElevatedButton(onPressed: (){
              //       Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp() ));
              //     }, child: Text('Sign Up'))
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}



