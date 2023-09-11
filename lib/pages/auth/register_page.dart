import 'package:d_input/d_input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/config/app.constant.dart';
import 'package:laundry_app/config/app_assets.dart';
import 'package:laundry_app/config/app_colors.dart';

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

          Column(
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
                    Row(
                      children: [
                        //  == type input please install d_input
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
                  ],
                ),
              ),
              // ---- FORM REGISTER
            ],
          ),
        ],
      ),
    );
  }
}
