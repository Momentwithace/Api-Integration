import 'package:api_integration/service/data_source/data_source.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
  
}

class _UserPageState extends State<UserPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.brown,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          
        
          title: Center(
            child: Text(
              "All Users",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(
                    future: getUsers(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: SingleChildScrollView(
                              child: Column(children: [
                                for (int x = 0; x < snapshot.data!.length; x++)
                                ListTile(
                                  leading: SizedBox(
                                    height: 100,
                                    width: 50,
                                    child: Image.network(snapshot.data![x].avatar, 
                                    fit: BoxFit.contain,
                                    ),
                                  ),
                                  title: Row(children: [
                                    Text(snapshot.data![x].firstName, style: const TextStyle(fontWeight: FontWeight.bold),),
                                    const SizedBox(width: 5,),
                                    Text(snapshot.data![x].lastName, style:  const TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                  ),
                                  subtitle: Text(snapshot.data![x].email),
                                  onTap: () {
                                    
                                  },
                                  
                                ),
                                
                              ]
                              ),
                            ),
                          ),
                        );
                      }
                      return const Text('loading...');
                    },
                  ),
        ],
          
        ),
      ),
    );
  }
}