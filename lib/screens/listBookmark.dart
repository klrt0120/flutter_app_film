import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ListBookmarkScreen extends StatefulWidget {
  const ListBookmarkScreen({Key? key}) : super(key: key);

  @override
  State<ListBookmarkScreen> createState() => _ListBookmarkScreenState();
}

class _ListBookmarkScreenState extends State<ListBookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách phim đã lưu', style: Theme.of(context).textTheme.headline6),
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
      )
    );
  }
}
class _ListBookMark extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var itemNameStyle = Theme.of(context).textTheme.headline6;
    //var listBookmarkPage = context.watch<movie_model>();
    return ListView.builder(
      itemCount: 10,
        itemBuilder: (context, index) =>ListTile(
          leading: Image.asset('assets/images/motchill.png'),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: (){

            },
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
