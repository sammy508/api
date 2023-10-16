import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;

class UploadImageToAPI extends StatefulWidget {
  const UploadImageToAPI({Key? key}) : super(key: key);

  @override
  State<UploadImageToAPI> createState() => _UploadImageToAPIState();
}

class _UploadImageToAPIState extends State<UploadImageToAPI> {
  File? image; // Store the file path of the image
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future getImage()async {
final  pickedfile= await _picker.pickImage(source:ImageSource.gallery,imageQuality: 80);
if(pickedfile!=null){
image= File(pickedfile.path);
setState(() {
  

});



}else{
print("No Image selected");
}
  }

  Future <void> uploadImage()async{
    setState(() {
      showSpinner=true;
    });

    var stream = new http.ByteStream(image!.openRead());
stream.cast();
 var length = await image!.length();
 var url = Uri.parse('https://fakestoreapi.com/products');

 var request = new http.MultipartRequest('POST', url);
 request.fields['title'] ="static title";
  var Multiport = new http.MultipartFile('images', stream, length);
  request.files.add(Multiport);

  var response= await request.send();
  if (response.statusCode==200){
     setState(() {
      showSpinner=false;
    });
    print('Images uploaded');

  }else{
      print('Images uploaded failed');
     setState(() {
      showSpinner=false;
    });

  }

  


  
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Upload Image"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: (){
                getImage();
              },
              child: Container(
                child: image == null
                    ? const Center(child: Text("Pick an Image"))
                    : Container(
                        child: Center(
                          child: Image.file(
                            image!,
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
            ),
            SizedBox(height: 150,
            
            ),
            GestureDetector(
              onTap: (){
                uploadImage();
              },
              child: Container(
                height: 100,
                width: 200,
                color: Colors.blue,

                child:const  Center(child: Text('Upload')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
