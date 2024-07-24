import 'package:flutter/material.dart';
import 'package:fluttertesting/Widgets/BottomAppBar.dart';
import 'package:fluttertesting/GlobalUI/GlobalAppColours.dart';
import 'package:url_launcher/url_launcher.dart';
class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _selectedIndex = 3;

  bool isSwitched = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  mailUs() async {
    String email = Uri.encodeComponent("contact@shopee.com");
    String subject = Uri.encodeComponent("Hello Dear");
    String body = Uri.encodeComponent("Hi! How can we help you?");
    print(subject);
    Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
    if (await launchUrl(mail)) {
      print('email app opened');
    } else {
      print('email app is not opened');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.backGroundColour,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Align(
              //   alignment: Alignment.bottomRight,
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 20),
              //     child: IconButton(
              //       icon: const Icon(
              //         CupertinoIcons.power,
              //         color: Colors.white,
              //         size: 30,
              //       ),
              //       onPressed: () {
              //         logout();
              //       },
              //     ),
              //   ),
              // ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.03,
              ),
              GestureDetector(
                // onTap: () {
                //   Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) =>
                //           const ProfilePage(currentIndex: 4)));
                // },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColours.textFieldColour,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "My Profile",
                                  style: const TextStyle(
                                      color: AppColours.titleColour,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Personal Information",
                                  style: const TextStyle(
                                      color: AppColours.subTitleColour,
                                      // fontSize: AppWidgetSizes
                                      //     .morePageFieldsFontSize
                                        ),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: AppColours.buttonColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.person,
                                size: 30,
                                // color: AppColours.iconColor,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.03,
              ),



              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColours.textFieldColour,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Notifications",
                                  style: const TextStyle(
                                    color: AppColours.titleColour,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Stay updated by our Notifications",
                                    style: const TextStyle(
                                        color: AppColours.subTitleColour),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Switch(
                              trackOutlineColor:
                              MaterialStateColor.resolveWith((states) {
                                return isSwitched
                                    ? AppColours.buttonColor
                                    : AppColours.cardbordercolor;
                              }),
                              activeColor: Colors.white,
                              activeTrackColor: AppColours.buttonColor,
                              inactiveThumbColor: AppColours.placeHolderColor,
                              inactiveTrackColor: AppColours.backGroundColour,
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),




              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.03,
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColours.textFieldColour,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      print('tap');
                      // mailUs();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    // 'Email Us',
                                    "Contact us",
                                    style: const TextStyle(
                                      color: AppColours.titleColour,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'contact@shopee.com',
                                      style: TextStyle(
                                          // fontSize: AppWidgetSizes
                                          //     .morePageFieldsFontSize,
                                          color: AppColours.subTitleColour),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: AppColours.buttonColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.email_rounded,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                  child: Text(
                    'Shopee',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: AppColours.subTitleColour,
                    ),
                  )),
              const SizedBox(height: 20),
              Text(
                'Shopee App Version: 0.00.1',
                style: const TextStyle(
                    color: AppColours.subTitleColour,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingCartButton(),
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
