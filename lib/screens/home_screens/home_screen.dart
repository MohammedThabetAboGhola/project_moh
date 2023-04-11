import 'package:flutter/material.dart';
import 'package:project_moh/api/api_reqeustes.dart';
import 'package:project_moh/config/MyColors.dart';
import 'package:project_moh/constants/constants.dart';
import 'package:project_moh/screens/home_screens/tabs/tab1.dart';
import 'package:project_moh/screens/home_screens/tabs/tab2.dart';

import '../../widgets/drawer_item.dart';
import '../../widgets/user_avatar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<Widget> _screens = [
    const TabBar1(),
    const TabBar2(),
  ];

  @override
  void initState() {
    super.initState();
    getDate();
  }

  late final TabController _tabController =
      TabController(length: _screens.length, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: MyColors.blue,
              title: const Text(
                "الواجهة الرئيسية",
                style: TextStyle(
                  fontFamily: 'Cairo',
                  color: MyColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: Colors.white,
                tabs: const [
                  Tab(
                    child: Text(
                      "البحث حسب المعدل",
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: MyColors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "عرض كافة التخصصات",
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: MyColors.white),
                    ),
                  ),
                ],
              )),
          drawer: Drawer(
            width: 275,
            backgroundColor: Colors.white70,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(40)),
            ),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x3D000000),
                        spreadRadius: 30,
                        blurRadius: 20)
                  ]),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, MyConstants.HOME_SCREEN);
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.arrow_back,
                              color: MyColors.orange,
                              size: 25,
                            ),
                            SizedBox(
                              width: 56,
                            ),
                            Text(
                              'الإعدادات',
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: MyColors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: const [
                          UserAvatar(imageName: 'on1.png'),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            '\t Mohammed \n \t\t Thabet',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: MyColors.blue,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      DrawerItem(
                        title: 'المنح والاعفاءات',
                        icon: Icons.book_sharp,
                        routName: MyConstants.DETAILS_SCREEN_M,
                      ),
                      DrawerItem(
                        title: 'البحث الاجتماعي',
                        icon: Icons.ac_unit,
                        routName: MyConstants.SOCIAL_SEARCH,
                      ),
                      DrawerItem(
                        title: 'مفضلتي',
                        icon: Icons.favorite,
                        routName: MyConstants.Favorite,
                      ),
                      DrawerItem(
                        title: 'حول التطبيق',
                        icon: Icons.info,
                        routName: MyConstants.HOME_SCREEN,
                      ),
                      const Divider(
                        height: 35,
                        color: MyColors.white,
                        thickness: 1,
                      ),
                    ]),
                    DrawerItem(
                      title: 'تسجيل الخروج',
                      icon: Icons.logout,
                      routName: MyConstants.LOGIN_SCREEN,
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(controller: _tabController, children: _screens)),
    );
  }

  Future getDate () async {
     String res = await ApiRequests().getData();
     print(res);
  }
}
