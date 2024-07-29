import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/components.dart';
import '../../controllers/earning_controller.dart';
import '../../models/earning_model.dart';
import '../../models/utils/constant.dart';
import '../../theme/colors.dart';

class MockBookingController extends GetxController {
  DateTime? date = DateTime.now();

  Future<EarningModel> getMyEarnings() async {
    List<JobData> joblist = await fetchEarn();

    int totalJobs = joblist.length;
    double totalAmount = joblist.fold(0.0, (sum, job) => sum + job.totalAmount);

    return EarningModel(
      statusCode: 200,
      data: Data(
        releasesPaymentEarning: PaymentEarning(
          totalJobsDone: totalJobs,
          totalAmount: double.parse(totalAmount.toStringAsFixed(2)),
          totalNumberOfDaysWorked: joblist.length, // Adjust this as needed
        ),
        detailJobsStatus: joblist,
      ),
    );
  }
}

class MyEarnings extends StatefulWidget {
  const MyEarnings({Key? key}) : super(key: key);

  @override
  State<MyEarnings> createState() => _MyEarningsState();
}

class _MyEarningsState extends State<MyEarnings> {
  // Replace the actual BookingController with MockBookingController
  MockBookingController bookingController = Get.put(MockBookingController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "earnings".toUpperCase(),
                style: titleTextStyle,
              ),
              SizedBox(height: 5,),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: FutureBuilder(
                  future: bookingController.getMyEarnings(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var model = snapshot.data as EarningModel;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Container(
                          //   height: 50,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(15),
                          //     border: Border.all(color: sixthColor),
                          //   ),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Row(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //           const Padding(
                          //             padding: EdgeInsets.all(10.0),
                          //             child: Icon(
                          //               // FontAwesomeIcons.solidCalendarAlt,
                          //               Icons.calendar_month,
                          //               color: fourthColor,
                          //               size: 20,
                          //             ),
                          //           ),
                          //           const SizedBox(
                          //             width: 11,
                          //           ),
                          //           // Text(DateFormat.yMMMMEEEEd().format(bookingController.date!)),
                          //           const SizedBox(
                          //             width: 15,
                          //           ),
                          //           // InkWell(
                          //           //   onTap: () {
                          //           //     _date(context);
                          //           //   },
                          //           //   borderRadius: BorderRadius.circular(20),
                          //           //   child: const Icon(
                          //           //     Icons.arrow_drop_down_outlined,
                          //           //     size: 30,
                          //           //     color: primaryColor,
                          //           //   ),
                          //           // ),
                          //         ],
                          //       ),
                          //       const SizedBox(
                          //         height: 20,
                          //         child: VerticalDivider(
                          //           color: sixthColor,
                          //         ),
                          //       ),
                          //       IconButton(
                          //           onPressed: () {},
                          //           icon: const Icon(
                          //             // FontAwesomeIcons.cog,
                          //             Icons.content_paste_go,
                          //             size: 20,
                          //           )),
                          //     ],
                          //   ),
                          // ),
                          const SizedBox(
                            height: 20,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(color: sixthColor, width: 0.5),
                            ),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Stack(
                                        children: const [
                                          SizedBox(
                                              height: 60,
                                              width: 70,
                                              child: Icon(
                                                // FontAwesomeIcons.solidMoneyBillAlt,
                                                Icons.calendar_month,
                                                color: fifthColor,
                                                size: 32,
                                              )),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              'Total Jobs',
                                              style: textStyle3,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '${model.data!.releasesPaymentEarning!.totalJobsDone.toString()}',
                                            style: textStyle6.copyWith(
                                                color: fourthColor, fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 50,
                                    child: VerticalDivider(
                                      color: tenthColor,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          'Earnings',
                                          style: textStyle3,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '\$ ${model.data!.releasesPaymentEarning!.totalAmount}',
                                        style: textStyle6.copyWith(
                                            color: fourthColor, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Expanded(
                          //       child: middleBoxes(
                          //           'Total Jobs', //FontAwesomeIcons.box,
                          //           Icons.check_box,
                          //           '${model.data!.releasesPaymentEarning!.totalJobsDone.toString()}'),
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 5,
                            color: AppColors.primaryColor,
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Total Jobs + Tips',
                                      style: textStyle3.copyWith(
                                          color: secondaryColor),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '\$ ${model.data!.releasesPaymentEarning!.totalAmount}',
                                      style: textStyle6.copyWith(
                                          color: secondaryColor, fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  middleBoxes(title, icon, text, {iconColor = fourthColor}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: sixthColor, width: 0.5),
      ),
      elevation: 5,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style:
                      textStyle2.copyWith(letterSpacing: 0.0, wordSpacing: 0.0),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      icon,
                      color: iconColor,
                      size: 22,
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    text,
                    style: textStyle3.copyWith(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> _date(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       builder: (context, child) {
  //         return Theme(
  //           data: Theme.of(context).copyWith(
  //             colorScheme: const ColorScheme.light(
  //               primary: primaryColor, // header background color
  //               onPrimary: secondaryColor, // header text color
  //               onSurface: primaryColor, // body text color
  //             ),
  //             textButtonTheme: TextButtonThemeData(
  //               style: TextButton.styleFrom(
  //                 foregroundColor: primaryColor, // button text color
  //               ),
  //             ),
  //           ),
  //           child: child!,
  //         );
  //       },
  //       initialDate: bookingController.date!,
  //       initialDatePickerMode: DatePickerMode.day,
  //       firstDate: DateTime(2015),
  //       lastDate: DateTime(2101));
  //   if (picked != null) {
  //     setState(() {
  //       bookingController.date = picked;
  //     });
  //   }
  // }
}
