

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' ;
class LOginPOstApi extends StatefulWidget {
  const LOginPOstApi({super.key});

  @override
  State<LOginPOstApi> createState() => _ExamPle_PostApiState();
}


void login(String email, String password)async {
try{
  Response response = await  post(Uri.parse('https://reqres.in/api/login'),
  
  body: {
'email':email,
'password':password,
  }
  
  );
  if(response.statusCode==200){
print("Login sucessfully");
  }else{
    print('Login failed');
  }


}catch(e){
print(e.toString());
}
}
class _ExamPle_PostApiState extends State<LOginPOstApi> {
  @override
  Widget build(BuildContext context) {

TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller:emailcontroller ,
              decoration: InputDecoration(
              
                hintText: 'E-mail',
          border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
          ),
        ),
            ),
            SizedBox(height: 8,),
      
            TextFormField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                hintText: 'password',
          border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
          ),
        ),
            ),
      
            SizedBox(height: 12,),
      
            ElevatedButton(onPressed: (){
      login(emailcontroller.text.toString(), passwordcontroller.text.toString());
            }, child: Text('Login')),
          ],
        ),
      ),
    );
  }
}