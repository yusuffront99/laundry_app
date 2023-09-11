import 'package:d_button/d_button.dart';
import 'package:d_info/d_info.dart';
import 'package:d_input/d_input.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/config/app.constant.dart';
import 'package:laundry_app/config/app_assets.dart';
import 'package:laundry_app/config/app_colors.dart';
import 'package:laundry_app/config/app_response.dart';
import 'package:laundry_app/config/failure.dart';
import 'package:laundry_app/dataSources/user_dataSource.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final editUsername = TextEditingController();
  final editEmail = TextEditingController();
  final editPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  execute() {
    bool validInput = formKey.currentState!.validate();
    if (!validInput) return;

    UserDataSource.register(
      editUsername.text,
      editEmail.text,
      editPassword.text,
    ).then((value) {
      String newStatus = '';
      value.fold(
        (failure) {
          switch (failure.runtimeType) {
            case ServerFailure:
              newStatus = 'Server Error';
              DInfo.toastError(newStatus);
              break;
            case NotFoundFailure:
              newStatus = 'Error Not Found';
              DInfo.toastError(newStatus);
              break;
            case ForbiddenFailure:
              newStatus = 'You don\'t have access';
              DInfo.toastError(newStatus);
              break;
            case BadRequestFailure:
              newStatus = 'Bad request';
              DInfo.toastError(newStatus);
              break;
            case InvalidInputFailure:
              newStatus = 'Invalid Input';
              AppResponse.invalidInput(context, failure.message ?? '{}');
              break;
            case UnauthorisedFailure:
              newStatus = 'Unauthorised';
              DInfo.toastError(newStatus);
              break;
            default:
              newStatus = 'Request Error';
              DInfo.toastError(newStatus);
              newStatus = failure.message ?? '-';
              break;
          }
          // setRegisterStatus(ref, newStatus);
        },
        (result) {
          DInfo.toastSuccess('Register Success');
          // setRegisterStatus(ref, 'Success');
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.bgAuth,
            fit: BoxFit.cover,
          ),

          // === GRADIENT
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black54,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
            child: Column(
              // == space title and form input register
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ===========LAYER 3
                // === TITTLE
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Text(
                        AppConstants.appName,
                        style: GoogleFonts.poppins(
                          fontSize: 40,
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      //  ===== DASH LINE
                      Container(
                        height: 5,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      //  ===== DASH LINE
                    ],
                  ),
                ),
                // ===========LAYER 3

                // ---- FORM REGISTER
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      // == INPUT USERNAME
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            //  == type input please install d_input
                            //  == ICONS
                            AspectRatio(
                              aspectRatio: 1,
                              child: Material(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            //  == ICONS
                            DView.spaceWidth(10),
                            Expanded(
                              child: DInput(
                                controller: editUsername,
                                fillColor: Colors.white70,
                                hint: 'Username',
                                radius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                      DView.spaceHeight(16),
                      // == INPUT USERNAME

                      // == INPUT EMAIL
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            //  == type input please install d_input
                            //  == ICONS
                            AspectRatio(
                              aspectRatio: 1,
                              child: Material(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                child: const Icon(
                                  Icons.email,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            //  == ICONS
                            DView.spaceWidth(10),
                            Expanded(
                              child: DInput(
                                controller: editEmail,
                                fillColor: Colors.white70,
                                hint: 'Email',
                                radius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                      DView.spaceHeight(16),
                      // == INPUT EMAIL

                      // == INPUT PASSWORD
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            //  == type input please install d_input
                            //  == ICONS
                            AspectRatio(
                              aspectRatio: 1,
                              child: Material(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                child: const Icon(
                                  Icons.key,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            //  == ICONS
                            DView.spaceWidth(10),
                            Expanded(
                              child: DInputPassword(
                                controller: editPassword,
                                fillColor: Colors.white70,
                                hint: 'Password',
                                radius: BorderRadius.circular(10),
                                validator: (input) =>
                                    input == '' ? "Don't empty" : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                      DView.spaceHeight(16),
                      // == INPUT PASSWORD

                      //**************************************************/

                      // ==== BUTTON REGISTER
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            //  == type input please install d_button
                            //  == ICONS
                            AspectRatio(
                              aspectRatio: 1,
                              child: DButtonFlat(
                                onClick: () {
                                  // Navigator.pop(context);
                                },
                                padding: const EdgeInsets.all(0),
                                radius: 10,
                                mainColor: Colors.white70,
                                child: const Text(
                                  'LOG',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            DView.spaceWidth(10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () => execute(),
                                style: const ButtonStyle(
                                  alignment: Alignment.centerLeft,
                                ),
                                child: const Text('Register'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      DView.spaceHeight(16),
                      // ==== BUTTON REGISTER
                    ],
                  ),
                ),
                // ---- FORM REGISTER
              ],
            ),
          ),
        ],
      ),
    );
  }
}
