import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projectapione/model/getApi_model/postModel.dart';
import 'package:projectapione/model/postt_model/postModel.dart';

class HOmeScreen extends StatefulWidget {
  const HOmeScreen({super.key});

  @override
  State<HOmeScreen> createState() => _HOmeScreenState();
}

class _HOmeScreenState extends State<HOmeScreen> {


  List<PostModel> postList=[];
Future<List<PostModel>> getpostApi()async{

  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  
  var data = jsonDecode(response.body.toString());
  if(response.statusCode==200){
   for (Map<String, dynamic> i in data) {
        postList.add(PostModel.fromJson(i));
      }
    return postList;

  }else{
return postList;
  }





}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text("API"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getpostApi(), 
            builder: (context, snapshot){
              if(!snapshot.hasData){
          return const Text("loading");
          
              }
              else{
                print(snapshot);
          return ListView.builder(
            itemCount: postList.length,
            itemBuilder: (context, index){
          
          return Padding(
             padding: const EdgeInsets.all(8.0),
             child:   Card(
              
            
               child: Column(
            
                 mainAxisAlignment: MainAxisAlignment.start,
            
                 crossAxisAlignment: CrossAxisAlignment.start,
            
                 children: [
            Text(postList[index].id.toString(),),
           const  Text("TItle", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                   Text(postList[index].title.toString(), style:const  TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                   SizedBox(height: 5,),
                   const  Text("Description", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                   
                    Text(postList[index].body.toString(), style:const  TextStyle(fontSize: 13,),),
                  
            
                   
            
                   // Text(postList[index].body.toString()),
            
                 ],                                            
            
               ),
            
             ),
           );
          });
              }
            }),
          ),
        ],
      )
    );
  }
}