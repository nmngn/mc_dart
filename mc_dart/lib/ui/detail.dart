import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mc_dart/model/user.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyDetailView());
  }
}

class MyDetailView extends StatefulWidget {
  const MyDetailView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyDetailViewState();
  }
}

class _MyDetailViewState extends State<MyDetailView> {
  DateTime selectedDate = DateTime.now();
  User currentUser = User();
  XFile? avatarImage;

  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        avatarImage = image;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2023, 8),
        lastDate: DateTime(2030));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String getCurrentDate() {
    DateTime now = DateTime.now();
    DateTime date = DateTime(
        now.year, now.month, now.day, now.hour, now.minute, now.second.toInt());
    return date.toString().replaceAll('.000', '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
          title: const Text('Thong tin ca nhan'),
        ),
        body: bodyView());
  }

  Widget bodyView() {
    return ListView.separated(
      itemCount: 11,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return avatarCell();
          case 1:
            return infomationCell();
          case 2:
            return itemCell('Ho va ten');
          case 3:
            return itemCell('Dia chi');
          case 4:
            return phoneCell();
          case 5:
            return itemCell('Nam sinh');
          case 6:
            return itemCell('Chieu cao');
          case 7:
            return ageCell();
          case 8:
            return itemCell('Ghi chu');
          case 9:
            return addPhotoCell();
          default:
            return Container();
        }
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Colors.transparent,
        );
      },
      padding: const EdgeInsets.only(top: 16, bottom: 16),
    );
  }

  Widget avatarCell() {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            Container(
                height: 144,
                width: 144,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(75)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(75),
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child: avatarImage == null
                            ? Image.asset('assets/image/avatar.jpeg')
                            : Image.file(File(avatarImage!.path))))),
            Positioned(
              height: 36,
              width: 36,
              bottom: 0,
              right: 0,
              child: FloatingActionButton(
                  onPressed: () {
                    getImage();
                  },
                  child: Image.asset('assets/image/take_photo.png')),
            )
          ])
        ],
      ),
    );
  }

  Widget infomationCell() {
    return Container(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Thong tin chung',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Ngay dang ki: ${getCurrentDate()}')
          ],
        ));
  }

  Widget itemCell(String itemText) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(itemText, style: const TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          Container(
              height: 38,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              child: const TextField(
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 14),
                enableSuggestions: false,
                autocorrect: false,
              ))
        ],
      ),
    );
  }

  Widget phoneCell() {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Sdt", style: TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          Container(
              height: 38,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              child: const TextField(
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                style: TextStyle(fontSize: 14),
                keyboardType: TextInputType.phone,
                enableSuggestions: false,
                autocorrect: false,
              ))
        ],
      ),
    );
  }

  Widget ageCell() {
    return Container(
        height: 64,
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: (MediaQuery.of(context).size.width - (24 * 2) - 24) / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Ngay du sinh",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    const SizedBox(height: 8),
                    Container(
                      height: 38,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('asdas'),
                          const SizedBox(width: 16),
                          TextButton(
                              onPressed: () {
                                _selectDate(context);
                              },
                              isSemanticButton: false,
                              child: Image.asset('assets/image/calendar.png'))
                        ],
                      )),
                    )
                  ],
                )),
            const Spacer(),
            SizedBox(
              width: (MediaQuery.of(context).size.width - (24 * 2) - 24) / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Tuoi tuan thai",
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8),
                  Container(
                    height: 38,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      child: const Center(child: Text('12/12/2022')),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget addPhotoCell() {
    return Container(
      padding: const EdgeInsets.only(right: 24, left: 24),
      height: 38,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Anh kem theo", style: TextStyle(fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}
