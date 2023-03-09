import 'package:api_integration/service/data_source/data_source.dart';
import 'package:flutter/material.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  


  late final TextEditingController _name;
  late final TextEditingController _jobAppliedFor;
  late final String id;
  late final DateTime date;

  @override
  void initState() {
    _name = TextEditingController();
    _jobAppliedFor = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _jobAppliedFor.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: () {
                  Navigator.pop(context);
              }, 
              icon: const Icon(Icons.arrow_back, color: Colors.black,)
              ),
              const SizedBox(height: 100,),
              const Text("Create Account", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              TextField(
                controller: _name,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: "Enter Your Email",
                ),
              ),
              TextField(
                controller: _jobAppliedFor,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Job Applied For",
                ),
              ),
              const SizedBox(height: 20,),
              TextButton(onPressed: () async{
              final name = _name.text;
              final jobAppliedFor = _jobAppliedFor.text;
              _name.clear();
              _jobAppliedFor.clear();
              
              var res = await createUser(name, jobAppliedFor);


              final snackBar = SnackBar(
              content:  Column(children: [
                Text("Name:${res['name']}"),
                Text("Job:${res['job']}"),
                Text("Id:${res['id']}"),
                Text("Created:${res['createdAt']}")
                ],
                ),
              backgroundColor: (Colors.black12),
              action: SnackBarAction(
                label: 'dismiss',
                onPressed: () {
                },
            ),
            );
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
              
              }, 
              child: const Text("Register", style: TextStyle(color: Colors.black),)
              )
            ],
          ),
        ),
      )
    );
  }
}