import '../model/country-response-model.dart'; // Adjusted import to follow naming conventions // Adjusted import to follow naming conventions.
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T value;
  final ValueChanged<T?> onChanged; // Changed to ValueChanged<T?>
  final String keyName;

  const CustomDropdown({
    Key? key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.keyName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButton<T>(
        underline: const SizedBox.shrink(),
        isExpanded: true,
        value: value,
        iconSize: 24, // Changed to a more typical icon size
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<T>>((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(
              keyName == "countryName"
                  ? (item as CountryResponseModel).countryName
                  : (item as CityResponseModel).cityName, // Adjusted to the specific type
            ),
          );
        }).toList(),
      ),
    );
  }
}

// Assuming you have these classes in country_response_model.dart
class CountryResponseModel {
  final String countryName;

  CountryResponseModel({required this.countryName});
}

class CityResponseModel {
  final String cityName;

  CityResponseModel({required this.cityName});
}
