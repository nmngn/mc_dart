import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';

class AdvantageLoanCellWidget extends StatefulWidget {
  late String image ;
  late String title;

  AdvantageLoanCellWidget(String image, String title) {
    this.title = title;
    this.image = image;
  }
  @override
  _AdvantageLoanCellWidgetState createState() =>
      _AdvantageLoanCellWidgetState();
}

class _AdvantageLoanCellWidgetState extends State<AdvantageLoanCellWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildMain();
  }

  Widget _buildMain() {
    var image = Container(
      alignment: Alignment.topCenter,
      child: widget.image != null ? Image.network(widget.image) : Image.asset(Assets.icWeddingLoan),
      margin: const EdgeInsets.only(bottom: 5),
    );
    var title = Container(
      alignment: Alignment.bottomCenter,
      child: Text(
        widget.title,
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    );

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Expanded(child: image), title],
      ),
    );
  }
}
