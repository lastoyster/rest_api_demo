import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/city-resposne-mode.dart';
import '../model/country-response-model.dart';
import '../model/registration-request-model.dart';



class APIService {
  static const String baseUrl = "https://aladin.r-y-x.net/api/v1/settings";

  // Fetch list of countries
  static Future<List<Country>> fetchCountries() async {
    final Uri url = Uri.parse("$baseUrl/country/all-list");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final CountryResponseModel countryResponse = 
            CountryResponseModel.fromJson(jsonDecode(response.body));

        return countryResponse.data?.countries ?? [];
      } else {
        throw Exception('Failed to load countries: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }

  // Fetch list of cities by country ID
  static Future<List<City>> fetchCityByCountry(int countryId) async {
    final Uri url = Uri.parse("$baseUrl/city/by-country?countryId=$countryId");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final CityResponseModel cityResponse =
            CityResponseModel.fromJson(jsonDecode(response.body));

        return cityResponse.data?.cities ?? [];
      } else {
        throw Exception('Failed to load cities: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error fetching cities: $e');
    }
  }

  // Register a new user
  static Future<bool> registerUser(RegistrationRequestModel userData) async {
    final Uri url = Uri.parse("https://aladin.r-y-x.net/api/v1/auth/registration");

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userData.toJson()),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to register user: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error registering user: $e');
    }
  }
}
