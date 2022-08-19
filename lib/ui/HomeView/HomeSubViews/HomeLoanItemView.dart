import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mc_dart/constants/assets.dart';

import '../../../utils/routes/routes.dart';

class HomeLoanItemView extends StatefulWidget {
  late String title;
  late String description;

  HomeLoanItemView(this.title, this.description);

  @override
  _HomeLoanItemState createState() => _HomeLoanItemState();
}

class _HomeLoanItemState extends State<HomeLoanItemView> {
  //stores:---------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _buildMainView();
  }

  Widget _buildMainView() {
    const double padding = 16.0;
    double viewHeight = 70.0 + padding;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.createLoan);
      },
      child: Container(
          width: double.infinity,
          height: viewHeight,
          margin: const EdgeInsets.only(
              left: padding, right: padding, top: padding),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white),
          child: Row(
            children: <Widget>[
              Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.only(left: padding),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(Assets.homeSubViewAuthBg),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  )),
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(
                          left: padding, right: padding, top: padding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.title,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(width: 10, height: 2),
                          Text(
                            widget.description,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.black),
                            maxLines: 2,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ))),
              Container(
                  alignment: Alignment.centerRight,
                  height: 16,
                  width: 16,
                  margin: const EdgeInsets.only(right: padding),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(Assets.homeSubViewItemNext),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  )),
            ],
          )),
    );
  }
}
