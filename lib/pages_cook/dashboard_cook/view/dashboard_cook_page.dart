import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mitabl_user/helper/app_config.dart' as config;
import 'package:mitabl_user/pages_cook/home_page/view/home_cook_page.dart';
import 'package:mitabl_user/pages_cook/profile_cook/cubit/profile_cook_cubit.dart';
import 'package:mitabl_user/pages_cook/profile_cook/view/profile_cook_page.dart';

import '../../../pages/profile_signup_cook/cook_profile/cubit/cook_profile_cubit.dart';
import '../cubit/dashboard_cook_cubit.dart';

class DashBoardCookPage extends StatefulWidget {
  const DashBoardCookPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => DashBoardCookPage());
  }

  @override
  State<DashBoardCookPage> createState() => _DashBoardCookPageState();
}

class _DashBoardCookPageState extends State<DashBoardCookPage> {
  List<Widget>? pagesBottom = [
    HomePageCook(),
    Text('Menu'),
    Text('Requests'),
    ProfileCookPage(),
  ];

  @override
  void initState() {
    context.read<ProfileCookCubit>().getCookProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCookCubit, DashboardCookState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: Center(
              child: pagesBottom!.elementAt(state.selectedIndex!),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/img/menu.svg',
                    height: config.AppConfig(context).appHeight(3),
                    width: config.AppConfig(context).appHeight(3),
                    color: state.selectedIndex == 1
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColorDark,
                  ),
                  label: 'Menu',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: 'Requests',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: state.selectedIndex!,
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).primaryColorDark,
              unselectedLabelStyle: TextStyle(color: Colors.black),
              selectedLabelStyle: TextStyle(color: Colors.black),
              onTap: (i) {
                context.read<DashboardCookCubit>().onTabChange(index: i);
              },
            ));
      },
    );
  }
}
