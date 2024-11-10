import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vrindavantiffin/src/core/logger/logger.dart';
import 'package:vrindavantiffin/src/core/models/address_model.dart';
import 'package:vrindavantiffin/src/core/service/api_service/api_response.dart';
import 'package:vrindavantiffin/src/screen/user/delivery/repository/delivery_repository.dart';

final _logger = Logger("Address Service");

class AddressService extends DeliveryAddressRepository {
  @override
  Future<Address> addAddress({required Address address}) async {
    String endPoint = "/user/addAddress";
    final ApiResponse response =
        await dioClient.post(endPoint, data: address.toJson());

    if (response.isSuccess) {
      return Address.fromJson(response.data);
    }
    throw new Exception(response.errorMessage);
  }

  @override
  Future<Address?> getUserLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      Address address = Address();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _logger.log('Location permission denied');
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        _logger.log('Location permissions are permanently denied.');
        return null;
      }
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
      );
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark place = placemarks[0];
      _logger.log(place.toString());
      address = Address(
          postalCode: place.postalCode,
          state: place.administrativeArea,
          city: place.locality,
          country: place.country,
          street: "${place.street} ${place.subLocality?.replaceAll(",", " ")}");
      return address;
    } catch (e) {
      _logger.log('Failed to get address: $e');
      throw Exception(e);
    }
  }
}
