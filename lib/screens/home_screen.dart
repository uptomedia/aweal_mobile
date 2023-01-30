import 'dart:async';
import 'dart:convert';
import 'package:academy_app/providers/bundles.dart';
import 'package:academy_app/widgets/bundle_grid.dart';
import '../generated/l10n.dart';
import '../providers/categories.dart';
import '../widgets/category_list_item.dart';
import '../widgets/course_grid.dart';
import '../providers/courses.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../widgets/course_list_item.dart';
import 'bundle_list_screen.dart';
import 'courses_screen.dart';
import '../models/common_functions.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;
  var _isLoading = false;
  var topCourses = [];
  var bundles = [];
  dynamic bundleStatus;

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    addonStatus();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  Future<void> addonStatus() async {
    var url = '$BASE_URL/api/addon_status?unique_identifier=course_bundle';
    final response = await http.get(Uri.parse(url));
    bundleStatus = json.decode(response.body)['status'];
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Courses>(context)
          .filterCourses('all', 'all', 'all', 'all', 'all').then((value) {
            _isLoading = false;
            topCourses = Provider.of<Courses>(context, listen: false).topItems;
            bundles = Provider.of<Bundles>(context, listen: false).bundleItems;

      } );
    // Provider.of<Courses>(context, listen: false).fetch
      setState(() {
        _isLoading = true;
      });

      // Provider.of<Courses>(context).fetchTopCourses().then((_) {
      //   setState(() {
      //     _isLoading = false;
      //     topCourses = Provider.of<Courses>(context, listen: false).topItems;
      //   });
      // });
      // Provider.of<Bundles>(context).fetchBundle(true).then((_) {
      //   setState(() {
      //     bundles = Provider.of<Bundles>(context, listen: false).bundleItems;
      //   });
      // });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> refreshList() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Courses>(context, listen: false).fetchTopCourses();

      setState(() {
        _isLoading = false;
        topCourses = Provider.of<Courses>(context, listen: false).topItems;
      });
    } catch (error) {
      const errorMsg = 'Could not refresh!';
      CommonFunctions.showErrorDialog(errorMsg, context);
    }

    return;
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
      onRefresh: refreshList,
      child: SingleChildScrollView(
        child:    Column(
          children: [
            // Container(
            //   width: double.infinity,
            //   padding: const EdgeInsets.symmetric(
            //       vertical: 10, horizontal: 20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: <Widget>[
            //         Text(
            //         S.of(context).topCourse,
            //         style: TextStyle(
            //           color: kRedColor,
            //             fontWeight: FontWeight.w600, fontSize: 18),
            //       ),
            //       MaterialButton(
            //         onPressed: () {
            //           Navigator.of(context).pushNamed(
            //             CoursesScreen.routeName,
            //             arguments: {
            //               'category_id': null,
            //               'seacrh_query': null,
            //               'type': CoursesPageData.All,
            //             },
            //           );
            //         },
            //         padding: const EdgeInsets.all(0),
            //         child: Row(
            //           children:   [
            //             Text(S.of(context).allCourses),
            //
            //             Icon(
            //               Icons.arrow_forward_ios_rounded,
            //               color: iLongArrowRightColor,
            //               size: 18,
            //             ),
            //           ],
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            // _isLoading
            //     ? const Center(
            //         child: CircularProgressIndicator(),
            //       )
            //     : Container(
            //         margin: const EdgeInsets.symmetric(vertical: 0.0),
            //         padding: const EdgeInsets.symmetric(horizontal: 20),
            //         height: 258.0,
            //         child: ListView.builder(
            //           scrollDirection: Axis.horizontal,
            //
            //           itemBuilder: (ctx, index) {
            //             return CourseGrid(
            //               id: topCourses[index].id,
            //               title: topCourses[index].title,
            //               thumbnail: topCourses[index].thumbnail,
            //               instructorName: topCourses[index].instructor,
            //               instructorImage:
            //                   topCourses[index].instructorImage,
            //               rating: topCourses[index].rating,
            //               price: topCourses[index].price,
            //             );
            //           },
            //           itemCount: topCourses.length,
            //         ),
            //       ),
            // if (bundleStatus == true)
            //   Column(
            //     children: [
            //       Container(
            //         width: double.infinity,
            //         padding: const EdgeInsets.symmetric(
            //             vertical: 10, horizontal: 20),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: <Widget>[
            //               Text(
            //               S.of(context).bundles,
            //               style: TextStyle(
            //                   color: kRedColor,
            //
            //                   fontWeight: FontWeight.w600,
            //                   fontSize: 18),
            //             ),
            //             MaterialButton(
            //               onPressed: () {
            //                 Navigator.of(context).pushNamed(
            //                   BundleListScreen.routeName,
            //                 );
            //               },
            //               padding: const EdgeInsets.all(0),
            //               child: Row(
            //                 children:   [
            //                   Text(S.of(context).allBundles),
            //                   Icon(
            //                     Icons.arrow_forward_ios_rounded,
            //                     color: iLongArrowRightColor,
            //                     size: 18,
            //                   ),
            //                 ],
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //       Container(
            //         margin: const EdgeInsets.symmetric(vertical: 0.0),
            //         padding: const EdgeInsets.symmetric(horizontal: 20),
            //         height: 240.0,
            //         child: ListView.builder(
            //           scrollDirection: Axis.horizontal,
            //           itemBuilder: (ctx, index) {
            //             return BundleGrid(
            //               id: bundles[index].id,
            //               title: bundles[index].title,
            //               banner:
            //                   // ignore: prefer_interpolation_to_compose_strings
            //                   '$BASE_URL/uploads/course_bundle/banner/' +
            //                       bundles[index].banner,
            //               averageRating: bundles[index].averageRating,
            //               numberOfRatings:
            //                   bundles[index].numberOfRatings,
            //               price: bundles[index].price,
            //             );
            //           },
            //           itemCount: bundles.length,
            //         ),
            //       ),
            //     ],
            //   ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    S.of(context).courses,
                    style: TextStyle(
                        color: kRedColor,

                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        CoursesScreen.routeName,
                        arguments: {
                          'category_id': null,
                          'seacrh_query': null,
                          'type': CoursesPageData.All,
                        },
                      );
                    },
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      children:   [
                        Text(S.of(context).allCourses),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: iLongArrowRightColor,
                          size: 18,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            Consumer<Courses>(
                builder: (context, courseData, child) =>
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          return Center(
                            child: CourseListItem(
                              id: courseData.items[index].id!.toInt(),
                              title: courseData.items[index].title.toString(),
                              thumbnail: courseData.items[index].thumbnail.toString(),
                              rating: courseData.items[index].rating!.toInt(),
                              price: courseData.items[index].price.toString(),
                              instructor: courseData.items[index].instructor.toString(),
                              noOfRating:
                              courseData.items[index].totalNumberRating!.toInt(),
                            ),
                          );
                        },
                        itemCount: courseData.items.length<4?courseData.items.length:4,
                      ),
                    )
            )

            // Consumer<Categories>(
            //   builder: (context, myCourseData, child) => Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 20),
            //     child: ListView.builder(
            //       shrinkWrap: true,
            //       physics: const NeverScrollableScrollPhysics(),
            //       itemBuilder: (ctx, index) {
            //         return CategoryListItem(
            //           id: myCourseData.items[index].id,
            //           title: myCourseData.items[index].title,
            //           thumbnail: myCourseData.items[index].thumbnail,
            //           numberOfSubCategories: myCourseData
            //               .items[index].numberOfSubCategories,
            //         );
            //       },
            //       itemCount: myCourseData.items.length,
            //     ),
            //   ),
            // ),
          ],
        )
    //     FutureBuilder(
    //       future:
    //       Provider.of<Courses>(context)
    //           .filterCourses('all', 'all', 'all', 'all', 'all'),
    //       // Provider.of<Courses>(context, listen: false).fetchCoursesByCategory(null)
    //       //     Provider.of<Categories>(context, listen: false).fetchCategories(),
    //       builder: (ctx, dataSnapshot) {
    //         if (dataSnapshot.connectionState == ConnectionState.waiting) {
    //           return SizedBox(
    //             height: MediaQuery.of(context).size.height * .5,
    //             child: const Center(
    //               child: CircularProgressIndicator(),
    //             ),
    //           );
    //         } else {
    //           if (dataSnapshot.error != null) {
    //             //error
    //             return _connectionStatus == ConnectivityResult.none
    //                 ? Center(
    //                     child: Column(
    //                       children: [
    //                         SizedBox(
    //                             height:
    //                                 MediaQuery.of(context).size.height * .15),
    //                         Image.asset(
    //                           "assets/images/no_connection.png",
    //                           height: MediaQuery.of(context).size.height * .35,
    //                         ),
    //                           Padding(
    //                           padding: EdgeInsets.all(4.0),
    //                           child: Text(S.of(context).thereIsNoInternetConnection),
    //                         ),
    //                           Padding(
    //                           padding: EdgeInsets.all(4.0),
    //                           child:
    //                               Text(S.of(context).pleaseCheckYourInternetConnection),
    //                         ),
    //                       ],
    //                     ),
    //                   )
    //                 : const Center(
    //                     child: Text('Error Occured'),
    //                     // child: Text(dataSnapshot.error.toString()),
    //                   );
    //           } else {
    //             return
    //
    //               Column(
    //               children: [
    //                 // Container(
    //                 //   width: double.infinity,
    //                 //   padding: const EdgeInsets.symmetric(
    //                 //       vertical: 10, horizontal: 20),
    //                 //   child: Row(
    //                 //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 //     children: <Widget>[
    //                 //         Text(
    //                 //         S.of(context).topCourse,
    //                 //         style: TextStyle(
    //                 //           color: kRedColor,
    //                 //             fontWeight: FontWeight.w600, fontSize: 18),
    //                 //       ),
    //                 //       MaterialButton(
    //                 //         onPressed: () {
    //                 //           Navigator.of(context).pushNamed(
    //                 //             CoursesScreen.routeName,
    //                 //             arguments: {
    //                 //               'category_id': null,
    //                 //               'seacrh_query': null,
    //                 //               'type': CoursesPageData.All,
    //                 //             },
    //                 //           );
    //                 //         },
    //                 //         padding: const EdgeInsets.all(0),
    //                 //         child: Row(
    //                 //           children:   [
    //                 //             Text(S.of(context).allCourses),
    //                 //
    //                 //             Icon(
    //                 //               Icons.arrow_forward_ios_rounded,
    //                 //               color: iLongArrowRightColor,
    //                 //               size: 18,
    //                 //             ),
    //                 //           ],
    //                 //         ),
    //                 //       )
    //                 //     ],
    //                 //   ),
    //                 // ),
    //                 // _isLoading
    //                 //     ? const Center(
    //                 //         child: CircularProgressIndicator(),
    //                 //       )
    //                 //     : Container(
    //                 //         margin: const EdgeInsets.symmetric(vertical: 0.0),
    //                 //         padding: const EdgeInsets.symmetric(horizontal: 20),
    //                 //         height: 258.0,
    //                 //         child: ListView.builder(
    //                 //           scrollDirection: Axis.horizontal,
    //                 //
    //                 //           itemBuilder: (ctx, index) {
    //                 //             return CourseGrid(
    //                 //               id: topCourses[index].id,
    //                 //               title: topCourses[index].title,
    //                 //               thumbnail: topCourses[index].thumbnail,
    //                 //               instructorName: topCourses[index].instructor,
    //                 //               instructorImage:
    //                 //                   topCourses[index].instructorImage,
    //                 //               rating: topCourses[index].rating,
    //                 //               price: topCourses[index].price,
    //                 //             );
    //                 //           },
    //                 //           itemCount: topCourses.length,
    //                 //         ),
    //                 //       ),
    //                 // if (bundleStatus == true)
    //                 //   Column(
    //                 //     children: [
    //                 //       Container(
    //                 //         width: double.infinity,
    //                 //         padding: const EdgeInsets.symmetric(
    //                 //             vertical: 10, horizontal: 20),
    //                 //         child: Row(
    //                 //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 //           children: <Widget>[
    //                 //               Text(
    //                 //               S.of(context).bundles,
    //                 //               style: TextStyle(
    //                 //                   color: kRedColor,
    //                 //
    //                 //                   fontWeight: FontWeight.w600,
    //                 //                   fontSize: 18),
    //                 //             ),
    //                 //             MaterialButton(
    //                 //               onPressed: () {
    //                 //                 Navigator.of(context).pushNamed(
    //                 //                   BundleListScreen.routeName,
    //                 //                 );
    //                 //               },
    //                 //               padding: const EdgeInsets.all(0),
    //                 //               child: Row(
    //                 //                 children:   [
    //                 //                   Text(S.of(context).allBundles),
    //                 //                   Icon(
    //                 //                     Icons.arrow_forward_ios_rounded,
    //                 //                     color: iLongArrowRightColor,
    //                 //                     size: 18,
    //                 //                   ),
    //                 //                 ],
    //                 //               ),
    //                 //             )
    //                 //           ],
    //                 //         ),
    //                 //       ),
    //                 //       Container(
    //                 //         margin: const EdgeInsets.symmetric(vertical: 0.0),
    //                 //         padding: const EdgeInsets.symmetric(horizontal: 20),
    //                 //         height: 240.0,
    //                 //         child: ListView.builder(
    //                 //           scrollDirection: Axis.horizontal,
    //                 //           itemBuilder: (ctx, index) {
    //                 //             return BundleGrid(
    //                 //               id: bundles[index].id,
    //                 //               title: bundles[index].title,
    //                 //               banner:
    //                 //                   // ignore: prefer_interpolation_to_compose_strings
    //                 //                   '$BASE_URL/uploads/course_bundle/banner/' +
    //                 //                       bundles[index].banner,
    //                 //               averageRating: bundles[index].averageRating,
    //                 //               numberOfRatings:
    //                 //                   bundles[index].numberOfRatings,
    //                 //               price: bundles[index].price,
    //                 //             );
    //                 //           },
    //                 //           itemCount: bundles.length,
    //                 //         ),
    //                 //       ),
    //                 //     ],
    //                 //   ),
    //                 Container(
    //                   width: double.infinity,
    //                   padding: const EdgeInsets.symmetric(
    //                       vertical: 10, horizontal: 20),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: <Widget>[
    //                         Text(
    //                         S.of(context).courses,
    //                         style: TextStyle(
    //                             color: kRedColor,
    //
    //                             fontWeight: FontWeight.w600, fontSize: 18),
    //                       ),
    //                       MaterialButton(
    //                         onPressed: () {
    //                           Navigator.of(context).pushNamed(
    //                             CoursesScreen.routeName,
    //                             arguments: {
    //                               'category_id': null,
    //                               'seacrh_query': null,
    //                               'type': CoursesPageData.All,
    //                             },
    //                           );
    //                         },
    //                         padding: const EdgeInsets.all(0),
    //                         child: Row(
    //                           children:   [
    //                             Text(S.of(context).allCourses),
    //                             Icon(
    //                               Icons.arrow_forward_ios_rounded,
    //                               color: iLongArrowRightColor,
    //                               size: 18,
    //                             ),
    //                           ],
    //                         ),
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //
    //                 Consumer<Courses>(
    //                   builder: (context, courseData, child) =>
    //                 Padding(
    //                   padding: const EdgeInsets.symmetric(horizontal: 15),
    //                   child: ListView.builder(
    //                     shrinkWrap: true,
    //                     physics: const NeverScrollableScrollPhysics(),
    //                     itemBuilder: (ctx, index) {
    //                       return Center(
    //                         child: CourseListItem(
    //                           id: courseData.items[index].id!.toInt(),
    //                           title: courseData.items[index].title.toString(),
    //                           thumbnail: courseData.items[index].thumbnail.toString(),
    //                           rating: courseData.items[index].rating!.toInt(),
    //                           price: courseData.items[index].price.toString(),
    //                           instructor: courseData.items[index].instructor.toString(),
    //                           noOfRating:
    //                           courseData.items[index].totalNumberRating!.toInt(),
    //                         ),
    //                       );
    //                     },
    //                     itemCount: courseData.items.length<4?courseData.items.length:4,
    //                   ),
    //                 )
    // )
    //
    //                 // Consumer<Categories>(
    //                 //   builder: (context, myCourseData, child) => Padding(
    //                 //     padding: const EdgeInsets.symmetric(horizontal: 20),
    //                 //     child: ListView.builder(
    //                 //       shrinkWrap: true,
    //                 //       physics: const NeverScrollableScrollPhysics(),
    //                 //       itemBuilder: (ctx, index) {
    //                 //         return CategoryListItem(
    //                 //           id: myCourseData.items[index].id,
    //                 //           title: myCourseData.items[index].title,
    //                 //           thumbnail: myCourseData.items[index].thumbnail,
    //                 //           numberOfSubCategories: myCourseData
    //                 //               .items[index].numberOfSubCategories,
    //                 //         );
    //                 //       },
    //                 //       itemCount: myCourseData.items.length,
    //                 //     ),
    //                 //   ),
    //                 // ),
    //               ],
    //             );
    //           }
    //         }
    //       },
    //     ),
      ),
    );
  }
}
