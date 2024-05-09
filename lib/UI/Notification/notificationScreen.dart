import 'package:estibafy_company_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../components/components.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10, // Replace with your actual number of notifications
        itemBuilder: (context, index) {
          if(index == 0 ){
            return  Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(LineAwesomeIcons.bell, color: AppColors.primaryColor,size: 40.0),
                  Text(
                    "notifications".toUpperCase(),
                    style: titleTextStyle,
                  ),
                ],
              ),
            );
          }else{
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 4.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                  title: const Text(
                    'Notification Title',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text('Notification Message'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Handle notification tap
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
