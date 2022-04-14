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
        // actions: [
        //   IconButton(
        //       onPressed: navigationBarButtonClickAction,
        //       icon: Icon(Icons.arrow_back_ios)),
        // ],
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => navigationBarButtonClickAction(context),
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
