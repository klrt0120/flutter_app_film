import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:motchill/screens/profile.dart';
import 'package:provider/provider.dart';

import '../core/routes/routes.dart';
import '../providers/authenciation_provider.dart';
import 'home.dart';

class ListBookmarkScreen extends StatefulWidget {
  const ListBookmarkScreen({Key? key}) : super(key: key);

  @override
  State<ListBookmarkScreen> createState() => _ListBookmarkScreenState();
}

class _ListBookmarkScreenState extends State<ListBookmarkScreen> {
  final _supabaseClient = AuthenciationNotifier();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách phim đã lưu',
            style: Theme.of(context).textTheme.headline6),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: _ListBookMark(),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        index: 1,
        color: HexColor("#000"),
        backgroundColor: Colors.transparent,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.manage_accounts, size: 30),
        ],
        onTap: (index) {
          print(index);
          if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
          if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ListBookmarkScreen()));
          }
          if (index == 2) {
            () async {
              await _supabaseClient.getData();
              Navigator.pushNamed(context, "${AppRoutes.ProfileRoutes}",
                  arguments: {
                    "username": _supabaseClient.user['username'],
                    "email": _supabaseClient.user['email']
                  });
            }();
          }
          
        },
      ),
    );
  }
}

class _ListBookMark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline6;
    //var listBookmarkPage = context.watch<movie_model>();
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => ListTile(
        leading: Image.asset('assets/images/motchill.png'),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {},
        ),
        title: Text(
          'Tên phim',
          style: itemNameStyle,
        ),
        subtitle: Text(
          'Nội dung phim',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
    );
  }
}
