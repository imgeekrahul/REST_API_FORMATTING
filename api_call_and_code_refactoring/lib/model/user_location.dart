class UserLocation {
  final Street street;
  final Coordinate coordinate;
  final Timezone timezone;

  UserLocation({
    required this.street,
    required this.coordinate,
    required this.timezone
  });
  
}

class Street {
  final int number;
  final String name;

  Street({
    required this.number,
    required this.name
  }); 
}

class Coordinate {
  final String latitude;
  final String longitude;

  Coordinate({
    required this.latitude,
    required this.longitude
  });
}

class Timezone {
  final String offset;
  final String description;

  Timezone({
    required this.offset,
    required this.description
  });
}
