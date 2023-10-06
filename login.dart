
import 'package:flutter/material.dart';
import 'package:login_signup/Screens/sign_up.dart';


class Login extends StatefulWidget {

  static final route='/';

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  // Initially password is obscure
  bool _obscureText = true;

  //late String _password;

  // Toggles the password show status
  // void _toggle() {
  //   setState(() {
  //     _obscureText = !_obscureText;
  //   });
  // }


  GlobalKey<FormState>formstate=new GlobalKey<FormState>();

  send(){
    var formdata=formstate.currentState!;
    if (formdata.validate() ){
      formdata.save();
      print("username:${username}");
      print("password:${password}");

    }else{
      print("invalid");
    }
  }

  String value="";
//TextEditingControllerusername=newTextEditingController();
  var username;
  var password;


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      //drawer: const Drawer(),
        //resizeToAvoidBottomInset: false,

        body:
        SingleChildScrollView(
          child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(
              margin: EdgeInsets.only(bottom: 70),
              padding: EdgeInsets.only(top: 20,left: 20),
              height: MediaQuery.of(context).size.height-550,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff71afd2),
                      Color(0xff38eaba),
                    ],
                  )
              ),
              child: IconButton(
                onPressed: (){},
                alignment: Alignment.topLeft,
                icon: Icon(Icons.menu_rounded,size: 35,color: Colors.white,),
              ),
            ),



          Text("LOGIN",style: TextStyle(color: Color(0xff37ecba), fontSize: 40, fontWeight: FontWeight.w600,),),

            SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(top: 20,bottom: 20),
              child: Column(
                children: [
                  Form(
                    key: formstate,
                      child:Material(
                        elevation: 5.0,
                        shadowColor: const Color(0xffbebebe),
                        child:
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onSaved:(text){username=text;},

                          validator:(text){
                            if(text!=null&& !text.contains('@'))    return "Invalid Email";
                            return null;
                          },
                          keyboardType:TextInputType.emailAddress,
                          decoration:
                          const InputDecoration(
                              labelText:"Email",
                              labelStyle:
                              TextStyle(fontSize:18, color:Color(0xffbebebe), fontWeight: FontWeight.w600,),
                                 contentPadding: EdgeInsets.only(left: 30,top: 20,bottom: 15,right: 20),
                                 enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width:1)),
                                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.tealAccent))
                          ),
                        ),
                      ),
                  ),



                SizedBox(height: 30,),


                Form(
                  child:Material(
                    elevation: 5.0,
                    shadowColor: Color(0xffbebebe),

                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSaved:(text){password=text;},
                      validator:(text){
                        if(text!=null&&(text.length<6))    return "Wrong Password";
                        return null;
                      },

                  obscureText: _obscureText,
                  decoration: const InputDecoration(
                      labelText:"Password",
                      labelStyle: TextStyle(
                        fontSize:18,
                        color:Color(0xffbebebe),
                        fontWeight: FontWeight.w600,
                      ),
                      contentPadding: EdgeInsets.only(left: 30,top: 20,bottom: 15,right: 20),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width:1)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.tealAccent)
                      )
                  ),
                ),
              ),
            ),

                ],
              ),
            ),

                SizedBox(height: 30,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: (){}, child: Text("Forget Password ?",style: TextStyle(color: Color(0xff37ecba),fontSize: 18,fontWeight: FontWeight.w600),)),
                ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff37ecba),
                    padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15)// Background color
                  ),
                  child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 22),), ),
              ],
            ),

             const SizedBox(height: 80,),

           SizedBox(
             width: MediaQuery.of(context).size.width,
             height: 70,
             child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xff37ecba),
                textStyle: const TextStyle (fontSize:22,fontWeight:FontWeight.w700,),),
                onPressed: (){Navigator.pushNamed(context, Sign_up.route);},
              child: const Text('Sign Up'),),
           ),


          ],
      ),
        ),
    );
  }
}