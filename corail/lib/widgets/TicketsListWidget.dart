import 'package:corail/common/variable.dart';
import 'package:corail/pages/ticketDetails.dart';
import 'package:flutter/material.dart';

class TicketsListWidget extends StatefulWidget {
  const TicketsListWidget({required this.ticketsList, super.key});

  final List ticketsList;
  @override
  State<TicketsListWidget> createState() => _TicketsListWidgetState();
}

class _TicketsListWidgetState extends State<TicketsListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.ticketsList.length,
        itemBuilder: (context, i) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            margin: const EdgeInsets.only(bottom: 20),
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TicketDetails()));
              },
              leading: SizedBox(
                  width: 80,
                  child: Image.asset(
                      "$pathImages/${widget.ticketsList[i].logo}")),
              title: Text(
                "${widget.ticketsList[i].brand} Mall",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                "${widget.ticketsList[i].date}",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: secondColor),
              ),
              trailing: Text(
                "${widget.ticketsList[i].price}",
                style: TextStyle(
                  color: secondColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        });
  }
}
