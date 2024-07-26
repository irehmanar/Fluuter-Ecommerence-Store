import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertesting/GlobalUI/GlobalAppColours.dart';
import 'package:fluttertesting/CustomWidgets/CustomTextField.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tappbiz/Business/UserBussinessDetailSubPages.dart/TextFieldWidget.dart';
// import 'package:tappbiz/FirebaseAnalytics.dart';
// import 'package:tappbiz/GlobalUi/AppFontSizes.dart';
// import 'package:tappbiz/GlobalUi/GlobalAppColours.dart';
// import 'package:tappbiz/Keys/FlutterStorageKeys.dart';
// import 'package:tappbiz/Network_Manager/Models/GetMyConnectionsModel.dart';
// import 'package:tappbiz/Network_Manager/Models/User_Model.dart';
// import 'package:tappbiz/Network_Manager/NetworkManager.dart';
// import 'package:tappbiz/Utils.dart';
// import 'package:tappbiz/localization/app_localizations.dart';
// import 'package:tappbiz/pages/EditProfile.dart';
// import 'package:tappbiz/pages/GetUserSingleton.dart';
// import 'package:tappbiz/pages/ImagePreview.dart';
// import 'package:tappbiz/pre_login/SignUp.dart';
// import 'package:tappbiz/pre_login/SingletonClass.dart';
// import 'package:tappbiz/providers/lang_provider.dart';
// import 'package:tappbiz/screens/Home.dart';
// import 'package:tappbiz/widgets/VCardGenerator.dart';

class ProfilePage extends StatefulWidget {
  // final int currentIndex;

  const ProfilePage({
    Key? key,
    // required this.currentIndex,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Profile? userProfile;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  // late AppLanguageProvider appLanguage;
  String? fullNameError;
  String? emailError;
  String? passwordError;
  bool isFullNameValid = true;
  late String userImage;
  late String previewImage;
  // List<Connection> connections = [];
  var userLoggedIn;
  var token;
  Map<dynamic, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    // Analytics.trackScreenView('ProfilePage');
    previewImage = '';
    userImage = "";
    // checkUserAvailable();
    setState(() {
      fullNameController.text = "Abdul Rehman";
      emailAddressController.text ="abrehman4163@gmail.com";
      contactController.text = "03024917963";
      userImage = "";
      previewImage = '';
    });
    // if (UserProfileSingleton().userProfile != null) {
    //   print('have data');
    //   setState(() {
    //     fullNameController.text = UserProfileSingleton().userProfile!.user.fullName!;
    //     emailAddressController.text = UserProfileSingleton().userProfile!.user.email == null
    //         ? 'N/A'
    //         : UserProfileSingleton().userProfile!.user.email!;
    //     contactController.text = UserProfileSingleton().userProfile!.user.contact == null
    //         ? 'N/A'
    //         : Utils().formatPhoneNumber(UserProfileSingleton().userProfile!.user.contact.toString());
    //     userImage = UserProfileSingleton().userProfile!.user.profileMedia != null
    //         ? UserProfileSingleton().userProfile!.user.profileMedia!.url +
    //         UserProfileSingleton().userProfile!.user.profileMedia!.thumbnail
    //         : '';
    //     previewImage = UserProfileSingleton().userProfile!.user.profileMedia != null
    //         ? UserProfileSingleton().userProfile!.user.profileMedia!.url +
    //         UserProfileSingleton().userProfile!.user.profileMedia!.path
    //         : '';
    //   });
    // }
    // else {
    //   print('fetch api');
    //   getUserInfo();
    // }
  }

  // checkUserAvailable() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   userLoggedIn = prefs.getString(FlutterStorageKeys.userphone);
  //   token = prefs.getString(FlutterStorageKeys.Token);
  // }

  // Future<void> getUserInfo() async {
  //   try {
  //     final response = await NetworkManager().getUserProfile(context);
  //
  //     if (response.statusCode == 200) {
  //       var jsonData = json.decode(response.body);
  //       setState(() {
  //         userProfile = Profile.fromJson(jsonData);
  //         fullNameController.text = userProfile!.user.fullName!;
  //         emailAddressController.text = userProfile!.user.email!;
  //         contactController.text = Utils().formatPhoneNumber(userProfile!.user.contact.toString());
  //       });
  //       var users = response.body;
  //       debugPrint('User infos: $users');
  //     } else {
  //       debugPrint('Failed to get user info. Status code: ${response.statusCode}');
  //       debugPrint('Response body: ${response.body}');
  //     }
  //   } catch (error) {
  //     if (!mounted) return;
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('${AppLocalizations.of(context)!.translate('err_getting_user_info')!}'),
  //         backgroundColor: AppColours.snackbarfailedcolour,
  //       ),
  //     );
  //     debugPrint('Error getting user info: $error');
  //   }
  // }
  //
  // void navigateToImagePreview(String imageUrl) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => ImagePreviewPage(imageUrl: imageUrl),
  //     ),
  //   );
  // }
  //
  // Future<void> logout() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.remove(FlutterStorageKeys.userphone);
  //   FlutterSecureStorage().delete(key: FlutterStorageKeys.Token);
  //   UserProfileSingleton().clearUserProfile();
  //   UserProfileSingleton().userProfile?.myBusinesses = [];
  //   TokenManager.getInstance().discoverUsers = [];
  //   TokenManager.getInstance().productListing = [];
  //   TokenManager.getInstance().userScanLinks = [];
  //   TokenManager.getInstance().connections = [];
  //   print('tapped');
  //   if (!mounted) return;
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(builder: (context) => const PhoneloginPage()),
  //   );
  // }
  //
  // Future<void> _handleDownload(BuildContext context, String vCardContent,
  //     String name) async {
  //   await VCardGenerator.downloadVCard(
  //     vCardContent: vCardContent,
  //     name: vCardContent,
  //     context: context,
  //   );
  // }






  Future<void> test() async {
    print('tap');
  }

  @override
  Widget build(BuildContext context) {
    // appLanguage = Provider.of<AppLanguageProvider>(context);
    return Scaffold(
      backgroundColor: AppColours.backGroundColour,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 16.0), // Adjust the value as needed
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColours.iconThemeColour,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/');
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => HomePage(
              //       currentIndex: widget.currentIndex,
              //     ),
              //   ),
              // );
            },
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColours.backGroundColour,
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0), // Adjust the value as needed
          child: Text(
            "User Profile",
            style: const TextStyle(
              color: AppColours.UserBussinessDetailTextColour,
            ),
          ),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(top: 16.0), // Adjust the value as needed
        //     child: Padding(
        //       padding: const EdgeInsets.only(right: 8.0),
        //       child: IconButton(
        //         icon: Icon(
        //           Icons.share,
        //           color: Colors.white,
        //           size: 30,
        //         ),
        //         onPressed: () async {
        //           String vCardContent = VCardGenerator.generateVCard(
        //             name: fullNameController.text,
        //             organization: emailAddressController.text,
        //             workPhone: contactController.text,
        //           );
        //           await _handleDownload(context, vCardContent,fullNameController.text);
        //           await VCardGenerator.shareVCard(vCardContent: vCardContent, context: context);
        //         },
        //       ),
        //     ),
        //   ),
        // ],
      ),

      body: PopScope(
        canPop: false,
        // onPopInvoked: ((didPop) {
        //   Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => HomePage(
        //         currentIndex: widget.currentIndex,
        //       ),
        //     ),
        //   );
        // }),
        child: RefreshIndicator(
          color: AppColours.buttonColor,
          onRefresh: () => test(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 40),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.48,
                            height: MediaQuery.sizeOf(context).height * 0.24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColours.buttonColor),
                            ),
                            child: userImage.isNotEmpty
                                ? GestureDetector(
                              // onTap: () {
                              //   print('tapped');
                              //   navigateToImagePreview(
                              //     previewImage,
                              //   );
                              // },
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(userImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                                : Icon(
                              color: Colors.white,
                              Icons.person,
                              size: 90,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              print('Tap');
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => EditProfile(
                              //       currentIndex: widget.currentIndex,
                              //     ),
                              //   ),
                              // );
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.1,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Full Name",
                      style: TextStyle(
                        color: AppColours.UserBussinessDetailTextColour,
                        // fontSize: AppWidgetSizes.textFieldHeaderFontSize,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  MainTextFieldWidget(
                    textInputAction: TextInputAction.done,
                    controller: fullNameController,
                    keyboardType: TextInputType.text,
                    isReadOnly: true,
                    showAsterisk: false,
                    placeHolder: 'Steven Lee',
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Email",
                      style: TextStyle(
                        color: AppColours.UserBussinessDetailTextColour,
                        // fontSize: AppWidgetSizes.textFieldHeaderFontSize,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  MainTextFieldWidget(
                    textInputAction: TextInputAction.done,
                    controller: emailAddressController,
                    keyboardType: TextInputType.text,
                    isReadOnly: true,
                    showAsterisk: false,
                    placeHolder: 'john@abc.com',
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Contact",
                      style: TextStyle(
                        color: AppColours.UserBussinessDetailTextColour,
                        // fontSize: AppWidgetSizes.textFieldHeaderFontSize,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  MainTextFieldWidget(
                    textInputAction: TextInputAction.done,
                    controller: contactController,
                    keyboardType: TextInputType.text,
                    isReadOnly: true,
                    showAsterisk: false,
                    placeHolder: '000000000',
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // print(FlutterSecureStorage().read(key: FlutterStorageKeys.loginpin));
                        // logout();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        backgroundColor: AppColours.deleteButtonColors,
                        foregroundColor: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        deleteUser();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        backgroundColor: AppColours.deleteButtonColors,
                        foregroundColor: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Delete User',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColours.dialogboxBagckgroundColor,
          title: Text(
            "Confirm Deletion",
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            "Are you sure you want to delete your profile? This action cannot be undone.",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                "Delete",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                deleteUser();
              },
            ),
          ],
        );
      },
    );
  }


  Future<void> deleteUser() async {
    String? userInput = '';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return AlertDialog(
              backgroundColor: AppColours.backGroundColour,
              title: Text(
                'Type "Delete" to confirm',
                style: TextStyle(color: AppColours.textColour),
              ),
              content: TextField(
                onChanged: (value) {
                  setState(() {
                    userInput = value;
                    // print(userInput);
                  });
                },
                style: TextStyle(color: AppColours.textColour),
                decoration: InputDecoration(
                  hintText: 'Type "Delete" to confirm',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                      color: userInput == 'Delete' ? Colors.white : Colors.white
                          .withOpacity(0.5),
                    ),
                  ),
                  onPressed: () async {
                    if (userInput == 'Delete') {
                      Navigator.of(context).pop();
                      // await performDelete();
                    } else {
                      // Handle invalid input (optional)
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }




  // Future<void> performDelete() async {
  //   try {
  //     final response = await NetworkManager().deleteUser(context);
  //
  //     if (response.statusCode == 200) {
  //       print('User deleted successfully');
  //       logout();
  //     } else {
  //       debugPrint('Failed to delete user: ${response.statusCode}');
  //       debugPrint('Response body: ${response.body}');
  //     }
  //   } catch (error) {
  //     debugPrint('Error deleting user: $error');
  //   }
  // }


  @override
  void dispose() {
    fullNameController.dispose();
    emailAddressController.dispose();
    contactController.dispose();
    super.dispose();
  }
}