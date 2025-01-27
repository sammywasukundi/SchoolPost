// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/widgets/widget_forms.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final int nbrNotifications = 10; // Replace with your notification count

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        elevation: 2.0,
        backgroundColor: bgColor,
        shadowColor: bgColor,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Notifications',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(width: 80),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  // Handle "Voir tout" action
                },
                child: Text(
                  'Marquer tout',
                  style: TextStyle(
                      color: blueColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notifications $nbrNotifications',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 5),
                  IconButton(
                    onPressed: () {
                      FormHoraire().showSearchDialog(context, searchController); // Replace 'arg1' and 'arg2' with actual arguments
                    },
                    icon: Icon(
                      Icons.search_outlined,
                      color: blueColor,
                      size: 30,
                    )
                  )
                ],
              ),
            ),
            const Divider(),
            SizedBox(height: 10),
            SizedBox(
              //width: double.infinity,
              height: 610,
              child: ListView.builder(
                itemCount: 10, // Adjust the item count as needed
                itemBuilder: (context, index) {
                  return Card(
                    color: greyColor,
                    shadowColor: blackColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                              'assets/images/post/1.png'), // Replace with your profile image asset
                        ),
                        title: Text(
                          'Communication de l\'institution $index',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //SizedBox(height: 25),
                            Row(
                              children: [
                                const Icon(Icons.calendar_today_outlined, size: 16),
                                const SizedBox(width: 5),
                                const Text('Today, 10:00 AM'),
                                SizedBox(width: 30,),
                                IconButton(
                                  onPressed: () {
                                    // Handle action
                                  },
                                  icon: Icon(Icons.visibility_outlined),
                                ),
                                IconButton(
                                  onPressed: () {
                                    // Handle action
                                  },
                                  icon: Icon(Icons.check_outlined),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
