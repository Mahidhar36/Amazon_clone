import 'package:amazon_clone/common_widgets/materialbutton.dart';
import 'package:amazon_clone/common_widgets/textfieldwidget.dart';
import 'package:amazon_clone/constants/globalVaiables.dart';
import 'package:amazon_clone/features/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth{
  signin,
  signup
}

class AuthScreen extends StatefulWidget {
  static  const  String routeName= "auth_screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth=Auth.signup;
 

 final _singupkey=GlobalKey<FormState>();
  final _singinkey=GlobalKey<FormState>();

final TextEditingController _emailcontroller=TextEditingController();
final TextEditingController _passwordcontroller=TextEditingController();
final TextEditingController _namecontroller=TextEditingController();
final AuthService authService=AuthService();
@override
  void dispose() {
    super.dispose();
    
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _namecontroller.dispose();
  }
void signup(){
  authService.signupUser(email: _emailcontroller.text, name: _namecontroller.text, password: _passwordcontroller.text, context: context);
}
void signin(){
  authService.signinUser(email: _emailcontroller.text, password: _passwordcontroller.text, context: context);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Text("Welcome",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
              ),
              ListTile(title: const Text("Create a Account"),
              leading: Radio(activeColor: GlobalVariables.secondaryColor,value: Auth.signup,groupValue: _auth,onChanged: (Auth? val){
                setState(() {
                  _auth=val!;

                });
                
              },),),
              if(_auth==Auth.signup)
                Container(
                  color: GlobalVariables.backgroundColor,
                  child: Form(key: _singupkey, 
                  child:Column(children: [
                    TextFiled(textEditingController: _namecontroller,hinttext: "Name",),
                    const SizedBox(height: 5,),
                    TextFiled(textEditingController: _emailcontroller,hinttext: "Email",),
                     const SizedBox(height: 5,),
                     TextFiled(textEditingController: _passwordcontroller,hinttext: "Password",),
                     const SizedBox(height: 5,),
                     MatButton(text: "Signup",ontap: (){
                      FocusScope.of(context).unfocus();
                      if(_singupkey.currentState!.validate()){
                        
                         signup();
                      }
                      
                     },)
                      
                
                  ]) ,),
                ),
              ListTile(title: const Text("Sign In"),
              leading: Radio(activeColor: GlobalVariables.secondaryColor,value: Auth.signin,groupValue: _auth,onChanged: (Auth? val){
                setState(() {
                  _auth=val!;

                });
              },),),
              if(_auth==Auth.signin)
                Container(
                  color: GlobalVariables.backgroundColor,
                  child: Form(key: _singinkey, 
                  child:Column(children: [
                   
                    TextFiled(textEditingController: _emailcontroller,hinttext: "Email",),
                     const SizedBox(height: 5,),
                     TextFiled(textEditingController: _passwordcontroller,hinttext: "Password",),
                    const SizedBox(height: 5,),
                     MatButton(text: "SignIn",ontap: (){
                      FocusScope.of(context).unfocus();
                      if(_singinkey.currentState!.validate()){
                        
                         signin();
                      }
                     },)
                      
                
                  ]) ,),
                ),
            ],
        
            ),
        )));
  }
}