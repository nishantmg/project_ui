import 'package:geolocator/geolocator.dart';


Position _currentPosition;
String _currentAddress;

// final Geolocator geolocator = Geolocator().forceAndroidLocationManager;

class LocationService{

  getCurrentLocation() {
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
          _currentPosition = position;
          // setState(() {
      //   _currentPosition = position;
      // });
      // _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
    return _currentPosition;
  }
}