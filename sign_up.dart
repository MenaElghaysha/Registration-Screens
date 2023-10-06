import 'package:flutter/material.dart';


class Sign_up extends StatefulWidget {

  static final route='/Sign_up';


  @override
  State<Sign_up> createState() => Sign_up_State();
}


class Sign_up_State extends State<Sign_up> {


  GlobalKey<FormState>formstate=GlobalKey<FormState>();
  late   TextEditingController _pass = TextEditingController()!;
  late  TextEditingController _confirmPass = TextEditingController()!;


    var email;
  // Initially password is obscure
  final bool _obscureText = true;
  bool _isPasswordConfirmed = false;



  @override
  void Ok() {
    var formdata =formstate.currentState!;
    if (formdata.validate() ){
      formdata.save();
      print("valid");
    }else print("Invalid");

  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      //drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 50),
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



            Text("SIGN UP ",style: TextStyle(
              color: Color(0xff37ecba),
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),),


            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(top: 20,bottom: 20),
              child: Column(
                children: [

                  Form(
                    key: formstate,
                    child:Column(
                      children: [
                        Material(
                          elevation: 5.0,
                          shadowColor: const Color(0xffbebebe),
                          child:
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            onSaved:(text){
                              email=text;
                            },

                            validator:(text){
                              if(text!=null&& !text.contains('@')){
                                return "Invalid Email";
                              }
                              return null;
                            },

                            keyboardType:TextInputType.emailAddress,
                            decoration:
                             const InputDecoration(
                                 labelText:"Email ",
                                 labelStyle: TextStyle(fontSize:18, color:Color(0xffbebebe), fontWeight: FontWeight.w600,),
                                contentPadding: EdgeInsets.only(left: 30,top: 20,bottom: 20,right: 15),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width:1)),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.tealAccent))
                            ),
                          ),
                        ),

                          SizedBox(height: 30,),




                      Material(
                        elevation: 5.0,
                        shadowColor: Color(0xffbebebe),

                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (text) =>(text!=null && text.length< 6 )? 'Password too short.' : null,
                          controller: _pass,
                          obscureText: _obscureText,
                          decoration: const InputDecoration(
                              labelText:"Password",
                              labelStyle: TextStyle(fontSize:18, color:Color(0xffbebebe), fontWeight: FontWeight.w600,),
                              contentPadding: EdgeInsets.only(left: 30,top: 20,bottom: 20,right: 15),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width:1)),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.tealAccent))
                          ),
                         // onSaved: (text){_pass=text as TextEditingController;},
                        ),
                      ),


                        SizedBox(height: 30,),


                        Material(
                          elevation: 5.0,
                          shadowColor: Color(0xffbebebe),

                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            obscureText: _obscureText,
                            // autovalidateMode:(_isPasswordConfirmed?AutovalidateMode.disabled :AutovalidateMode.onUserInteraction),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: _confirmPass,
                            validator:(text){
                              if(text==null )      return"empty";
                              if(! _isPasswordConfirmed)     return "password doesn't match";
                              return null;
                            },
                            //onSaved: (text){_confirmPass=text as TextEditingController;},
                            decoration: const InputDecoration(
                                labelText:" Confirm Password",
                                labelStyle: TextStyle(fontSize:18, color:Color(0xffbebebe), fontWeight: FontWeight.w600,),
                                contentPadding: EdgeInsets.only(left: 30,top: 20,bottom: 20,right: 20),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width:1)),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.tealAccent))
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),



                  Container(
                    margin: const EdgeInsets.only(left: 178,right: 20,top: 30,bottom: 20),
                    child: ElevatedButton(onPressed: (){

                        setState(() {
                          _isPasswordConfirmed =
                              _pass.text == _confirmPass.text;
                        });
                    },

                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff37ecba),
                          padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15), // Background color
                      ),
                      child: Text("Sign up",style: TextStyle(color: Colors.white,fontSize: 22),maxLines: 1), ),
                  ),



                ],
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xff37ecba),
                  textStyle: const TextStyle (fontSize:22,fontWeight:FontWeight.w700,),
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text('Login'),),
            ),




          ],
        ),
      ),
    );
  }
}