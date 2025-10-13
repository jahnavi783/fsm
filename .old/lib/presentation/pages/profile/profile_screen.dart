import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm_flutter/presentation/core/components/gradient_appbar_widget.dart';

import 'cubit/profile_screen_cubit.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<ProfileCubit>().user;
    return Scaffold(
      appBar: GradientAppBar(
        title: const Text("User Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header Section
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[800], // Dark gray header
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: Text(
                          user.firstName[0].toUpperCase() +
                              user.lastName[0].toUpperCase(),
                          style: TextStyle(fontSize: 40, color: Colors.black),
                        ),
                        // backgroundImage: AssetImage('assets/images/profile_avatar.png'), // Uncomment if you have an image
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "${user.firstName} ${user.lastName}",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user.role ?? "",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                // Information Grid
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      _buildInfoRow("Email", user.email),
                      const SizedBox(height: 12),
                      _buildInfoRow("Phone", user.phone ?? "N/A"),
                      // const SizedBox(height: 12),
                      // _buildInfoRow("Department", "Maintenance"),
                      const SizedBox(height: 12),
                      _buildInfoRow("Birth Date",
                          DateTime.now().toLocal().toString().split(' ')[0]),
                    ],
                  ),
                ),
                // Edit Button
                // Padding(
                //   padding: const EdgeInsets.all(20.0),
                //   child: Align(
                //     alignment: Alignment.bottomLeft,
                //     child: ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //         backgroundColor: Colors.green, // Green/teal background
                //         padding: const EdgeInsets.symmetric(
                //             horizontal: 24, vertical: 12),
                //         textStyle: const TextStyle(fontSize: 16),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(8.0),
                //         ),
                //       ),
                //       onPressed: () {
                //         // Handle edit action
                //       },
                //       child: const Text(
                //         "Edit",
                //         style: TextStyle(color: Colors.white),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// The ItemData class is no longer needed and has been removed.
