import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_your_way/classes/routes.dart';
import 'package:travel_your_way/constants/imagePicker.dart';
import 'package:travel_your_way/constants/loginConstants.dart';
import 'package:travel_your_way/constants/progressBar.dart';
final TextEditingController nameController  = TextEditingController();
final formKey = GlobalKey<FormState>();
File image;
class AddImage extends StatefulWidget {
  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 32,
          ),
          GestureDetector(
            onTap: () {
              showPicker(context,_imgFromCamera,_imgFromGallery);
            },
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Color(0xffFDCF09),
              child: image != null
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.file(
                  image,
                  width: 150,
                  height: 150,
                  fit: BoxFit.fitHeight,
                ),
              )
                  : Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(50)),
                width: 150,
                height: 150,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.grey[800],
                ),
              ),
            ),
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child:TextFormField(
                controller: nameController,
                obscureText: false,
                decoration: InputDecoration(
                    focusedBorder: textFieldsBorder,
                    disabledBorder: textFieldsBorder,
                    labelStyle: labelstyle,
                    contentPadding: EdgeInsets.all(4.0),
                    border: textFieldsBorder,
                    labelText: 'full name',
                    hintText: "full name"),
                validator: (String value) {
                  if (value.isEmpty ) {
                    return 'name required';
                  }
                  return null;
                },
              ),
            ),

          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: MaterialButton(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 55.0),
              onPressed: (){
                if(formKey.currentState.validate()){
                  navigateToHome(context);
                  pr.show();
                }

              },
              color: Colors.redAccent,
              child: Text("continue",style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
              ),),
            ),
          ),
        ],
      ),
    );
  }
_imgFromCamera() async {
  File image = await ImagePicker.pickImage(
      source: ImageSource.camera, imageQuality: 50
  );

  setState(() {
    image= image;
  });
}

_imgFromGallery() async {
  File image = await  ImagePicker.pickImage(
      source: ImageSource.gallery, imageQuality: 50
  );

  setState(() {
    image = image;
  });
}
}
