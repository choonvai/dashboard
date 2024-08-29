import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hightech_system/features/core/constant/constant.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap:() => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.grey,
          body:Center(
            child: Column(
              children: [
                Text('Login',style:GoogleFonts.jura(color: Constant.orange,fontSize:MediaQuery.of(context).size.width*0.04)),
                Spacer(),
                SizedBox(
                  width: 400,height:100,
                  child: TextField(
                    textAlign: TextAlign.center,
                    style:GoogleFonts.jura(color: Colors.orange,fontSize:MediaQuery.of(context).size.width*0.04),
                    decoration: InputDecoration(
                      floatingLabelAlignment:FloatingLabelAlignment.center,
                      labelText: 'Password',
                      labelStyle:GoogleFonts.jura(color: Colors.orange,fontSize:40),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:Colors.orange))
                    ),
                  ),
                ),
                SizedBox(height: 100,),
                SizedBox(
                  width: 200,
                  height:  50,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 1,
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side:BorderSide(color: Constant.orange,width: 1)
                      )
                    ),
                    child: Text(
                      'login',
                     style: GoogleFonts.jura(color:Constant.orange,fontSize:30),
                    ),
                  ),
                ),
                SizedBox(height: 100,),
              ],
            ),
          )
        ),
      ),
    );
  }
}