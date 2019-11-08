import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _uPassController = TextEditingController();

  // @override
  @override
  // todo 这里的initState涉及到组件的生命周期(debug的时候保存的时候是不重新走这一步的)
  void initState() {
    // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
    _unameController.text = '111111';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('登录页面')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Form(
            autovalidate: true, //开启自动校验
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 300.0,
                  height: 60.0,
                  child: TextFormField(
                      controller: _unameController,
                      decoration: InputDecoration(
                          hintText: "用户名", prefixIcon: Icon(Icons.person)),
                      validator: (v) {
                        return v.trim().length > 0 ? null : "用户名不能为空";
                      }),
                ),
                SizedBox(
                  width: 300.0,
                  height: 100.0,
                  child: TextFormField(
                      controller: _uPassController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "密码", prefixIcon: Icon(Icons.lock)),
                      validator: (v) {
                        return v.trim().length > 5 ? null : "密码不能少于6位";
                      }),
                ),
                Container(
                    width: 300,
                    height: 50,
                    child: Builder(
                      builder: (context) {
                        return RaisedButton(
                          child: Text("登录"),
                          color: Colors.blue,
                          colorBrightness: Brightness.dark,
                          onPressed: () {
                            Navigator.pushNamed(context, 'homePage');
                            // 这里的这个context需要注意一下，传的是哪一个context需要注意一下，否则拿不到对应的上下文(context)
                            // if (Form.of(context).validate()) {
                            //   //验证通过提交数据
                            //   print(_unameController.text);
                            // }
                          },
                        );
                      },
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
