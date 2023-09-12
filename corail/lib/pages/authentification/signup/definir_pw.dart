import 'package:corail/common/variable.dart';
import 'package:corail/pages/authentification/signup/compte_cree.dart';
import 'package:flutter/material.dart';

class DefinirPw extends StatefulWidget {
  const DefinirPw({super.key});

  @override
  State<DefinirPw> createState() => _DefinirPwState();
}

class _DefinirPwState extends State<DefinirPw> {
  bool showpass = true;
  bool showconfpass = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool passwordsMatch = false;
  final formKey = GlobalKey<FormState>();

  void checkPasswordsMatch() {
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    setState(() {
      passwordsMatch = (password == confirmPassword);
    });
    if (formKey.currentState!.validate()) {
      if (passwordsMatch) {
        // Show the AlertDialog here
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                contentPadding: const EdgeInsets.all(10.0),
                titlePadding: const EdgeInsets.all(0.0),
                actions: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: mainColor,
                            backgroundColor: Colors.white,
                            elevation: 0),
                        onPressed: () {
                          Navigator.of(context).pop();
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  contentPadding: const EdgeInsets.all(10.0),
                                  titlePadding: const EdgeInsets.all(0.0),
                                  actions: [
                                    Divider(
                                        color: mainColor,
                                        thickness: 2,
                                        height: 0.1),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              foregroundColor: mainColor,
                                              backgroundColor: Colors.white,
                                              elevation: 0),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: ((context) =>
                                                        const CompteCree())));
                                          },
                                          child: const Text('Ok')),
                                    ),
                                  ],
                                  title: Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Text(
                                          "Felicitations !",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: mainColor),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 2,
                                        color: mainColor,
                                      ),
                                    ],
                                  ),
                                  content: const Text(
                                      textAlign: TextAlign.center,
                                      "Le scan de votre empreinte ou de votre visage ont bien été pris en compte. Si vous avez renseigne une empreintes enregistrees sur ce telephone pourront servir d’authentification lorsque celle-ci sera demandee.  "),
                                  contentTextStyle:
                                      const TextStyle(color: Colors.black),
                                  titleTextStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                          color: mainColor, width: 2)),
                                );
                              });
                        },
                        child: const Text('Genial, j’active !')),
                  ),
                  Divider(color: mainColor, thickness: 2, height: 0.1),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: mainColor,
                            backgroundColor: Colors.white,
                            elevation: 0),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const CompteCree())));
                        },
                        child: const Text('Non merci')),
                  ),
                ],
                title: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Biometrie  sur CORAIL",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: mainColor),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: mainColor,
                    ),
                  ],
                ),
                content: const Text(
                    textAlign: TextAlign.center,
                    "Plus besoin de saisir votre code confidentiel pour accéder a l’app facilement et en toute secrurite "),
                contentTextStyle: const TextStyle(color: Colors.black),
                titleTextStyle: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: mainColor, width: 2)),
              );
            });
      } else {
        // Display an error message
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Erreur'),
              content: const Text('Les mots de passe ne correspondent pas.'),
              actions: [
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  const Text(
                    'Choisissiez votre mot de passe',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: const Text(
                      'Saisissez votre mot de passe confidentiel afin de le confirmer ',
                      textAlign: TextAlign.center,
                      style: TextStyle(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    radius: 50,
                    child: Icon(
                      Icons.lock,
                      size: 70,
                      color: mainColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 35),
                    child: TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mot de passe est obligatoire';
                        }
                        return null;
                      },
                      obscureText: showpass,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showpass = !showpass;
                              });
                            },
                            icon: showpass == true
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off)),
                        icon: const Icon(Icons.password),
                        labelText: 'Mot de passe *',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 35),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirmer le Mot de passe est obligatoire';
                        }
                        return null;
                      },
                      controller: confirmPasswordController,
                      obscureText: showconfpass,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showconfpass = !showconfpass;
                              });
                            },
                            icon: showconfpass == true
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off)),
                        icon: const Icon(Icons.password),
                        labelText: 'Confirmer le mot de passe *',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: secondColor,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                      onPressed: () {
                        checkPasswordsMatch();
                      },
                      child: const Text('VALIDER'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
