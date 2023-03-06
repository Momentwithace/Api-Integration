import 'package:api_integration/screen/create_user_screen.dart';
import 'package:api_integration/screen/user_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
        
          children: [
            const SizedBox(height: 230,),
            const Text("API INTEGRATION!", style: TextStyle(fontSize: 50, color: Color.fromARGB(255, 25, 75, 115)), textAlign: TextAlign.center,),
            const SizedBox(height: 10,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: Text("To keep connected with us please, create an account.", style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 172, 168, 168)), textAlign: TextAlign.center, ),
            ),
            const SizedBox(height: 40,),
          OutlinedButton(onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(builder: 
              (context) => const CreateUserScreen()));
          }, style:  OutlinedButton.styleFrom(
                            fixedSize: const Size(210, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13.0)),
                            side: const BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 152, 15, 5)),
                            backgroundColor: Color.fromARGB(255, 152, 15, 5) ),
                            
          child: const Text("CREATE", 
          style: TextStyle(color: Colors.white),)
          ),

          const SizedBox(height: 30,),

          OutlinedButton(onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(builder: 
              (context) => const UserPage()));
          }, style:  OutlinedButton.styleFrom(
                            fixedSize: const Size(210, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13.0)),
                            side: const BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 152, 15, 5)),
                            backgroundColor: Color.fromARGB(255, 152, 15, 5) ),
                            
          child: const Text("LIST USERS", 
          style: TextStyle(color: Colors.white),)
          )
          ],
        ),
      ),
     ),
        );
    
  }
}