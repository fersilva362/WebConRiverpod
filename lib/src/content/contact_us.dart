import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:using_riverpod/src/Widget/responsive_widget.dart';
import 'package:using_riverpod/src/Widget/text_field.dart';

class ContactContent extends ResponsiveWidget {
  const ContactContent({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return const DeskContacUs();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return const MobileContactUs();
  }
}

class DeskContacUs extends StatelessWidget {
  const DeskContacUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 65),
      child: const Row(
        children: [
          ColumnFormField(),
          SizedBox(
            width: 20,
          ),
          LocationContactUs()
        ],
      ),
    );
  }
}

class MobileContactUs extends StatelessWidget {
  const MobileContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1300,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 65),
      child: const Column(
        children: [
          ColumnFormField(),
          SizedBox(
            height: 20,
          ),
          LocationContactUs()
        ],
      ),
    );
  }
}

class LocationContactUs extends StatelessWidget {
  const LocationContactUs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Location',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 35),
          const Text(
            'Workville is situated in a modern doorman building near Grand Central, Port Authority, and Penn Station. Centrally located near most major transit and bus stations. There’s a variety of casual and fine dining options just steps from Bryant Park. For after-work events, you can visit our very own Elsie Rooftop Lounge.',
            maxLines: null,
            style: TextStyle(
              fontSize: 20,
              height: 1.2,
              color: Color.fromRGBO(68, 68, 68, 1),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/loaction.png'),
                  fit: BoxFit.fitWidth),
            ),
          )
        ],
      ),
    );
  }
}

class ColumnFormField extends StatelessWidget {
  const ColumnFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Contact Us',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 30,
          ),
          RichText(
            text: const TextSpan(
              text: ' Email',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              filled: true,
              fillColor: const Color.fromRGBO(245, 248, 250, 0.6),
              labelText: null,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: Color.fromRGBO(221, 221, 221, 1),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const TextFieldGeneric(
            title: 'First name',
            fillColor: Color.fromRGBO(245, 248, 250, 0.6),
            textColor: Colors.black,
          ),
          const TextFieldGeneric(
            title: 'Last name',
            fillColor: Color.fromRGBO(245, 248, 250, 0.6),
            textColor: Colors.black,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Message',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              filled: true,
              fillColor: const Color.fromRGBO(245, 248, 250, 0.6),
              labelText: null,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: Color.fromRGBO(221, 221, 221, 1),
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Phone number',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              filled: true,
              fillColor: const Color.fromRGBO(245, 248, 250, 0.6),
              labelText: null,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: Color.fromRGBO(221, 221, 221, 1),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          SizedBox(
            height: 40,
            width: 90,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(255, 122, 89, 1),
                ),
                onPressed: () {
                  context.goNamed('submitscreen');
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 12),
                )),
          )
        ],
      ),
    );
  }
}
