import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();
  Country country = Country(
    phoneCode: "90",
    countryCode: "TR",
    name: "Turkey",
    e164Sc: 0,
    geographic: true,
    level: 1,
    example: "5xx 555 55 55",
    displayName: "Turkey",
    displayNameNoCountryCode: "Turkey",
    e164Key: "",
  );
  @override
  Widget build(BuildContext context) {
    phoneController.selection=TextSelection.fromPosition(TextPosition(offset: phoneController.text.length));

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple.shade50,
                  ),
                  child: Image.asset(
                    "assets/image2.png",
                    height: 300,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Register Account",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Add your phone number.You'll get a verification code to register account",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onChanged:(value){
                    setState((){
                      phoneController.text = value;
                    });
                  },
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: "Phone Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.purple,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                    ),
                    prefixIcon: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            countryListTheme: CountryListThemeData(
                              bottomSheetHeight: 600,
                              flagSize: 25,
                              borderRadius: BorderRadius.circular(10),
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            showPhoneCode: true,
                            onSelect: (Country country) {
                              setState(() {
                                this.country = country;
                              });
                            },
                          );
                        },
                        child: Text(
                          "${country.flagEmoji} +${country.phoneCode}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    suffixIcon: phoneController.text.length>9?Container(
                      height:30,
                      width: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: InkWell(
                        onTap: () {
                          phoneController.clear();
                        },
                        child: const Icon(
                          Icons.close,
                          size: 25,
                        ),
                      ),
                    ):null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
