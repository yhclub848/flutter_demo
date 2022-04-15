import 'package:flutter/material.dart';
import 'package:flutter_demo/UI/controllers/UIMenuPage.dart';
import 'package:flutter_demo/pages/HomeMainPage.dart';
import 'package:flutter_demo/pages/MinePage.dart';
import 'package:flutter_demo/pages/SearchPage.dart';
import 'package:flutter_demo/pages/discoverPage.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({Key? key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final PageController _controller = PageController(initialPage: 0);
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  String currentTitle = '首页';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentTitle,
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        /** 导航栏右侧按钮 */
        actions: [
          IconButton(
              onPressed: () => navigationBarButtonClickAction(context),
              icon: Icon(Icons.bookmark_add)),
        ],
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () => navigationBarButtonClickAction(context),
        // ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('老鹰展翅飞翔🦅'),
              accountEmail: Text('zhaishanyingkengni@puhua.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic_source%2F9e%2F32%2F9a%2F9e329acc0c79523b0204f6ed7ea1e45e.jpg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1652579654&t=0e459d3712592d718c283964eebefbc5'),
              ),
              // decoration: BoxDecoration(
              //     //背景图片
              //     image: DecorationImage(
              //         image: NetworkImage(
              //   'https://unsplash.com/photos/MAUO2zOa8O4',
              // ))),
            ),
            ListTile(
              title: Text('用户反馈'),
              trailing: Icon(Icons.feedback),
            ),
            ListTile(
              title: Text('系统设置'),
              trailing: Icon(Icons.settings),
            ),
            ListTile(
              title: Text('我要发布'),
              trailing: Icon(Icons.send),
            ),
            Divider(),
            ListTile(
              title: Text('注销'),
              trailing: Icon(Icons.exit_to_app_sharp),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _controller,
        children: <Widget>[
          Homemainpage(),
          Discoverpage(),
          Searchpage(),
          Minepage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
            /** 切换导航栏标题 */
            changeNavigationBarTite(_currentIndex);
          });
        },
        /** 底部tabBar */
        items: [
          getBottomItem('首页', Icons.home, 0),
          getBottomItem('发现', Icons.camera_alt, 1),
          getBottomItem('搜索', Icons.search, 2),
          getBottomItem('我的', Icons.account_circle, 3),
        ],
      ),
    );
  }

  /** 封装底部tab Item*/
  BottomNavigationBarItem getBottomItem(
      String title, IconData icon, int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: _defaultColor,
        ),
        activeIcon: Icon(
          icon,
          color: _activeColor,
        ),
        label: title);
  }

  /** 切换导航栏标题 */
  changeNavigationBarTite(int index) {
    switch (index) {
      case 0:
        currentTitle = '首页';
        break;
      case 1:
        currentTitle = '发现';
        break;
      case 2:
        currentTitle = '搜索';
        break;
      case 3:
        currentTitle = '我的';
        break;
      default:
    }
  }

  /** 左侧抽屉按钮点击方法 */
  void leftBtnClickAction(BuildContext kContext) {}

  /** 导航栏按钮点击方法 */
  navigationBarButtonClickAction(BuildContext kContext) {
    print('导航按钮点击方法');
    //push一个新页面

    //第一种写法
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) {
    //       return Uimenupage();
    //     },
    //   ),
    // );

    //第二种写法
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return Uimenupage(titleStr: 'flutter控件大赏');
      }),
    );
  }
}
