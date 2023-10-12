import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projectapione/model/complex_json_model.dart';

class GetApiLastExample extends StatefulWidget {
  const GetApiLastExample({super.key});

  @override
  State<GetApiLastExample> createState() => _GetApiLastExampleState();
}

class _GetApiLastExampleState extends State<GetApiLastExample> {
  Future<ComplexJsonMOdel> getproductApi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/cfa62a08-1d0e-4802-a03a-edb9e2d397a5'));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ComplexJsonMOdel.fromJson(data);
    } else {
      return ComplexJsonMOdel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {

    final deviceheight = MediaQuery.of(context).size.height;
    final devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Final example'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getproductApi(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(
                          value: CircularProgressIndicator.strokeAlignCenter,
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount:snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
ListTile(
  title: Text(snapshot.data!.data![index].shop!.name.toString()),
  subtitle: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(snapshot.data!.data![index].shop!.shopemail.toString()),
    Text(snapshot.data!.data![index].shop!.shopaddress.toString()),
  ],),
  leading:CircleAvatar(
    backgroundImage: NetworkImage(snapshot.data!.data![index].shop!.image.toString()),
  ),
),

                            Container(
                              height:deviceheight*.3 ,
                              width: devicewidth*1,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.data![index].images!.length,
                                itemBuilder: (context, position){
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8,bottom: 6),
                                  child: Container(
                                    
                                    height: deviceheight*0.25,
                                    width: devicewidth*0.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                         fit:BoxFit.cover,
                                        image:  NetworkImage(snapshot.data!.data![index].images![position].url.toString(),
                                          ),
                                                              )    ),
                                      
                                  ),
                                );
                              }),
                            ),
                        Icon(snapshot.data!.data![index].inWishlist==true?Icons.favorite:Icons.favorite_border_outlined)
                          ],
                        );
                      });
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
