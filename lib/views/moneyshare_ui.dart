import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoneyshareUI extends StatefulWidget {
  const MoneyshareUI({Key? key}) : super(key: key);

  @override
  _MoneyshareUIState createState() => _MoneyshareUIState();
}

class _MoneyshareUIState extends State<MoneyshareUI> {
  bool? check_tip = false;

  //สร้าฃออปเจ็คต์เพื่อจะนำไปใช้ควบคุม TextFileld ในหน้าจอที่สร้างไว้
  TextEditingController money_ctrl = TextEditingController();
  TextEditingController person_ctrl = TextEditingController();
  TextEditingController tip_ctrl = TextEditingController();

  //เมธอด -> โค้ดแสดง Dialog เตือน โดยจะรับข้อความมาแสดงที่ Dialog
  showWarningDialog(context, msg) {
    //เรียกใช้งานฟังก์ชัน showDialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepPurple,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ตกลง',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECBEFF),
      appBar: AppBar(
        backgroundColor: Color(0xFF7F0CAE),
        title: Text('แชร์เงินกันเถอะ'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              Image.asset(
                'assets/images/banner.png',
                height: 150.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 60.0,
                ),
                child: TextField(
                  controller: money_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF7F0CAE),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF7F0CAE),
                      ),
                    ),
                    hintText: 'ป้อนจำนวนเงิน (บาท)',
                    hintStyle: TextStyle(
                      color: Color(0XFFE3E3E3),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.moneyBillWave,
                      color: Color(0XFF7F0CAE),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 20.0,
                ),
                child: TextField(
                  controller: person_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF7F0CAE),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF7F0CAE),
                      ),
                    ),
                    hintText: 'ป้อนจำนวนคน (คน)',
                    hintStyle: TextStyle(
                      color: Color(0XFFE3E3E3),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0XFF7F0CAE),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    onChanged: (Val) {
                      setState(() {
                        check_tip = Val;
                      });
                    },
                    value: check_tip,
                    activeColor: Color(0xFF7F0CAE),
                    checkColor: Colors.yellow,
                    side: BorderSide(
                      color: Color(0xFF7F0CAE),
                    ),
                  ),
                  Text('ทิปให้พนักงานเสริฟร์'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                child: TextField(
                  controller: tip_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF7F0CAE),
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF7F0CAE),
                      ),
                    ),
                    hintText: 'ป้อนจำนวนเงินทิป (บาท)',
                    hintStyle: TextStyle(
                      color: Color(0XFFE3E3E3),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.coins,
                      color: Color(0XFF7F0CAE),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                onPressed: () {
                  if (money_ctrl.text.length == 0) {
                    //.length นับจำนวนตัวอักษร เกิดปัญไม่เหมือนจารให้ใส่ money_ctrl!
                    //แสดง MSG เตือน
                    showWarningDialog(context, 'ป้อนจำนวนเงินด้วย');
                    return;
                  } else if (person_ctrl.text.length == 0) {//เกิดปัญไม่เหมือนจารให้ใส่ person_ctrl!
                    //แสดง MSG เตือน
                    showWarningDialog(context, 'ป้อนจำนวนคนด้วย');
                    return;
                  } else if (check_tip == true) {
                    if (tip_ctrl.text.length == 0) {//เกิดปัญไม่เหมือนจารให้ใส่ tip_ctrl!
                      //แสดง msg เตือน
                      showWarningDialog(context, 'ป้อนจำนวนเงินด้วย');
                    return;
                    } else {
                      //คำนวณ(เงิน+ทิป) /คน
                    }
                  } else {
                    //คำนวณ เงิน/คน
                  }
                },
                child: Text(
                  'คำนวณ',
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80.0, //กว้าง
                    50.0, //สูง
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                  ),
                  primary: Color(0XFF7F0CAE),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  //เขียน Logic การทำงานโดยจะเคีลยค่าทุกอย่างบนหน้าจอ
                  //กลับมาเป็นเหมือนเดิม
                  setState(() {
                    money_ctrl.text = ''; //ใช้ " "ก๋ได้
                    person_ctrl.text = '';
                    tip_ctrl.text = '';
                    check_tip = false;
                  });
                },
                icon: Icon(
                  Icons.refresh,
                ),
                label: Text(
                  'ยกเลิก',
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    MediaQuery.of(context).size.width - 80.0, //กว้าง
                    50.0, //สูง
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                  ),
                  primary: Colors.red,
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
              Text(
                'Created by BC SAU 2022',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
