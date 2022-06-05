import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitabl_user/helper/app_config.dart' as config;
import 'package:mitabl_user/pages_cook/profile_cook/view/mikitchn_view.dart';
import 'package:mitabl_user/pages_cook/profile_cook/view/personal_view.dart';

class ProfileCookPage extends StatefulWidget {
  const ProfileCookPage({Key? key}) : super(key: key);

  @override
  State<ProfileCookPage> createState() => _ProfileCookPageState();
}

class _ProfileCookPageState extends State<ProfileCookPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          left: config.AppConfig(context).appWidth(3),
          right: config.AppConfig(context).appWidth(3),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: config.AppConfig(context).appHeight(5),
            ),
            Text(
              'Profile',
              style: GoogleFonts.gothicA1(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: config.AppConfig(context).appWidth(5),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: config.AppConfig(context).appHeight(3),
            ),
            DefaultTabController(
                length: 2,
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Theme.of(context).primaryColor,
                  tabs: [
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: config.AppConfig(context).appWidth(1)),
                      child: Container(
                        width: config.AppConfig(context).appWidth(35),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                            left: config.AppConfig(context).appWidth(3),
                            right: config.AppConfig(context).appWidth(3),
                            bottom: config.AppConfig(context).appWidth(1),
                            top: config.AppConfig(context).appWidth(1)),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            )),
                        child: Text(
                          'Personal View',
                          style: GoogleFonts.gothicA1(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: config.AppConfig(context).appWidth(1)),
                      child: Container(
                        width: config.AppConfig(context).appWidth(35),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                            left: config.AppConfig(context).appWidth(3),
                            right: config.AppConfig(context).appWidth(3),
                            bottom: config.AppConfig(context).appWidth(1),
                            top: config.AppConfig(context).appWidth(1)),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            )),
                        child: Text(
                          'mikitchn',
                          style: GoogleFonts.gothicA1(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )),
            Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: [PersonalTabView(), MikitchnTabView()]),
            )
          ],
        ),
      ),
    );
  }
}
