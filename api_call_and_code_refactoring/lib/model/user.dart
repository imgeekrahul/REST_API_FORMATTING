import 'package:api_call_and_code_refortoring/model/user_dob.dart';
import 'package:api_call_and_code_refortoring/model/user_id.dart';
import 'package:api_call_and_code_refortoring/model/user_location.dart';
import 'package:api_call_and_code_refortoring/model/user_name.dart';
import 'package:api_call_and_code_refortoring/model/user_picture.dart';
import 'package:api_call_and_code_refortoring/model/user_registered.dart';

class User{
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  
  final UserName name;
  final UserDOB dob;
  final UserId id;
  final UserPicture picture;
  final UserRegistered register;
  final UserLocation location;
  
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,

    required this.name,
    required this.dob,
    required this.id,
    required this.picture,
    required this.register,
    required this.location
  });


  // making a getter
  String get fullName{
    return '${name.title} ${name.first} ${name.last}';
  }
}