import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_your_way/classes/users.dart';
import 'package:travel_your_way/classes/country.dart';

class FetchData{
  var users;
  String message;
  dynamic companyData;
  dynamic followedCompanies;

  Future <List<Users>> getAllUsers() async{

    try{

      var response=await http.get("http://10.0.2.2:8000/api/getAgent");

      if(response.statusCode==200) {
        // print(response.body);
        print("data is fetch successfully from server with response of : "+response.statusCode.toString());
        // print(response.body);
        // var convertDataToJson=(response.body);

        // users=convertDataToJson("data");
        return usersFromJson(response.body);



      }

      else{
        print("error no data      "+response.statusCode.toString());
      }
    } catch(e){
      print("we have the following  error while getting data from server ");
      print(e);

    }
  }
  // Future likeCompany(String uId,String cId) async{
  //   final String url="http://www.bestofferkktc.com/api/v1/likeCompany";
  //  var response= await http.post(url,body:
  //   { "Uid": uId,
  //     "Cid": cId
  //   }
  //   );
  //   var body=jsonDecode(response.body);
  //  message=body["message"];
  //
  // }
/*  Future getFollowCompany()  async{
    final String url="http://www.bestofferkktc.com/api/v1/getLikes";
    var response= await http.get(url);
    if(response.statusCode==200){
      var convertDataToJson=jsonDecode(response.body);
      followedCompanies=convertDataToJson["likes"];
    }
  }*/
}