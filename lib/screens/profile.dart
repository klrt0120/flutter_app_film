import 'package:flutter/material.dart';
import 'package:motchill/utils/consstants.dart';

import '../core/supabase/supabase.dart';
import '../providers/authenciation_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _supabaseClient = AuthenciationNotifier();
  // List<dynamic> data = [];
  var data = new Map();
  @override
  void iniState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    print(arg['username']);
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile ${arg['username']}',
              style: Theme.of(context).textTheme.headline6),
        ),
        // body: Container(
        //   child: GestureDetector(
        //     onTap: () {},
        //     child: Text("Sign out"),
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                      image: AssetImage(
                        'assets/images/avartar.jpg',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text('${arg['username']}',
                    style: Theme.of(context).textTheme.headline4),
                const SizedBox(height: 10),
                Text('${arg['email']}',
                    style: Theme.of(context).textTheme.bodyText2),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kRedColor,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),

                //Menu
                ProfileMenuWidget(
                  title: 'Thông báo',
                  icon: Icons.notifications,
                  onPress: () {},
                ),
                ProfileMenuWidget(
                  title: 'Phim đã lưu',
                  icon: Icons.list,
                  onPress: () {},
                ),
                ProfileMenuWidget(
                  title: 'Cài đặt',
                  icon: Icons.settings,
                  onPress: () {},
                ),
                ProfileMenuWidget(
                  title: 'Trợ giúp',
                  icon: Icons.help_outline,
                  onPress: () {},
                ),
                ProfileMenuWidget(
                  title: 'Đăng xuất',
                  icon: Icons.logout,
                  endIcon: false,
                  onPress: () {
                    _supabaseClient.SignOut(context);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: kRedColor.withOpacity(0.1),
        ),
        child: Icon(icon, color: kRedColor),
      ),
      title: Text(title,
          style:
              Theme.of(context).textTheme.bodyText1?.apply(color: textColor)),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(Icons.arrow_forward_ios_rounded,
                  size: 18, color: Colors.grey))
          : null,
    );
  }
}
