// ignore_for_file: avoid_print

import 'dart:io';
import '../model/city-resposne-mode.dart';
import 'package:rest_api_demo/model/country-response-model.dart';
import 'package:rest_api_demo/model/registration-request-model.dart';
import 'package:rest_api_demo/service/api_service.dart';
import 'package:get/get.dart';


import '../service/api-service.dart';

class CountryController extends GetxController {
  var countryList = <Country>[].obs;
  var cityList = <City>[].obs;
  var isCountryLoading = false.obs;
  var isCityLoading = false.obs;

  var selectedCountry = Country(
    countryId: 0,
    countryName: '',
    flagImage: '',
    countryCode: '',
    status: Status.ACTIVE,
  ).obs;

  var selectedCity = (
    cityId: 0,
    cityName: '',
    status: '',
    country: Country(
      countryId: 0,
      countryName: '',
      countryCode: '',
      flagImage: '',
      status: Status.ACTIVE,
    ), 
  ).obs;

  @override
  void onInit() {
    getCountries();
    super.onInit();
  }

  void getCountries() async {
    isCountryLoading(true);
    try {
      countryList.value = await APIService.fetchCountries();
      if (countryList.isNotEmpty) {
        selectedCountry.value = countryList[0];
      }
      print("Successfully fetched countries");
    } on SocketException {
      print("No Internet connection");
    } catch (e) {
      print(e.toString());
    } finally {
      isCountryLoading(false);
    }
  }

  void getCities() async {
    isCityLoading(true);
    try {
      cityList.value = await APIService.fetchCityByCountry(selectedCountry.value.countryId);
      if (cityList.isNotEmpty) {
        selectedCity.value = cityList[0] as ({int cityId, String cityName, Country country, String status});
        print(cityList[0].cityName);
        print("Successfully fetched cities");
      }
    } on SocketException {
      print("No Internet connection");
    } catch (e) {
      print(e.toString());
    } finally {
      isCityLoading(false);
    }
  }
}
