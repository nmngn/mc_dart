import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';

typedef BottomSelectCallback = void Function(int);

class BottomSelectWidget extends StatefulWidget {
  late List<String> _listData;
  late String _title;
  late int _indexSelected;
  BottomSelectCallback? getIndexSelected = null;

  BottomSelectWidget(String title, List<String> listData, int indexSelected,
      {this.getIndexSelected = null}) {
    this._listData = listData;
    this._title = title;
    this._indexSelected = indexSelected;
  }

  @override
  _BottomSelectWidgetState createState() => _BottomSelectWidgetState();
}

class _BottomSelectWidgetState extends State<BottomSelectWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildItemPopup();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Widget _buildItemPopup() {
    var listWidget = <Widget>[];

    if (widget._listData.length > 9) {
      listWidget.add(_buildSearch());
    }

    for (int i = 0; i < widget._listData.length; i++) {
      var item = GestureDetector(
        onTap: () {
          setState(() {
            widget._indexSelected = i;
            if (widget.getIndexSelected != null) {
              widget.getIndexSelected!(i);
            }
          });
        },
        child: _buildListItemPopup(widget._listData[i],
            isSelect: i == widget._indexSelected),
      );
      listWidget.add(item);
    }
    listWidget.add(const SizedBox(
      height: 20,
    ));
    var listView = ListView(
      padding: EdgeInsets.only(left: 16, right: 16),
      shrinkWrap: true,
      children: listWidget,
    );
    return Container(
      decoration: BoxDecoration(color: Color(0xFFF6F7F8)),
      child: Column(children: [_buildTitlePopup(), Expanded(child: listView)]),
    );
  }

  Widget _buildTitlePopup() {
    var title = Text(widget._title);
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Color(0xFF5F5F5F).withOpacity(0.15),
            offset: Offset(0, 2),
            blurRadius: 6)
      ]),
      child: title,
    );
  }

  Widget _buildListItemPopup(String title, {bool isSelect = false}) {
    var textColor = isSelect ? Colors.white : Colors.black;
    var bgColor = isSelect ? Color(0xFF1BC5AC) : Colors.white;

    var text = Text(
      title,
      style: TextStyle(color: textColor, fontSize: 15),
    );

    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 15),
      width: MediaQuery.of(context).size.width - 32,
      height: 44,
      child: text,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(10)),
    );
  }

  Widget _buildSearch() {
    var icon = Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(
        left: 12,
        right: 4,
      ),
      child: Image.asset(
        Assets.icSearch,
        width: 16,
        height: 16,
      ),
    );

    var text = Text("Tim kiem...");

    return Container(
      margin: EdgeInsets.only(top: 15),
      height: 33,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: Colors.white),
      child: Row(
        children: [icon, text],
      ),
    );
  }
}
