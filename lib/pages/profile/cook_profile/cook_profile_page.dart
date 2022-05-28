import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mitabl_user/helper/app_config.dart' as config;
import 'package:mitabl_user/helper/appconstants.dart';
import 'package:mitabl_user/helper/helper.dart';
import 'package:mitabl_user/helper/route_arguement.dart';
import 'package:mitabl_user/pages/login/cubit/login_cubit.dart';
import 'package:mitabl_user/repos/authentication_repository.dart';

import 'cubit/cook_profile_cubit.dart';

class CookProfilePage extends StatefulWidget {
  const CookProfilePage({
    Key? key,
  }) : super(key: key);

  static Route route({RouteArguments? routeArguments}) {
    return MaterialPageRoute<void>(
        builder: (_) => BlocProvider(
              create: (context) => CookProfileCubit(
                  context.read<AuthenticationRepository>(), routeArguments),
              child: const CookProfilePage(),
            ));
    // );
  }

  @override
  State<StatefulWidget> createState() => _OTPPage();
}

class _OTPPage extends State<CookProfilePage> with TickerProviderStateMixin {
  _OTPPage();

  PickedFile? _imageFile;

  @override
  void initState() {
    super.initState();
  }

  TextEditingController? mobileNoTextEditor = TextEditingController();
  TextEditingController? passwordTextEditor = TextEditingController();
  ScrollController? controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: BlocConsumer<CookProfileCubit, CookProfileState>(
          builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          color: Colors.white,
          height: config.AppConfig(context).appHeight(100),
          width: config.AppConfig(context).appWidth(100),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: config.AppConfig(context).appHeight(2),
                  left: config.AppConfig(context).appWidth(5),
                  right: config.AppConfig(context).appWidth(5)),
              child: Container(
                alignment: Alignment.center,
                width: config.AppConfig(context).appWidth(90),
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: config.AppConfig(context).appHeight(2),
                          ),
                          Text(
                            'Your account has been created',
                            style: GoogleFonts.gothicA1(
                                color: Theme.of(context).primaryColorDark,
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    config.AppConfig(context).appWidth(5.5)),
                          ),
                          SizedBox(
                            height: config.AppConfig(context).appHeight(1),
                          ),
                          Text(
                            'Please enter mikitchn details to continue',
                            style: GoogleFonts.gothicA1(
                                color: Theme.of(context).primaryColorDark,
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    config.AppConfig(context).appWidth(4)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: config.AppConfig(context).appHeight(2),
                      ),
                      state.pathFiles.isNotEmpty
                          ? Container(
                              height: config.AppConfig(context).appHeight(20),
                              child: ListView.separated(
                                controller: controller,
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width:
                                        config.AppConfig(context).appWidth(2),
                                  );
                                },
                                shrinkWrap: true,
                                // reverse: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        height: config.AppConfig(context)
                                            .appHeight(20),
                                        width: config.AppConfig(context)
                                            .appWidth(85),
                                        decoration: BoxDecoration(
                                          color: config.AppColors()
                                              .textFieldBackgroundColor(1),
                                          borderRadius: BorderRadius.circular(
                                              config.AppConfig(context)
                                                  .appWidth(5)),
                                        ),
                                        alignment: Alignment.center,
                                        child: Image.file(
                                            File(state.pathFiles[index])),

                                        /*Icon(
                                    Icons.photo_outlined,
                                    size:
                                        config.AppConfig(context).appWidth(30),
                                    color: Colors.grey,
                                  ),*/
                                      ),
                                      Positioned(
                                          right: 6,
                                          top: 6,
                                          child: InkWell(
                                            onTap: () {
                                              context
                                                  .read<CookProfileCubit>()
                                                  .onDeleteImage(
                                                      path: state
                                                          .pathFiles[index]);
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                              size: config.AppConfig(context)
                                                  .appWidth(6),
                                            ),
                                          )),
                                    ],
                                  );
                                },
                                itemCount: state.pathFiles.length,
                              ),
                            )
                          : Container(
                              height: config.AppConfig(context).appHeight(20),
                              decoration: BoxDecoration(
                                  color: config.AppColors()
                                      .textFieldBackgroundColor(1),
                                  borderRadius: BorderRadius.circular(
                                      config.AppConfig(context).appWidth(5))),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.photo_outlined,
                                size: config.AppConfig(context).appWidth(30),
                                color: Colors.grey,
                              ),
                            ),
                      SizedBox(
                        height: config.AppConfig(context).appHeight(2),
                      ),
                      _UploadButton(
                        loginForm: this,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: config.AppConfig(context).appHeight(2),
                            ),
                            _KitchenName(
                              loginForm: this,
                            ),
                            SizedBox(
                              height: config.AppConfig(context).appHeight(2),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.zero,
                              child: TextFormField(
                                // controller: widget.loginForm!.mobileNoTextEditor,
                                style: TextStyle(color: Colors.black),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                maxLength: 55,
                                onChanged: (text) {
                                  context
                                      .read<CookProfileCubit>()
                                      .onAddressChanged(value: text);
                                },
                                decoration: InputDecoration(
                                  counterText: '',
                                  errorText: state.address!.invalid
                                      ? 'Please enter a valid address'
                                      : null,

                                  hintStyle: GoogleFonts.gothicA1(
                                      color: Theme.of(context).hintColor,
                                      fontSize: config.AppConfig(context)
                                          .appWidth(4)),
                                  // labelText: 'Mobile Number',
                                  hintText: 'Address',
                                  contentPadding: EdgeInsets.all(
                                      config.AppConfig(context).appWidth(2)),
                                  fillColor: config.AppColors()
                                      .textFieldBackgroundColor(1),
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: config.AppConfig(context).appHeight(2),
                            ),
                            _PhoneNo(
                              loginForm: this,
                            ),
                            SizedBox(
                              height: config.AppConfig(context).appHeight(2),
                            ),
                            _NoOfSeats(
                              loginForm: this,
                            ),
                            SizedBox(
                              height: config.AppConfig(context).appHeight(2),
                            ),
                            _Timing(loginForm: this),
                            SizedBox(
                              height: config.AppConfig(context).appHeight(3),
                            ),
                            _LoginButton(
                              loginForm: this,
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }, listener: (context, state) async {
        if (state.statusApi!.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${state.serverMessage}')));
        }
      }),
    );
  }
}

class _Timing extends StatefulWidget {
  final _OTPPage? loginForm;

  const _Timing({Key? key, this.loginForm}) : super(key: key);

  @override
  State<_Timing> createState() => _TimingState();
}

class _TimingState extends State<_Timing> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      print('constraibtWidth ${constraint.maxWidth}');
      return BlocBuilder<CookProfileCubit, CookProfileState>(
          builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.zero,
          child: TextFormField(
            readOnly: true,
            controller: widget.loginForm!.mobileNoTextEditor,
            style: TextStyle(color: Colors.black),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            maxLength: 55,
            onChanged: (text) {
              // context.read<SignUpCubit>().onEmailChanged(value: text);
            },
            decoration: InputDecoration(
              counterText: '',
              // errorText:
              //     state.email!.invalid ? 'Please enter a valid email id' : null,

              suffixIcon: Icon(
                Icons.access_time_rounded,
                color: Theme.of(context).primaryColor,
              ),
              hintStyle: GoogleFonts.gothicA1(
                  color: Theme.of(context).hintColor,
                  fontSize: config.AppConfig(context).appWidth(4)),
              // labelText: 'Mobile Number',
              hintText: 'Timings',
              contentPadding:
                  EdgeInsets.all(config.AppConfig(context).appWidth(2)),
              fillColor: config.AppColors().textFieldBackgroundColor(1),
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              border: InputBorder.none,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      });
    });
  }
}

class _KitchenName extends StatefulWidget {
  final _OTPPage? loginForm;

  const _KitchenName({Key? key, this.loginForm}) : super(key: key);

  @override
  State<_KitchenName> createState() => _KitchenNameState();
}

class _KitchenNameState extends State<_KitchenName> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CookProfileCubit, CookProfileState>(
        builder: (context, state) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        child: TextFormField(
          // controller: widget.loginForm!.mobileNoTextEditor,
          style: TextStyle(color: Colors.black),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          maxLength: 15,
          onChanged: (text) {
            context.read<CookProfileCubit>().onKitchnNameChanged(value: text);
          },
          decoration: InputDecoration(
            counterText: '',
            errorText:
                state.nameKitchn!.invalid ? 'Please enter a valid name' : null,

            hintStyle: GoogleFonts.gothicA1(
                color: Theme.of(context).hintColor,
                fontSize: config.AppConfig(context).appWidth(4)),
            // labelText: 'Mobile Number',
            hintText: 'mikitchn name',
            contentPadding:
                EdgeInsets.all(config.AppConfig(context).appWidth(2)),
            fillColor: config.AppColors().textFieldBackgroundColor(1),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            border: InputBorder.none,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _NoOfSeats extends StatefulWidget {
  final _OTPPage? loginForm;

  const _NoOfSeats({Key? key, this.loginForm}) : super(key: key);

  @override
  State<_NoOfSeats> createState() => _NoOfSeatsState();
}

class _NoOfSeatsState extends State<_NoOfSeats> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CookProfileCubit, CookProfileState>(
        builder: (context, state) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        child: TextFormField(
          // controller: widget.loginForm!.mobileNoTextEditor,
          style: TextStyle(color: Colors.black),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          maxLength: 10,
          onChanged: (text) {
            context.read<CookProfileCubit>().onSeatChanged(value: text);
          },
          decoration: InputDecoration(
            counterText: '',
            errorText:
                state.noOfSeats.invalid ? 'Please enter a valid seats' : null,
            hintStyle: GoogleFonts.gothicA1(
                color: Theme.of(context).hintColor,
                fontSize: config.AppConfig(context).appWidth(4)),
            hintText: 'No. of seats',
            contentPadding:
                EdgeInsets.all(config.AppConfig(context).appWidth(2)),
            fillColor: config.AppColors().textFieldBackgroundColor(1),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            border: InputBorder.none,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _PhoneNo extends StatefulWidget {
  final _OTPPage? loginForm;

  const _PhoneNo({Key? key, this.loginForm}) : super(key: key);

  @override
  State<_PhoneNo> createState() => _PhoneNoState();
}

class _PhoneNoState extends State<_PhoneNo> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CookProfileCubit, CookProfileState>(
        builder: (context, state) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        child: TextFormField(
          style: TextStyle(color: Colors.black),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
          maxLength: 15,
          onChanged: (text) {
            context.read<CookProfileCubit>().onPhoneChanged(value: text);
          },
          decoration: InputDecoration(
            counterText: '',
            errorText:
                state.phone.invalid ? 'Please enter a valid phone no' : null,

            hintStyle: GoogleFonts.gothicA1(
                color: Theme.of(context).hintColor,
                fontSize: config.AppConfig(context).appWidth(4)),
            // labelText: 'Mobile Number',
            hintText: 'Phone',
            contentPadding:
                EdgeInsets.all(config.AppConfig(context).appWidth(2)),
            fillColor: config.AppColors().textFieldBackgroundColor(1),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            border: InputBorder.none,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _UploadButton extends StatefulWidget {
  const _UploadButton({Key? key, this.loginForm}) : super(key: key);

  final _OTPPage? loginForm;

  @override
  _UploadbuttonState createState() => _UploadbuttonState();
}

class _UploadbuttonState extends State<_UploadButton> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CookProfileCubit, CookProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor,
                  ])),
          child: MaterialButton(
              child: Text(
                'Upload Photos',
                style: GoogleFonts.gothicA1(
                    fontSize: config.AppConfig(context).appWidth(3.5),
                    color: Colors.white),
              ),
              minWidth: config.AppConfig(context).appWidth(100),
              height: 50.0,
              onPressed: () {
                // _pickImage();

                if (state.pathFiles.length <= 3) {
                  showDialog<bool>(
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Add image',
                                style: GoogleFonts.gothicA1(
                                    color: Colors.black,
                                    fontSize:
                                        config.AppConfig(context).appWidth(5)),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  MaterialButton(
                                    color: Theme.of(context).primaryColor,
                                    child: const Text(
                                      "Gallery",
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                      navigatorKey.currentState!.pop(false);
                                    },
                                  ),
                                  MaterialButton(
                                    color: Theme.of(context).primaryColor,
                                    child: const Text(
                                      "Camera",
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                      navigatorKey.currentState!.pop(true);
                                    },
                                  )
                                ],
                              ),
                            );
                          },
                          context: context)
                      .then((value) {
                    if (value != null) {
                      if (value) {
                        //Get from camera
                        _openCamera(context);
                      } else {
                        //Get from gallery
                        _openGallery(context);
                      }
                    }
                  });
                } else {
                  Helper.showToast('Photos limit reached.');
                }
              }),
        );
      },
    );
  }

  void _openGallery(BuildContext context) async {
    var picture = await ImagePicker().pickImage(source: ImageSource.gallery);

    try {
      if (picture!.path != null) {
        print('path ${picture.path}');
        context.read<CookProfileCubit>().onNewImageAdded(path: picture.path);
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
          widget.loginForm!.controller!
              .jumpTo(widget.loginForm!.controller!.position.maxScrollExtent);
        });
      } else {
        Helper.showToast('No image selected.');
      }
    } catch (e) {
      Helper.showToast('No image selected.');
    }
  }

  Future<void> _openCamera(BuildContext context) async {
    var picture = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);

    try {
      if (picture!.path != null) {
        print('path ${picture.path}');
        context.read<CookProfileCubit>().onNewImageAdded(path: picture.path);
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
          widget.loginForm!.controller!
              .jumpTo(widget.loginForm!.controller!.position.maxScrollExtent);
        });
        // widget.loginForm!.controller!.animateTo(context.read<CookProfileCubit>().state.pathFiles.length.toDouble(), duration: Duration(milliseconds: 100 ), curve: Curves.ease);

      } else {
        Helper.showToast('No image captured.');
      }
    } catch (e) {
      Helper.showToast('No image captured.');
    }
  }
}

class _LoginButton extends StatelessWidget {
  final _OTPPage? loginForm;

  const _LoginButton({Key? key, this.loginForm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CookProfileCubit, CookProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: state.status!.isValidated
                    ? [
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColor,
                      ]
                    : [
                        Theme.of(context).primaryColorLight,
                        Theme.of(context).primaryColorLight,
                      ],
              )),
          child: MaterialButton(
              child: state.statusApi!.isSubmissionInProgress
                  ? const Center(
                      child: CupertinoActivityIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      'SUBMIT',
                      style: GoogleFonts.gothicA1(
                          fontSize: config.AppConfig(context).appWidth(3.5),
                          color: Colors.white),
                    ),
              minWidth: config.AppConfig(context).appWidth(100),
              height: 50.0,
              onPressed: () {
                //
                // navigatorKey.currentState!.popAndPushNamed('/OTPPage');
                // return;
                if (state.status!.isValidated) {
                  context.read<CookProfileCubit>().onKitchnUpload();
                }
              }),
        );
      },
    );
  }
}
