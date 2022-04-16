import 'package:flutter/material.dart';


class DialogTestRoute extends StatefulWidget {
  DialogTestRoute({Key? key}) : super(key: key);

  @override
  _DialogTestRoute createState() => _DialogTestRoute();
}

class _DialogTestRoute extends State<DialogTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //浮动按钮
        floatingActionButton: FloatingActionButton(
          child: Text('返回'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        appBar: AppBar(
          title: Text("Button2"),
        ),
        body: Center(
            child: Column(children: [
              Text("Button2页面1"),
              //点击该按钮后弹出对话框
              ElevatedButton(
                child: Text("对话框1"),
                onPressed: () async {
                  //弹出对话框并等待其关闭
                  bool? delete = await showDeleteConfirmDialog1();
                  if (delete == null) {
                    print("取消删除");
                  } else {
                    print("已确认删除");
                    //... 删除文件
                  }
                },
              ),
              ElevatedButton(
                child: Text("请选择语言_对话框"),
                onPressed: () async {
                  SnackBar(content: Text("我是SnackBar"));
                  //弹出对话框并等待其关闭
                  await changeLanguage();
                },
              ),
            ])));
  }

// 弹出对话框
  Future<bool?> showDeleteConfirmDialog1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            TextButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            TextButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> changeLanguage() async {
    int? dialog = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });

    if (dialog != null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("选择了：${dialog == 1 ? "中文简体" : "美国英语"}")));

      print("选择了：${dialog == 1 ? "中文简体" : "美国英语"}");
    }
  }
}
