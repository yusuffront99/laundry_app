import 'package:d_info/d_info.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/config/app_assets.dart';
import 'package:laundry_app/config/app_colors.dart';
import 'package:laundry_app/config/app_session.dart';
import 'package:laundry_app/config/nav.dart';
import 'package:laundry_app/models/user_model.dart';
import 'package:laundry_app/pages/auth/login_page.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  logout(context) {
    DInfo.dialogConfirmation(
      context,
      'Logout',
      'You sure want to logout?',
      textNo: 'cancel',
    ).then((yes) {
      if (yes ?? false) {
        AppSession.removeUser();
        AppSession.removeBearerToken();
        Nav.replace(context, const LoginPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AppSession.getUser(),
      builder: (context, snapshot) {
        if (snapshot.data == null) return DView.loadingCircle();
        UserModel user = snapshot.data!;
        return ListView(
          padding: const EdgeInsets.all(0),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
              child: Text(
                'Account',
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 70,
                    child: AspectRatio(
                      aspectRatio: 3 / 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          AppAssets.profile,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // == BETWEEN SPACE TWO COMPONENTS
                  DView.spaceWidth(),
                  // == BETWEEN SPACE TWO COMPONENTS
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ========== USERNAME
                        const Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        DView.spaceHeight(4),
                        Text(
                          user.username,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16,
                          ),
                        ),
                        // ===
                        DView.spaceHeight(),
                        const Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        DView.spaceHeight(4),
                        Text(
                          user.email,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                  // ========== EMAIL
                ],
              ),
            ),
            DView.spaceHeight(10),
            // === CHANGE PROFILE
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              onTap: () {},
              dense: true,
              horizontalTitleGap: 0,
              leading: const Icon(Icons.image),
              title: const Text('Change Profile'),
              trailing: const Icon(Icons.navigate_next),
            ),
            // === CHANGE PROFILE

            // === CHANGE Edit Account
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              onTap: () {},
              dense: true,
              horizontalTitleGap: 0,
              leading: const Icon(Icons.image),
              title: const Text('Edit Account'),
              trailing: const Icon(Icons.navigate_next),
            ),
            // === CHANGE Edit Account

            // === LOGOUT BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: OutlinedButton(
                onPressed: () => logout(context),
                child: const Text('Logout'),
              ),
            ),
            // === LOGOUT BUTTON

            // === SETTING
            DView.spaceHeight(30),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Text(
                'Setting',
                style: TextStyle(
                  height: 1,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),

            // === LIST MENU TILES
            //==>>> DARK MODE
            ListTile(
              onTap: () {},
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              dense: true,
              leading: const Icon(Icons.dark_mode),
              horizontalTitleGap: 0,
              trailing: Switch(
                activeColor: AppColors.primary,
                value: false,
                onChanged: (value) {},
              ),
              title: const Text('Dark Mode'),
            ),

            //==>>> LANGUAGE
            ListTile(
              onTap: () {},
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              dense: true,
              leading: const Icon(Icons.translate),
              horizontalTitleGap: 0,
              title: const Text('Language'),
              trailing: const Icon(Icons.navigate_next),
            ),

            //==>>> NOTIFICATION
            ListTile(
              onTap: () {},
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              dense: true,
              leading: const Icon(Icons.notifications),
              horizontalTitleGap: 0,
              title: const Text('Notification'),
              trailing: const Icon(Icons.navigate_next),
            ),

            //==>>> FEEDBACK
            ListTile(
              onTap: () {},
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              dense: true,
              leading: const Icon(Icons.feedback),
              horizontalTitleGap: 0,
              title: const Text('Feedback'),
              trailing: const Icon(Icons.navigate_next),
            ),

            //==>>> SUPPORT
            ListTile(
              onTap: () {},
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              dense: true,
              leading: const Icon(Icons.support_agent),
              horizontalTitleGap: 0,
              title: const Text('Support'),
              trailing: const Icon(Icons.navigate_next),
            ),

            //==>>> ABOUT
            ListTile(
              onTap: () {
                showAboutDialog(
                    context: context,
                    applicationIcon: const Icon(
                      Icons.local_laundry_service,
                      size: 50,
                      color: AppColors.primary,
                    ),
                    applicationName: 'My Laundry',
                    applicationVersion: 'v1.0.0',
                    children: [
                      const Text(
                        'My Laundry is Market App to monitor you laundry',
                      ),
                    ]);
              },
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              dense: true,
              leading: const Icon(Icons.info),
              horizontalTitleGap: 0,
              title: const Text('About'),
              trailing: const Icon(Icons.navigate_next),
            ),

            // === LIST MENU TILES
            // === SETTING
          ],
        );
      },
    );
  }
}
