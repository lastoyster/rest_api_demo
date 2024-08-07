import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_demo/controller/country_controller.dart';
import 'package:rest_api_demo/model/country_response_model.dart';
import 'package:rest_api_demo/model/registration_request_model.dart';
import 'package:rest_api_demo/service/api_service.dart';
import 'package:rest_api_demo/widget/dropdown_border_round.dart';

class CountryView extends StatelessWidget {
  const CountryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CountryController controller = Get.put(CountryController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Country"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Obx(() {
            if (controller.isCountryLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return CustomDropdown(
                items: controller.countryList,
                value: controller.selectedCountry.value,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedCountry.value = value;
                    controller.getCities();
                  }
                },
                keyName: 'countryName',
              );
            }
          }),
          Obx(() {
            if (controller.cityList.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Text("Choose Country Name"),
                ),
              );
            } else if (controller.isCityLoading.value) {
              return const Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return CustomDropdown(
                items: controller.cityList,
                value: controller.selectedCity.value,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedCity.value = value;
                  }
                },
                keyName: "cityName",
              );
            }
          }),
          ElevatedButton(
            onPressed: () {
              APIService.registerUser(
                RegistrationRequestModel(
                  fullName: 'Utsa',
                  gender: "Male",
                  email: "utsa@gmai.com",
                  phoneNumber: "01866478941",
                  password: "password",
                  confirmPassword: "password",
                  deviceId: "12121",
                  firebaseToken: "sdfsdfsdsf",
                  countryId: controller.selectedCountry.value.id,
                  cityId: controller.selectedCity.value.id,
                  postCode: "1630",
                  streetAddressOne: "sdfas",
                  streetAddressTwo: "strisdfsdfng",
                  invitationCode: "sdfsd",
                  image: "dsfsd.com",
                ),
              );
            },
            child: const Text("Register Now"),
          ),
        ],
      ),
    );
  }
}
