import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospitalmanagementproject/main.dart';
import 'package:hospitalmanagementproject/views/BenhNhan/BenhNhanPage.dart';
import 'package:hospitalmanagementproject/data/data.dart';
import 'package:meta/dart2js.dart';
import '../../models/BenhNhan.dart';
import 'FormBenhNhan.dart';

class ThemBenhNhan extends StatelessWidget {
  final tenCt = TextEditingController();
  final diachiCt = TextEditingController();
  final cccdCt = TextEditingController();
  final List<int> idPhongDT = [-1];
  List<DateTime> ngaysinh = [DateTime.now()];
  List<DateTime> ngaykham = [DateTime.now()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(children: [
            Text(
              "Thêm Bệnh Nhân",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ]),
          backgroundColor: Colors.blue),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      expands: false,
                      decoration: InputDecoration(
                        labelText: "Ten",
                        prefixIcon: Icon(Icons.people),
                        border: OutlineInputBorder(),
                      ),
                      controller: tenCt,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DateSelect("ngay sinh", ngaysinh),
                    SizedBox(
                      height: 10,
                    ),
                    DateSelect("ngay kham", ngaykham),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      expands: false,
                      decoration: InputDecoration(
                        labelText: "dia chi",
                        prefixIcon: Icon(Icons.home),
                        border: OutlineInputBorder(),
                      ),
                      controller: diachiCt,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      expands: false,
                      decoration: InputDecoration(
                        labelText: "can cuoc cong dan",
                        prefixIcon: Icon(Icons.credit_card),
                        border: OutlineInputBorder(),
                      ),
                      controller: cccdCt,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyDropdownButtonFormField(idPhongDT),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                fixedSize: Size(double.infinity, 60)),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BenhNhanPage(data.DataBenhNhan()),
                                  ));
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 50,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepOrangeAccent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  fixedSize: Size(double.infinity, 60)),
                              onPressed: () {
                                String ten = '';
                                ten = tenCt.text;
                                String diachi = '';
                                diachi = diachiCt.text;
                                int? cccd = int.tryParse(cccdCt.text);
                                int id = idPhongDT[0];
                                DateTime ns = ngaysinh[0];
                                DateTime nk = ngaykham[0];

                                if (ten != '' &&
                                    diachi != '' &&
                                    cccd != null &&
                                    id != -1) {
                                  data.DataBenhNhan().add(
                                      BenhNhan(ten, ns, nk, diachi, cccd, id));

                                  //dieu huong
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BenhNhanPage(data.DataBenhNhan())),
                                  );
                                } else {
                                  final snackBar = SnackBar(
                                    content: Text('bạn nhập không đủ dữ liệu'),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: Icon(
                                Icons.person_add_rounded,
                                size: 50,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
