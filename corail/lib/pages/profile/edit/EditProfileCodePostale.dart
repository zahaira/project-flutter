import 'package:corail/common/variable.dart';
import 'package:corail/pages/profile/Profile.dart';
import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';

class EditProfileCodePostale extends StatefulWidget {
  const EditProfileCodePostale({super.key});

  @override
  State<EditProfileCodePostale> createState() => _EditProfileCodePostaleState();
}

class _EditProfileCodePostaleState extends State<EditProfileCodePostale> {
  final formKey = GlobalKey<FormState>();
  String? selectedCountry = "";
  String? selectedState = "";
  String? selectedCity = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate back to the previous page.
              Navigator.of(context).pop();
            },
            color: Colors.black, // Set the color to red
          ),
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0.1),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: const Text(
                  'Adresse postale',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 35),
                child: TextFormField(
                  initialValue: "rue farah",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Adresse est obligatoire";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.location_city),
                    // hintText: 'What do people call you?',
                    labelText: 'Adresse',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  // validator: (String? value) {
                  //   return (value != null && value.contains('@'))
                  //       ? 'Do not use the @ char.'
                  //       : null;
                  // },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 35),
                child: CSCPicker(
                  showStates: true,
                  showCities: true,
                  defaultCountry: CscCountry.Morocco,
                  layout: Layout.vertical,
                  countryDropdownLabel: "Pays",
                  stateDropdownLabel: "Région",
                  cityDropdownLabel: "Ville",

                  ///placeholders for dropdown search field
                  countrySearchPlaceholder: "Rechercher un pays",
                  stateSearchPlaceholder: "Rechercher une région",
                  citySearchPlaceholder: "Rechercher une ville",

                  onCountryChanged: (country) {
                    setState(() {
                      selectedCountry = country;
                    });
                  },
                  onStateChanged: (state) {
                    setState(() {
                      selectedState = state;
                    });
                  },
                  onCityChanged: (city) {
                    setState(() {
                      selectedCity = city;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: mainColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      )),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: const Text(
                                  "Etes vous sur vous voulez sauvgarder les modifications?"),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: mainColor,
                                    backgroundColor: Colors.white,
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    // Navigator.of(context).pop();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Profile()));
                                  },
                                  child: const Text("Sauvgarder"),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: mainColor,
                                    backgroundColor: Colors.white,
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Annuler"),
                                ),
                              ],
                            );
                          });
                    }
                  },
                  child: const Text('Sauvgarder'),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '*Mentions obligatoires.',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            ' CORAIL collecte et traite vos données conformément à la réglementation applicable en matière de protection des données personnelles. Pour en savoir plus, consultez ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' notre charte des données personnelles.',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
