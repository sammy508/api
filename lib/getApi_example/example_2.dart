import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projectapione/model/getApi_model/example2_model.dart';
import 'package:http/http.dart' as http;
class PhotosScreen extends StatefulWidget {
  const PhotosScreen({super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {

List<PhotosModel> photosmodel =[];

Future<List<PhotosModel>>getpostApi()async{

  final  response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  var data = jsonDecode(response.body.toString());
  if( response.statusCode==200){
    for(Map i in data ){
      
PhotosModel photos = PhotosModel(title: i['title'], url: i['url'], id: i['id']);
photosmodel.add(photos);
    }
    return photosmodel;
  }else{
    return photosmodel;
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Api Hit", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          
          Expanded(
            child: FutureBuilder(
              
              
              future: getpostApi(), builder: (context, snapshot){
                
              return ListView.builder(
                itemCount: photosmodel.length,
                
                itemBuilder: (BuildContext context, int index) { 
                  return ListTile(

                    title:  Text(snapshot.data![index].title.toString()),
                    subtitle: Text(snapshot.data![index].id.toString()), 
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                    ),
                  );
                 },
                
              );
            }),
          )
        ],
      ),
    );
  }
}