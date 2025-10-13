import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm_flutter/injection.dart';
import 'package:fsm_flutter/presentation/pages/calendar/calendar_view.dart';
import 'package:fsm_flutter/presentation/pages/login/login_page.dart';
import 'package:fsm_flutter/presentation/pages/parts_management/parts_management_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants.dart';
import '../../core/resources/image_resources.dart';
import '../../core/themes/app_theme.dart';
import '../profile/cubit/profile_screen_cubit.dart';
import '../profile/profile_screen.dart';

class FSMDashboardDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const FSMDashboardDrawer({
    super.key,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.watch<ProfileCubit>();
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 25),
          Stack(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(AppImages.userProfilePicture),
                radius: 50,
              ),
              // Positioned(
              //   top: -15,
              //   right: -15,
              //   child: IconButton(
              //     onPressed: () {},
              //     icon: Icon(Icons.edit),
              //   ),
              // ),
            ],
          ),
          Text(
            "${profileCubit.user.firstName} ${profileCubit.user.lastName}",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: interFontFamily),
          ),
          Text(
            profileCubit.user.role ?? "",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text("My Profile"),
              onTap: () {
                scaffoldKey.currentState?.closeDrawer();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => UserProfileScreen(),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              onTap: () {
                scaffoldKey.currentState?.closeDrawer();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PartsManagementScreen()));
              },
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text("Parts Management"),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              onTap: () {
                scaffoldKey.currentState?.closeDrawer();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CalendarPage()));
              },
              trailing: Icon(Icons.arrow_forward_ios),
              title: Text("Calendar"),
            ),
          ),
          SizedBox(height: 10),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              onTap: () async {
                scaffoldKey.currentState?.closeDrawer();
                final SharedPreferences _prefs =
                    serviceLocator<SharedPreferences>();
                await _prefs.remove(AppConstants.accessToken);
                await _prefs.remove(AppConstants.refreshToken);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false);
              },
              tileColor: AppColors.errorColor,
              trailing: Icon(Icons.logout, color: AppColors.whiteColor),
              title: Text(
                "Logout",
                style: TextStyle(color: AppColors.whiteColor),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Version : 2.0.5",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
