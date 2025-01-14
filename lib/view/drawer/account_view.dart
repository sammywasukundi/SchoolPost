import 'package:flutter/material.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/theme/app_dialog.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: const Text(
          'John Doe',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                elevation: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Image.asset(
                    'assets/johnDoe.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
              ),
              Positioned(
                bottom: 12,
                right: 12,
                child: FloatingActionButton.small(
                  onPressed: () {},
                  backgroundColor: blueColor,
                  child: Icon(
                    Icons.camera_alt,
                    color: greyColor,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                'Mister John Doe',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                    fontSize: 24),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton.icon(
              onPressed: () {
                updateUser(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: blueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              ),
              icon: Icon(
                Icons.edit,
                color: greyColor,
              ),
              label: Text(
                "Modifier mes informations",
                style: TextStyle(
                  color: whiteColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2,horizontal:12 ),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: greyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(
                      "Pour vous",
                      style: TextStyle(color: blueColor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: greyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(
                      "Géneral",
                      style: TextStyle(color: blueColor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: greyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Icon(Icons.arrow_circle_right,color: blueColor,)
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
