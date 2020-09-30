import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  Position position;
  GeolocationStatus geolocationStatus;

  Future<List<Placemark>> getCurrentAddressPosition() async {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
    //country - país
    //postalCode - CEP
    //administrativeArea - Estado
    //locality - cidade
    //position - posicao em lat e long
    //thoroughfare - rodovia
    //subThoroughfare - subrodovia

    return placemark;
  }

  Future<Position> getLastKnownPosition() async {
    position = await Geolocator()
        .getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  Future<GeolocationStatus> checkPermissionStatus() async {
    geolocationStatus = await Geolocator().checkGeolocationPermissionStatus();
    return geolocationStatus;
  }
  Future<List<Placemark>> getPlacemarkFromAddress(String address) async{
    List<Placemark> placemark = await Geolocator().placemarkFromAddress(address);
    return placemark;
  }
  Future<List<Placemark>> getPlacemarkFromCoordinates(double latitude,double longitude) async{
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(latitude, longitude);
    return placemark;
  }
  Future<double> getDistanceBetween(double startLatitude,double startLongitude,double endLatitude,double endLongitude) async{
    double distanceInMeters = await Geolocator().distanceBetween(startLatitude, startLongitude, endLatitude, endLongitude);
    return distanceInMeters;
  }
}
