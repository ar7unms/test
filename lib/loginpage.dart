import 'package:flutter/material.dart';
import 'package:test_program/firstpage.dart';
class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String email="",password="",message="";
  TextEditingController n1 =new TextEditingController();
  TextEditingController n2 =new TextEditingController();
  // void loginCheck()async{
  //   email=n1.text;
  //   password=n2.text;
  //   print("emailid:$email");
  //   print("password:$password");
  //   final response=await userApiservice().loginApi(email,password);
  //   print(response["status"]);
  //   if(response["status"]=="Success")
  //   {
  //     String userId =response["userData"]["userid"].toString();
  //     String token =response["token"].toString();
  //     print(userId);
  //     print(token);
  //     SharedPreferences.setMockInitialValues({});
  //     SharedPreferences preferences = await SharedPreferences.getInstance();
  //     preferences.setString("userid", userId);
  //     preferences.setString("token", token);
  //     Navigator.push(context, MaterialPageRoute(builder: (context)=>UserHomePage()));
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEC6813),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 100.0, left: 40.0, right: 40.0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>nextPage()));
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'USER LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0),
                CardTextField(
                  controller: n1,
                  labelText: 'Email',
                  icon: Icons.mail,
                  obscureText: false,
                ),
                SizedBox(height: 20.0),
                CardTextField(
                  controller: n2,
                  labelText: 'Password',
                  icon: Icons.lock,
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstPage()));
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't you have account?", style: TextStyle(color: Colors.black),),
                    TextButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.amber,
                        ),onPressed: ()
                    {
                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>UserSignup()));
                    }, child: Text("Sign Up",
                      style: TextStyle(color: Colors.black),))
                  ],
                ),
                Center(
                  child: TextButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.amber,
                      ),onPressed: ()
                  {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPage()));
                  }, child: Text("Forgot Password",
                    style: TextStyle(color: Colors.black),)),
                ),
                // Center(
                //   child: TextButton(
                //       style: ElevatedButton.styleFrom(
                //         foregroundColor: Colors.amber,
                //       ),onPressed: ()
                //   {
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=>adminLogin()));
                //   }, child: Text("ADMIN",
                //     style: TextStyle(color: Colors.black),)),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardTextField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;

  const CardTextField({
    required this.labelText,
    required this.icon,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              obscureText: obscureText,
              controller: controller,
              decoration: InputDecoration(
                labelText: labelText,
                prefixIcon: Icon(icon),
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

