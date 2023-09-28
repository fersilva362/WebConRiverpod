import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:using_riverpod/src/Widget/checkbox.dart';
import 'package:using_riverpod/src/Widget/responsive_widget.dart';
import 'package:using_riverpod/src/Widget/text_field.dart';

class Quote extends ResponsiveWidget {
  const Quote({super.key});

  @override
  Widget buildDesktop(BuildContext context) {
    return const Scaffold(body: SizedBox(child: DeskQuote()));
  }

  @override
  Widget buildMobile(BuildContext context) {
    final maXWidth = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          InkWell(
            onTap: () {
              context.goNamed('home');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logoBco.png',
                  height: 75,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 0.8 * height,
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
                              Colors.black.withOpacity(0.25),
                              BlendMode.dstATop)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: 1000,
                    //height: 1700,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Container(
                          width: maXWidth,
                          height: 200,
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: (maXWidth > 1250)
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.center,
                            children: const [
                              Text(
                                'Get a Quote',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 46,
                                    height: 1.18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Fill out the form and a member of our team will be in touch.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    height: 1.3),
                              )
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: ColumnFormField(
                            fillColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DeskQuote extends StatelessWidget {
  const DeskQuote({super.key, this.width});
  final double? width;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: InkWell(
            onTap: () {
              context.goNamed('home');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logoBco.png',
                  height: 75,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 0.8 * height,
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
                        fit: BoxFit.fitWidth,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.25), BlendMode.dstATop)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 200),
                  width: 1000,
                  //height: 1700,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: const EdgeInsets.only(right: 100),
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height: 400,
                          color: Colors.transparent,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Get a Quote',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 46,
                                    height: 1.18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Fill out the form and a member of our team will be in touch.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    height: 1.3),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 2,
                        child: ColumnFormField(
                          fillColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ColumnFormField extends StatelessWidget {
  const ColumnFormField({
    super.key,
    required this.fillColor,
  });
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      width: maxWidth < 500
          ? maxWidth
          : (maxWidth < 1250)
              ? 500
              : null,
      padding: const EdgeInsets.all(20),
      //height: 1300,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Register Now',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
              text: const TextSpan(
                text: ' Email',
                style: TextStyle(
                  color: Colors.white,
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
                fillColor: Colors.white,
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
              fillColor: Colors.white,
              textColor: Colors.white,
            ),
            const TextFieldGeneric(
              title: 'Last name',
              fillColor: Colors.white,
              textColor: Colors.white,
            ),
            const TextFieldGeneric(
              title: 'Company name',
              fillColor: Colors.white,
              textColor: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Phone number',
              style: TextStyle(
                color: Colors.white,
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
                fillColor: Colors.white,
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
              height: 10,
            ),
            const CheckBoxGeneric(
              title: 'Co-Working',
              isChecked: false,
            ),
            const CheckBoxGeneric(title: 'Private Office', isChecked: false),
            const CheckBoxGeneric(title: 'Meeting Room', isChecked: false),
            const CheckBoxGeneric(title: 'OASIS', isChecked: false),
            const SizedBox(
              height: 35,
            ),
            Center(
              child: SizedBox(
                height: 65,
                width: (maxWidth > 650) ? 120 : maxWidth,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(40, 207, 194, 1),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
