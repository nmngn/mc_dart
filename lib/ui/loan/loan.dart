import 'package:flutter/material.dart';
import '../../constants/assets.dart';
import 'package:mc_dart/utils/routes/routes.dart';

import '../common_view/SingleInfoLine.dart';

class LoanScreen extends StatefulWidget {
  @override
  _LoanScreenState createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  Color _cellColor = Colors.blue;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách khoản vay'),
        elevation: 0.5,
        titleTextStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset(
              Assets.icSetting,
              width: 24,
              height: 24,
            ),
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                builder: (BuildContext context) {
                  return _popupStatus();
                },
              );
            },
          ),
        ],
      ),
      body: _buildListView(context),
    );
  }

  Container _popupStatus() {
    return Container(
      height: 410,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            'Trạng thái',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _sizeBox(20),
            _cellOption('Chờ xác nhận'),
            _cellOption('Chờ xử lý'),
            _cellOption('Đã kết thúc'),
            _cellOption('Quá hạn'),
            _cellOption('Tất cả'),
          ],
        ),
      ),
    );
  }

  Widget _cellOption(String text) {
    return GestureDetector(
      onTap: () {
        _cellColor = Colors.green;
        Navigator.of(context).pushNamed(Routes.infoLoan);
      },
      child: Container(
        height: 44,
        margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffdee3e7)),
          color: _cellColor,
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(text,
              style: const TextStyle(fontSize: 15, color: Colors.black)),
        ),
      ),
    );
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
      itemCount: 6);
}

Widget _buildItem(int position, BuildContext context) {
  switch (position) {
    case 0:
      return Container(
        child: _searchBar(),
      );
    case 1:
      return Container(
        child: _cellReturnNow(context),
        margin: const EdgeInsets.only(right: 16, left: 16),
      );
    case 2:
      return Container(
        child: _cellConfirmLoan(context),
        margin: const EdgeInsets.only(right: 16, left: 16),
      );
    case 3:
      return Container(
        child: _cellNotiMe(context),
        margin: const EdgeInsets.only(right: 16, left: 16),
      );
    case 4:
      return Container(
        child: _cellBankReject(context),
        margin: const EdgeInsets.only(right: 16, left: 16),
      );
    default:
      return _sizeBox(16);
  }
}

Widget _searchBar() {
  return Container(
    height: 64.0,
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
      child: Card(
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: ListTile(
          leading: Container(
            margin: const EdgeInsets.only(top: 0, bottom: 16, left: 0),
            child: Image.asset(
              Assets.icSearch,
              width: 24,
              height: 24,
            ),
          ),
          title: const TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 0, bottom: 21, left: -24),
                hintText: 'Tìm kiếm ...',
                border: InputBorder.none),
            // onChanged: onSearchTextChanged,
          ),
        ),
      ),
    ),
  );
}

Widget _cellReturnNow(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed(Routes.loanDetail);
    },
    child: Container(
      height: 284,
      width: MediaQuery.of(context).size.width - 16 * 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffff9a95)),
      ),
      child: Column(
        children: [
          Container(
            height: 44,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(9), topRight: Radius.circular(9)),
              border: Border.all(color: const Color(0xffff9a95)),
              color: const Color(0xffffd6d3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.icWarning,
                  width: 24,
                  height: 24,
                ),
                const Text(
                  'Quá hạn thanh toán 2 ngày và tính phí trả chậm',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xffff3b30),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SingleInfoLineCell('Số tiền thanh toán', '1.000.000',  fontWeight: FontWeight.bold,),
          _sizeBox(8),
          SingleInfoLineCell('Kỳ tiếp theo', '01/01/2021'),
          _sizeBox(8),
          SingleInfoLineCell('Khoản vay', '5.000.000đ'),
          _sizeBox(8),
          SingleInfoLineCell('Kỳ thanh toán', '02/12 kỳ'),
          _sizeBox(8),
          SingleInfoLineCell('Số hợp đồng', 'AVBFEI2348'),
          _sizeBox(24),
          _bottomButton(
              'Trả ngay', const Color(0xffffffff), const Color(0xffff3b30),
              onTap: () {
            Navigator.of(context).pushNamed(Routes.paymentLoan);
          })
        ],
      ),
    ),
  );
}

Widget _sizeBox(double height, {double width = 0.0}) {
  return SizedBox(
    height: height,
    width: width,
  );
}

Widget _bottomButton(String title, Color textColor, Color backColor,
    {VoidCallback? onTap}) {
  return GestureDetector(
    onTap: () {
      onTap!();
    },
    child: Container(
      height: 44,
      margin: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backColor,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

Widget _cellConfirmLoan(BuildContext context) {
  return Container(
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.loanDetail);
      },
      child: Container(
        height: 413,
        width: MediaQuery.of(context).size.width - 16 * 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xfffb9d10)),
        ),
        child: Column(
          children: [
            Container(
              height: 44,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(9), topRight: Radius.circular(9)),
                border: Border.all(color: const Color(0xfffb9d10)),
                color: const Color(0xfffff0da),
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Xác nhận khoản vay',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Color(0xffe18700),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SingleInfoLineCell('Số tiền đăng ký vay', '1.000.000d', fontWeight: FontWeight.bold),
            _sizeBox(8),
            SingleInfoLineCell('Số tiền được duyệt*', '800.000đ',
                colorTrailing: const Color(0xffff3b30)),
            _sizeBox(8),
            SingleInfoLineCell('Kỳ hạn vay', '12 tháng'),
            _sizeBox(8),
            SingleInfoLineCell('Lãi suất', '1,5%/tháng'),
            _sizeBox(8),
            SingleInfoLineCell('Tiền trả hàng tháng', '100.000đ'),
            _sizeBox(8),
            SingleInfoLineCell('Số hợp đồng', 'AVBFEI2348'),
            _sizeBox(24),
            Container(
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                alignment: Alignment.centerLeft,
                child: const Text('*Dựa trên kết quả thẩm định hồ sơ',
                    style: TextStyle(
                        color: Color(0xffff3b30),
                        fontStyle: FontStyle.italic,
                        fontSize: 15)),
              ),
            ),
            _sizeBox(20),
            _bottomButton(
                'Đồng ý vay', const Color(0xffffffff), const Color(0xfffb9d10),
                onTap: () {
              print('vay');
            }),
            _sizeBox(16),
            _bottomButton(
                'Từ chối', const Color(0xff5c616f), const Color(0xffe8ebee),
                onTap: () {
              print('huyr');
            })
          ],
        ),
      ),
    ),
  );
}

Widget _cellNotiMe(BuildContext context) {
  return Container(
    child: GestureDetector(
      onTap: () {
        print('huyr');
      },
      child: Container(
        height: 284,
        width: MediaQuery.of(context).size.width - 16 * 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffe8ebee)),
        ),
        child: Column(
          children: [
            Container(
              height: 44,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(9), topRight: Radius.circular(9)),
                border: Border.all(color: const Color(0xffe8ebee)),
                color: const Color(0xffffffff),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _sizeBox(0, width: 8),
                  Image.asset(
                    Assets.icCalendar,
                    width: 24,
                    height: 24,
                  ),
                  _sizeBox(0, width: 8),
                  const Text(
                    'Còn 27 ngày đến kỳ thanh toán tiếp theo',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xff040c22),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            SingleInfoLineCell('Số tiền thanh toán', '1.000.000', fontWeight: FontWeight.bold),
            _sizeBox(8),
            SingleInfoLineCell('Kỳ tiếp theo', '01/01/2021'),
            _sizeBox(8),
            SingleInfoLineCell('Khoản vay', '5.000.000đ'),
            _sizeBox(8),
            SingleInfoLineCell('Kỳ thanh toán', '02/12 kỳ'),
            _sizeBox(8),
            SingleInfoLineCell('Số hợp đồng', 'AVBFEI2348'),
            _sizeBox(24),
            _bottomButton(
                'Đã từ chối', const Color(0xffffffff), const Color(0xffcdd4db),
                onTap: () {
              print('da tu choi');
            })
          ],
        ),
      ),
    ),
  );
}

Widget _cellBankReject(BuildContext context) {
  return GestureDetector(
    onTap: () {
      print('huyr');
    },
    child: Container(
      height: 284,
      width: MediaQuery.of(context).size.width - 16 * 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffe8ebee)),
      ),
      child: Column(
        children: [
          Container(
            height: 44,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(9), topRight: Radius.circular(9)),
              border: Border.all(color: const Color(0xffe8ebee)),
              color: const Color(0xffffffff),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _sizeBox(0, width: 8),
                Image.asset(
                  Assets.icCancel,
                  width: 24,
                  height: 24,
                ),
                _sizeBox(0, width: 8),
                const Text(
                  'Đã bị từ chối bởi ngân hàng ABC do nợ xấu',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xff040c22),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          SingleInfoLineCell('Số tiền thanh toán', '1.000.000', fontWeight: FontWeight.bold,
              colorTrailing: const Color(0xff5c616f),
              colorLeading: const Color(0xff5c616f)),
          _sizeBox(8),
          SingleInfoLineCell('Kỳ tiếp theo', '01/01/2021',
              colorTrailing: const Color(0xff5c616f),
              colorLeading: const Color(0xff5c616f)),
          _sizeBox(8),
          SingleInfoLineCell('Khoản vay', '5.000.000đ',
              colorTrailing: const Color(0xff5c616f),
              colorLeading: const Color(0xff5c616f)),
          _sizeBox(8),
          SingleInfoLineCell('Kỳ thanh toán', '02/12 kỳ',
              colorTrailing: const Color(0xff5c616f),
              colorLeading: const Color(0xff5c616f)),
          _sizeBox(8),
          SingleInfoLineCell('Số hợp đồng', 'AVBFEI2348', 
              colorTrailing: const Color(0xff5c616f),
              colorLeading: const Color(0xff5c616f)),
          _sizeBox(24),
          _bottomButton(
              'Đã từ chối', const Color(0xffffffff), const Color(0xffcdd4db),
              onTap: () {
            print('da tu choi');
          }),
        ],
      ),
    ),
  );
}

Widget _emptyLoan() {
  return Center(
    child: Container(
      height: 130,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 35, right: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: const Text(
              'Chưa có khoản vay vào',
              style: TextStyle(
                  color: Color(0xffa7aab2),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 8),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                '      Bạn chưa có khoản vay nào được tạo \nBấm vào nút Vay ngay để tạo khoản vay mới',
                style: TextStyle(
                    color: Color(0xff5c616f),
                    fontSize: 13,
                    fontWeight: FontWeight.w200),
              ),
            ),
          ),
          Container(
            child: SizedBox(
              height: 34,
              width: 120,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                height: 34,
                color: Color(0xff1bc5ac),
                onPressed: () {
                  print('clicked');
                },
                child: const Text(
                  'Vay ngay',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
