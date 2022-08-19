import 'package:flutter/material.dart';
import 'package:mc_dart/utils/routes/routes.dart';
import '../../constants/assets.dart';

enum ResultType { none, pending, failed, success }

class PeriodPaymentScreen extends StatefulWidget {
  @override
  _PeriodPaymenScreenState createState() => _PeriodPaymenScreenState();
}

class _PeriodPaymenScreenState extends State<PeriodPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text('Kỳ thanh toán',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          leading: IconButton(
            icon: Image.asset(
              Assets.icBack,
              width: 24,
              height: 24,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
        ),
        body: _buildListView(context));
  }
}

Widget _buildListView(BuildContext context) {
  return ListView.separated(
      itemBuilder: (context, position) {
        return _buildItem(position, context);
      },
      separatorBuilder: (context, position) {
        return const Divider(
          color: Colors.transparent,
        );
      },
      itemCount: 8);
}

Widget _buildItem(int position, BuildContext context) {
  switch (position) {
    case 0:
      return Container(
        child: _cellPeriod(ResultType.none, context),
        margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
      );
    case 1:
      return Container(
        child: _cellPeriod(ResultType.pending, context),
        margin: const EdgeInsets.only(left: 16, right: 16),
      );
    case 2:
      return Container(
        child: _cellPeriod(ResultType.failed, context),
        margin: const EdgeInsets.only(left: 16, right: 16),
      );
    case 3:
      return Container(
        child: _cellPeriod(ResultType.failed, context),
        margin: const EdgeInsets.only(left: 16, right: 16),
      );
    case 4:
      return Container(
        child: _cellPeriod(ResultType.pending, context),
        margin: const EdgeInsets.only(left: 16, right: 16),
      );
    case 5:
      return Container(
        child: _cellPeriod(ResultType.success, context),
        margin: const EdgeInsets.only(left: 16, right: 16),
      );
    case 6:
      return Container(
        child: _cellPeriod(ResultType.success, context),
        margin: const EdgeInsets.only(left: 16, right: 16),
      );
    default:
      return Container();
  }
}

Widget _cellPeriod(ResultType type, BuildContext context) {
  var _color = const Color(0xffF6F7F8);
  var _image = Assets.icBlank;
  switch (type) {
    case ResultType.pending:
      _color = const Color(0xffFFD79B);
      _image = Assets.icPending;
      break;
    case ResultType.failed:
      _color = const Color(0xffFFD6D3);
      _image = Assets.icWarningV2;
      break;
    case ResultType.success:
      _color = const Color(0xffD3F6F1);
      _image = Assets.icSuccess;
      break;
    default:
      break;
  }
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed(Routes.transactionDetail);
    },
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  _image,
                  height: 20,
                  width: 20,
                ),
                Container(
                  height: 68,
                  width: 4,
                  margin: const EdgeInsets.only(left: 8),
                  color: _color,
                ),
              ],
            ),
          ),
          Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Kỳ 10: 16/11/2021',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    height: 48,
                    margin: const EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffDEE3E7)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: const Text('Số tiền cần thanh toán: 672.000 đ'),
                      trailing: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Image.asset(
                          Assets.icRightArrow,
                          width: 16,
                          height: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    ),
  );
}
