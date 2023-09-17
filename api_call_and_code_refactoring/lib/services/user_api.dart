import 'dart:convert';

import 'package:api_call_and_code_refortoring/model/user.dart';
import 'package:api_call_and_code_refortoring/model/user_dob.dart';
import 'package:api_call_and_code_refortoring/model/user_id.dart';
import 'package:api_call_and_code_refortoring/model/user_location.dart';
import 'package:api_call_and_code_refortoring/model/user_name.dart';
import 'package:api_call_and_code_refortoring/model/user_picture.dart';
import 'package:api_call_and_code_refortoring/model/user_registered.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserApi{
  static Future<List<User>> fetchUser() async {
    print("Fetch Users Called!!");
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['results'] as List<dynamic>;
    
    final users = result.map((e) {

      final name = UserName(
        title: e['name']['title'], 
        first: e['name']['first'], 
        last: e['name']['last']
      );

      final dob = UserDOB(
        date: e['dob']['date'], 
        age: e['dob']['age']
      );

      final id = UserId(
        name: e['id']['name'], 
        value: e['id']['value']
      );

      final picture = UserPicture(
        large: e['picture']['large'], 
        medium: e['picture']['medium'], 
        thumbnail: e['picture']['thumbnail']
      );

      final register = UserRegistered(
        date: e['registered']['date'], 
        age: e['registered']['age']
      );

      final street = Street(
        number: e['location']['street']['number'], 
        name: e['location']['street']['name']
      );

      final coordinate = Coordinate(
        latitude: e['location']['coordinates']['latitude'], 
        longitude: e['location']['coordinates']['longitude']
      );

      final timezone = Timezone(
        offset: e['location']['timezone']['offset'], 
        description: e['location']['timezone']['description']
      );

      final location = UserLocation(
        street: street, 
        coordinate: coordinate, 
        timezone: timezone
      );

      return User(
        gender:  e['gender'], 
        email: e['email'], 
        phone: e['phone'], 
        cell: e['cell'], 
        nat: e['nat'],
        name: name,
        dob: dob,
        id: id,
        picture: picture,
        register: register,
        location: location
      );
    }).toList();

    print("Fetch Users Completed!!");
    return users;
    
  }
}