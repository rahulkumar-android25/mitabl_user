import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitabl_user/helper/app_config.dart' as config;
import 'package:mitabl_user/pages_cook/profile_cook/cubit/profile_cook_cubit.dart';
import 'package:mitabl_user/pages_cook/profile_cook/cubit/profile_cook_cubit.dart';

import '../../../helper/shape_custom.dart';

class HomePageCook extends StatefulWidget {
  const HomePageCook({Key? key}) : super(key: key);

  @override
  State<HomePageCook> createState() => _HomePageCookState();
}

class _HomePageCookState extends State<HomePageCook> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(
            left: config.AppConfig(context).appWidth(3),
            right: config.AppConfig(context).appWidth(3),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: config.AppConfig(context).appHeight(5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<ProfileCookCubit, ProfileCookState>(
                    builder: (context, state) {
                      return Text(
                        'Hello, ${ state.cookProfile!=null?state.cookProfile!.data!.firstName:''} ${ state.cookProfile!=null?state.cookProfile!.data!.lastName:''}',
                        style: GoogleFonts.gothicA1(
                            color: Theme.of(context).primaryColorDark,
                            fontSize: config.AppConfig(context).appWidth(6),
                            fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      );
                    },
                  ),
                  BlocBuilder<ProfileCookCubit, ProfileCookState>(
                    builder: (context, state) {
                      return CachedNetworkImage(
                        imageUrl:
                        state.cookProfile!=null?
                        "${GlobalConfiguration().getValue<String>('base_url')}/${state.cookProfile!.data!.avatar}":'',
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) => Container(
                            padding: EdgeInsets.all(
                                config.AppConfig(context).appWidth(3)),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                            )),
                        imageBuilder: (context, imageProvider) => Container(
                          height: config.AppConfig(context).appWidth(15),
                          width: config.AppConfig(context).appWidth(15),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: config.AppConfig(context).appHeight(4),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(config.AppConfig(context).appWidth(6)),
                width: config.AppConfig(context).appWidth(100),
                height: config.AppConfig(context).appHeight(18),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Earnings',
                          style: GoogleFonts.gothicA1(
                            fontSize: config.AppConfig(context).appWidth(4.5),
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                            height: config.AppConfig(context).appHeight(1)),
                        Text(
                          '\$ 500',
                          style: GoogleFonts.gothicA1(
                              fontSize: config.AppConfig(context).appWidth(8),
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      'assets/img/dollar.svg',
                      height: config.AppConfig(context).appHeight(12),
                      width: config.AppConfig(context).appHeight(12),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: config.AppConfig(context).appHeight(4),
              ),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.all(config.AppConfig(context).appWidth(6)),
                      width: config.AppConfig(context).appWidth(100),
                      height: config.AppConfig(context).appHeight(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Number Of Bookings',
                                style: GoogleFonts.gothicA1(
                                  fontSize:
                                      config.AppConfig(context).appWidth(4.5),
                                  color: Theme.of(context).primaryColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                  height:
                                      config.AppConfig(context).appHeight(1)),
                              Text(
                                '25',
                                style: GoogleFonts.gothicA1(
                                    fontSize:
                                        config.AppConfig(context).appWidth(8),
                                    color: Theme.of(context).primaryColorDark,
                                    fontWeight: FontWeight.w800),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          // Spacer(),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        child: CustomPaint(
                          painter: CustomShapeCook(),
                          child: Container(
                            padding: EdgeInsets.all(
                                config.AppConfig(context).appWidth(6)),
                            width: config.AppConfig(context).appWidth(30),
                            height: config.AppConfig(context).appHeight(18),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                            child: SvgPicture.asset(
                              'assets/img/booking.svg',
                              height: config.AppConfig(context).appHeight(12),
                              width: config.AppConfig(context).appHeight(12),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: config.AppConfig(context).appHeight(4),
              ),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.all(config.AppConfig(context).appWidth(6)),
                      width: config.AppConfig(context).appWidth(100),
                      height: config.AppConfig(context).appHeight(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Upcoming Bookings',
                                style: GoogleFonts.gothicA1(
                                  fontSize:
                                      config.AppConfig(context).appWidth(4.5),
                                  color: Theme.of(context).primaryColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                  height:
                                      config.AppConfig(context).appHeight(1)),
                              Text(
                                '10',
                                style: GoogleFonts.gothicA1(
                                    fontSize:
                                        config.AppConfig(context).appWidth(8),
                                    color: Theme.of(context).primaryColorDark,
                                    fontWeight: FontWeight.w800),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          // Spacer(),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        child: CustomPaint(
                          painter: CustomShapeCook(),
                          child: Container(
                            padding: EdgeInsets.all(
                                config.AppConfig(context).appWidth(6)),
                            width: config.AppConfig(context).appWidth(30),
                            height: config.AppConfig(context).appHeight(18),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                            child: SvgPicture.asset(
                              'assets/img/plate.svg',
                              height: config.AppConfig(context).appHeight(12),
                              width: config.AppConfig(context).appHeight(12),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
