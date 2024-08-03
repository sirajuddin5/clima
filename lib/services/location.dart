import 'package:geolocator/geolocator.dart';

class Location{
  late double latitude ;
  late double longitude ;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await _determinePosition();
      latitude = position.latitude;
      longitude = position.longitude;
      print(position);
    } catch (e) {
      print(e);
    }
  }

  // void getCurrentLocation() async {
  //   try{
  //     Position position = await _determinePosition();
  //     latitude = position.latitude;
  //     longitude = position.longitude;
  //
  //     // Use latitude and longitude as needed...
  //     // print('Latitude: $latitude, Longitude: $longitude');
  //     print(position);
  //   }
  //   catch(e){
  //     print(e);
  //   }
  // }



}


