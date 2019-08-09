import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _id = TextEditingController();
  final _pw = TextEditingController();
  bool _checked = false;
//  _id.addListener(() {  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.2,
              padding: EdgeInsets.only(left: 20, top: 40, right: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue,
                    Colors.blueAccent,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60.0),
                  bottomRight: Radius.circular(60.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 32, right: 32),
                      child: Text(
                        'MTMS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 42),
            child: Column(
              children: <Widget>[
                //id
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '아이디',
                      icon: Icon(
                        Icons.public,
                        color: Colors.grey,
                      ),
                    ),
                    cursorColor: Color(0xFF289AFF),
                    controller: _id,
                  ),
                ),

                //pw
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 32),
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  padding:
                      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '패스워드',
                      icon: Icon(
                        Icons.vpn_key,
                        color: Colors.grey,
                      ),
                    ),
                    obscureText: true,
                    controller: _pw,
                    cursorColor: Color(0xFF289AFF),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight / 1.2,
                  child: FlatButton(
                    child: Text('아이디 또는 비밀번호 찾기'),
                    onPressed: () {},
                  ),
                ),
                Align(
                  child: Container(
                    //   padding: EdgeInsets.only(bottom: 10),
                    alignment: Alignment.topLeft,
                    width: MediaQuery.of(context).size.width / 1.05,
                    // height: MediaQuery.of(context).size.height / 20,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 20),
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.redAccent),
                          child: Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: _checked,
                            onChanged: (bool value) {
                              setState(() {
                                _checked = value;
                              });
                            },
                            activeColor: Colors.transparent,
                            checkColor: Colors.redAccent,
                          ),
                        ),
                        Container(
                          width: 150,
                          alignment: Alignment.topLeft,
                          child: Text(
                            '로그인 정보 기억하기',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF289AFF),
                        Colors.blue,
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Center(
                    child: FlatButton(
                      child: Text(
                        'Login'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
