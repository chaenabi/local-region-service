import 'package:flutter/material.dart';
import 'package:mtms/data/signin_or_signup.dart';
import 'package:mtms/models/sign_design.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _id = TextEditingController();
  final _pw = TextEditingController();
  final _pwCompare = TextEditingController();
  bool _authSavedchecked = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//  _id.addListener(() {  });

  List<Color> _signIn(BuildContext context) {
    return SignInOrSignUpDesign.loginTopBackground(
        Provider.of<SignInOrSignUp>(context).isJoin);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                padding: EdgeInsets.only(left: 20, top: 33, right: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: _signIn(context),
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
                        child: Consumer<SignInOrSignUp>(
                          builder: (context, signInOrsignUp, childWidget) =>
                              GestureDetector(
                            onTap: () {
                              signInOrsignUp.toggle();
                   
                            },
                            child: signInOrsignUp.isJoin
                                ? Text(
                                    'MTMS Sign Up',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Text(
                                    'MTMS Sign In',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
                  child: TextFormField(
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
                    validator: (String id) {
                      if (id.isEmpty) {
                        return '아이디를 입력해주세요.';
                      }
                      // validation 통과.
                      return null;
                    },
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
                  child: TextFormField(
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
                    validator: (String id) {
                      if (id.isEmpty) {
                        return '비밀번호를 입력해주세요.';
                      }
                      // validation 통과.
                      return null;
                    },
                  ),
                ),
                Consumer<SignInOrSignUp>(
                  builder: (ctx, signInOrsignUp, widget) => GestureDetector(
                    onTap: () {
                      signInOrsignUp.toggle();
                    },
                    child: signInOrsignUp.isJoin
                        ?
                        Container(
                            padding: EdgeInsets.only(top: 32),
                            child: Column(
                              children: <Widget>[
                                //id
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  height: 50,
                                  padding: EdgeInsets.only(
                                      top: 4, left: 16, right: 16, bottom: 4),
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
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '비밀번호 확인',
                                      icon: Icon(
                                        Icons.vpn_key,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    cursorColor: Color(0xFF289AFF),
                                    controller: _pwCompare,
                                    validator: (String _pwCompare) {
                                      if (_pwCompare.isEmpty) {
                                        return '비밀번호를 확인해주세요.';
                                      }
                                      if (_pwCompare != _pw.text) {
                                        return '비밀번호가 일치하지 않습니다';
                                      }

                                      // validation 통과.
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            alignment: Alignment.centerRight / 1.2,
                            child: FlatButton(
                              child: Opacity(
                                opacity: 1,
                                child: Text('아이디 또는 비밀번호 찾기'),
                              ),
                              onPressed: () {},
                            ),
                          ),
                  ),
                ),
                Consumer<SignInOrSignUp>(
                  builder: (context, signInOrsignUp, childWidget) =>
                      GestureDetector(
                    child: signInOrsignUp.isJoin
                        ? Container()
                        : Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: Align(
                              child: Container(
                                alignment: Alignment.topLeft,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: <Widget>[
                                    Theme(
                                      data: Theme.of(context).copyWith(
                                          unselectedWidgetColor:
                                              Colors.redAccent),
                                      child: Checkbox(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        value: _authSavedchecked,
                                        onChanged: (bool value) {
                                          setState(() {
                                            _authSavedchecked = value;
                                          });
                                        },
                                        activeColor: Colors.transparent,
                                        checkColor: Colors.redAccent,
                                      ),
                                    ),
                                    Text(
                                      '로그인 정보 기억하기',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Consumer<SignInOrSignUp>(
                  builder: (context, signInOrsignUp, childWidget) =>
                      GestureDetector(
                    onTap: () {
                      signInOrsignUp.toggle();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: signInOrsignUp.isJoin
                          ? Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width / 1.2,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.redAccent,
                                    Colors.red,
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: FlatButton(
                                  child: Text(
                                    '회원가입',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      if (_authSavedchecked == true) {
                                        //... 로그인 정보 기억하기 체크시
                                        print('true!');
                                      }
                                      // 모든 validation 패스시
                                      print('button pressed');
                                      // print(_id.value.text);
                                      // print(_pw.value.text);
                                    }
                                  },
                                ),
                              ),
                            )
                          : Container(
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
                                    '로그인',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      if (_authSavedchecked == true) {
                                        //... 로그인 정보 기억하기 체크시
                                        print('true!');
                                      }
                                      // 모든 validation 패스시
                                      print('button pressed');
                                      // print(_id.value.text);
                                      // print(_pw.value.text);
                                    }
                                  },
                                ),
                              ),
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 12),
          ),
          Consumer<SignInOrSignUp>(
            builder: (BuildContext context, SignInOrSignUp signInOrsignUp,
                    Widget child) =>
                GestureDetector(
              onTap: () {
                signInOrsignUp.toggle();
               
              },
              child: Text(
                signInOrsignUp.isJoin ? '아이디가 이미 있으십니까? (로그인 하러가기)' : '회원가입',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
