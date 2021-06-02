
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

showPicker(BuildContext context, imageFromCemra(), imageFromGellary()){
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      imageFromCemra;
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                   imageFromGellary;
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      }
  );
}

// _imgFromCamera() async {
//   File image = await ImagePicker.pickImage(
//       source: ImageSource.camera, imageQuality: 50
//   );
//
//   setState(() {
//     _image = image;
//   });
// }
//
// _imgFromGallery() async {
//   File image = await  ImagePicker.pickImage(
//       source: ImageSource.gallery, imageQuality: 50
//   );
//
//   setState(() {
//     _image = image;
//   });
// }
