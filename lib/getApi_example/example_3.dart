import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:projectapione/model/postt_model/user_model.dart';

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserModel> userlist = [];
  Future<List<UserModel>> getpostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        userlist.add(UserModel.fromJson(i));
      }

      return userlist;
    } else {
      return userlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Api Hitting"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getpostApi(),
                  builder: (context, snapshots) {
                    if (!snapshots.hasData) {
                      return const CircularProgressIndicator(
                          backgroundColor: Color(0xff000000),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xfffd7013)));
                    } else {
                      return ListView.builder(
                          itemCount: userlist.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                       
                                       
                                        ReusableROw(title: 'Name :', value:snapshots.data![index].name.toString(),),
                                        ReusableROw(title: 'Username :', value:snapshots.data![index].username.toString(),),
                                        ReusableROw(title: 'E-mail :', value:snapshots.data![index].email!.toString(),),
                                        ReusableROw(title: 'Address :', value:snapshots.data![index].address!.city.toString() + snapshots.data![index].address!.geo!.lat.toString()+ snapshots.data![index].address!.geo!.lng.toString()),
                                     
                                     
                                      ],
                                  
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    }
                  }))
        ],
      ),
    );


  }
}



class ReusableROw extends StatelessWidget {
  String title, value;
   ReusableROw({super.key, required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return   Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                    Text(title),
                                    Text(value),
                                      ],
                                  
                                    );
  }
}