import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleFour extends StatefulWidget {
  const ExampleFour({super.key});

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  var data;

  Future<Void> getpostApi()async {

final response =  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

if( response.statusCode ==200){
data = jsonDecode(response.body.toString());
}
return data;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Data without model'),
        centerTitle: true,
      ),
      body: Column(
     children: [
      Expanded(child:FutureBuilder(future: getpostApi(),
       builder: (context, snapshot){

if(snapshot.connectionState== ConnectionState.waiting){
return const  Center(child: LinearProgressIndicator());
}else{
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {  
           return Card(
              child: Column(
                children: [
                   ReusableROw(title: 'name',value:data[index]['name'].toString(),),
                   ReusableROw(title: 'Username',value:data[index]['username'].toString(),),
                   ReusableROw(title: 'E-mail',value:data[index]['email'].toString(),),
                   ReusableROw(title: 'Address',value:data[index]['address']['city'].toString(),),
            
                ],
                 ),
            );
            },
          ),
        );}
       }
       ),
      )
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
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                      Text(title),
                                      Text(value),
                                        ],
                                    
                                      ),
    );
  }
}