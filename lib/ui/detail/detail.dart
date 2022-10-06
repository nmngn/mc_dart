import 'package:mc_dart/constants/assets.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildListView();
  }

  Widget _buildListView() {
    return ListView.separated(
        itemBuilder: (context, position) {
          return _buildItem(position);
        },
        separatorBuilder: (context, position) {
          return const Divider(
            color: Colors.transparent,
          );
        },
        itemCount: 8);
  }

  Widget _buildItem(int position) {
    switch (position) {
      case 0:
         return Container(
          height: 178,
          child: Image.asset(
            Assets.appLogo,
            height: 154,
            width: 154,
          ),
         );   
        break;
      default:
      return Container();
    }
  }
}
