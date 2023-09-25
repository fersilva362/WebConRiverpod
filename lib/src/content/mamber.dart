import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MemeberCoworker extends StatelessWidget {
  const MemeberCoworker({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: 0.8 * height,
      margin: EdgeInsets.only(top: 50),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              height: height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: const AssetImage(
                      'assets/coworkBackgroundMember.png',
                    ),
                    fit: BoxFit.fitHeight,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.7), BlendMode.dstATop)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: maxWidth > 700 ? 600 : 475,
              height: 500,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const ColumnForm(),
            ),
          )
        ],
      ),
    );
  }
}

class ColumnForm extends StatelessWidget {
  const ColumnForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              'Member homepage',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              ' Sign in to Workville',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            ' Enter your email and password',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            ' Email',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              hintText: 'Enter your email',
              labelText: null,
              suffixIcon: const Icon(Icons.email_outlined),
              suffixIconColor:
                  MaterialStateColor.resolveWith((Set<MaterialState> states) {
                if (states.contains(MaterialState.focused)) {
                  return Colors.grey;
                }

                return Colors.grey;
              }),
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
            height: 20,
          ),
          const Text(
            ' Password',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              hintText: 'Enter your password',
              labelText: null,
              suffixIcon: const Icon(Icons.lock_outlined),
              suffixIconColor:
                  MaterialStateColor.resolveWith((Set<MaterialState> states) {
                if (states.contains(MaterialState.focused)) {
                  return Colors.grey;
                }

                return Colors.grey;
              }),
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
            height: 20,
          ),
          Row(
            children: [
              Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                value: isChecked,
                onChanged: (value) {},
              ),
              const Text(
                ' Keep me logged in',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                    backgroundColor: const Color.fromRGBO(228, 228, 236, 1),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      color: Color.fromRGBO(17, 17, 17, 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.email,
                    color: Color.fromRGBO(40, 40, 40, 0.6),
                    size: 20,
                  ),
                  Text(
                    ' Log in using email link',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                text: 'New ser?. ',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                children: <TextSpan>[
                  TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      text: 'Create an account',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
