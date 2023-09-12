import 'package:corail/common/variable.dart';
import 'package:corail/pages/ScanQr.dart';
import 'package:corail/widgets/TicketsListWidget.dart';
import 'package:corail/widgets/bottom_appbar.dart';
import 'package:corail/widgets/drawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class Tickets extends StatefulWidget {
  const Tickets({super.key});

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  @override
  Widget build(BuildContext context) {
    ///code to search a ticket by brand
    List searchList = tickets
        .where((element) =>
            element.brand.toLowerCase().contains(text.toLowerCase()) ||
            element.category.toLowerCase().contains(text.toLowerCase()))
        .toList();
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Mes Tickets'),
        backgroundColor: mainColor,
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size(3, 130),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(7),
                child: TypeAheadField(
                  noItemsFoundBuilder: (context) => const SizedBox(
                    height: 50,
                    child: Center(
                      child: Text('Aucun Marque n\a été trouvé'),
                    ),
                  ),
                  suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                      color: Colors.white,
                      elevation: 4.0,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                  textFieldConfiguration: TextFieldConfiguration(
                      decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                            15.0,
                          )),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              borderSide: BorderSide(color: Colors.grey)),
                          hintText: "Rechercher une marque",
                          contentPadding:
                              const EdgeInsets.only(top: 4, left: 10),
                          hintStyle:
                              const TextStyle(color: Colors.grey, fontSize: 14),
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon:
                                  const Icon(Icons.search, color: Colors.grey)),
                          fillColor: Colors.white,
                          filled: true)),
                  debounceDuration: const Duration(milliseconds: 400),
                  suggestionsCallback: (value) {
                    List<String> matches = [];
                    matches.addAll(brandList);
                    matches.retainWhere(
                        (s) => s.toLowerCase().contains(value.toLowerCase()));
                    return matches;
                  },
                  itemBuilder: (context, String suggestion) {
                    return Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.refresh,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              suggestion,
                              maxLines: 1,
                              // style: TextStyle(color: Colors.red),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  onSuggestionSelected: (String suggestion) {
                    setState(() {
                      text = suggestion;
                    });
                  },
                ),
              ),
              Container(
                height: 50,
                color: Colors.white.withOpacity(0.7),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      _allTickets(""),
                      const SizedBox(
                        width: 10,
                      ),
                      _singleTicket("Vêtements"),
                      const SizedBox(
                        width: 10,
                      ),
                      _singleTicket("Beauté"),
                      const SizedBox(
                        width: 10,
                      ),
                      _singleTicket("Alimentation"),
                      const SizedBox(
                        width: 10,
                      ),
                      _singleTicket("Mobilier et ameublement"),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 30,
                width: double.infinity,
                color: Colors.white.withOpacity(0.96),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 3),
                  child: Text(
                    "Recherche pour: $text",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: TicketsListWidget(ticketsList: searchList),
    );
  }

  Widget _allTickets(String searchText) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 2,
        backgroundColor: mainColor,
      ),
      onPressed: () {
        setState(() {
          text = searchText;
        });
      },
      child: const Text(
        "Tous",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _singleTicket(String searchText) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: mainColor,
      ),
      onPressed: () {
        setState(() {
          text = searchText;
        });
      },
      child: Text(
        searchText,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
