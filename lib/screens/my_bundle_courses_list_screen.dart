// ignore_for_file: deprecated_member_use

import 'package:academy_app/providers/bundles.dart';
import 'package:academy_app/providers/shared_pref_helper.dart';
import 'package:academy_app/widgets/app_bar_two.dart';
import 'package:academy_app/widgets/my_bundle_course_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../generated/l10n.dart';

class MyBundleCoursesListScreen extends StatefulWidget {
  static const routeName = '/my-bundle-course-list';
  const MyBundleCoursesListScreen({Key? key}) : super(key: key);

  @override
  State<MyBundleCoursesListScreen> createState() =>
      _MyBundleCoursesListScreenState();
}

class _MyBundleCoursesListScreenState extends State<MyBundleCoursesListScreen> {
  var _isInit = true;
  var _isLoading = false;
  var bundles = [];
  dynamic bundleId;
  dynamic title;
  dynamic subscriptionStatus;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

      bundleId = routeArgs['id'] as int;
      title = routeArgs['title'];
      subscriptionStatus = routeArgs['subscription_status'];
      Provider.of<Bundles>(context).fetchBundleDetailById(bundleId).then((_) {
        setState(() {
          _isLoading = false;
          bundles =
              Provider.of<Bundles>(context, listen: false).getBundleDetail;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _launchURL(String url) async => await canLaunch(url)
      ? await launch(url, forceSafariVC: false)
      : throw 'Could not launch $url';

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarTwo(),
      backgroundColor: kBackgroundColor,
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  if (subscriptionStatus != 'valid')
                    Container(
                      color: kRedColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        children: [
                            Text(
                              S.of(context).yourSubscriptionHasBeenExpiredToContinuePleaseRenewTheSubscription,
                            style: TextStyle(color: kBackgroundColor),
                          ),
                          MaterialButton(
                            elevation: 0,
                            onPressed: () async {
                              var authToken =
                                  await SharedPreferenceHelper().getAuthToken();

                              final url =
                                  '$BASE_URL/api/web_redirect_to_buy_bundle/$authToken/$bundleId/academybycreativeitem';
                              _launchURL(url);
                            },
                            color: kGreenPurchaseColor,
                            textColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            splashColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              // side: BorderSide(color: kBlueColor),
                            ),
                            child:   Text(
                              S.of(context).renewNow ,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: bundles.length,
                    itemBuilder: (ctx, i) {
                      return Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*0.05,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                // Text(
                                //   '${S.of(context).showing}${bundles[i].bundleCourses.length} ${S.of(context).courses}',
                                //   style: const TextStyle(
                                //     fontWeight: FontWeight.w400,
                                //     fontSize: 18,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: bundles[i].bundleCourses.length,
                              itemBuilder: (ctx, index) {
                                return Center(
                                  child: MyBundleCourseListItem(
                                    bundleId: bundleId,
                                    subscriptionStatus: subscriptionStatus,
                                    id: int.parse(
                                        bundles[i].bundleCourses[index].id),
                                    title:
                                        bundles[i].bundleCourses[index].title,
                                    thumbnail: bundles[i]
                                        .bundleCourses[index]
                                        .thumbnail,
                                    rating:
                                        bundles[i].bundleCourses[index].rating,
                                    numberOfRatings: bundles[i]
                                        .bundleCourses[index]
                                        .numberOfRatings,
                                    price:
                                        bundles[i].bundleCourses[index].price,
                                    instructorName: bundles[i]
                                        .bundleCourses[index]
                                        .instructorName,
                                    instructorImage: bundles[i]
                                        .bundleCourses[index]
                                        .instructorImage,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
