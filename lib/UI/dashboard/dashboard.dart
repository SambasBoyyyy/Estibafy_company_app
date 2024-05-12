import 'package:estibafy_company_app/UI/widgets/dashboard_helpers_widget.dart';
import 'package:estibafy_company_app/controllers/auth_controller.dart';
import 'package:estibafy_company_app/controllers/helper_controller.dart';
import 'package:estibafy_company_app/controllers/order_controller.dart';
import 'package:estibafy_company_app/theme/colors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../components/components.dart';
import '../../models/company_helpers.dart';
import '../widgets/Orders Widgets/dashboardJobCard.dart';
import '../widgets/draawer.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final orderController = Get.put(OrderController());

  final helperController = Get.put(HelperController());

  final authController = Get.put(AuthController());

  final ref = FirebaseDatabase.instance.ref('company').child('job');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orderController.getOrders();
    helperController.getAllHelpers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onHorizontalDragEnd: (DragEndDetails details) {
            if (details.primaryVelocity! > 0) {
              drawerController.close!();
            }
          },
          child: ListView(
            children: [
              Row(
                children: [
                  Text(
                    "DASHBOARD".toUpperCase(),
                    style: titleTextStyle,
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(LineAwesomeIcons.align_right),
                    onPressed: () {
                      drawerController.open!();
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 180,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CircleAvatar(
                              child: Image.network(
                                'https://i.pinimg.com/originals/be/c8/8c/bec88c0d89bca09ce2537257ee3fd054.jpg',
                                fit: BoxFit.fill,
                              ),
                            )),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                authController.userProfile.value.data?.user?.company?.companyName ??
                                    "--",
                                style: subtitleTextStyle.copyWith(
                                    color: Colors.white, fontWeight: FontWeight.w700, fontSize: 25),
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Obx(
                              () => Text(
                                authController
                                        .userProfile.value.data?.user?.company?.companyAddress ??
                                    "--",
                                style: subtitleTextStyle.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Earnings",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                        Spacer(),
                        Text(
                          "Jobs",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Row(
                      children: [
                        const Icon(
                          CupertinoIcons.money_dollar,
                          color: Colors.white,
                        ),
                        const Text(
                          "345.56",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        const Spacer(),
                        Container(
                          width: 0.5,
                          height: 22,
                          color: Colors.white,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.cases_outlined,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Text(
                          "2345",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "New Job Requests",
                style: titleTextStyle.copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: 200,
                child: StreamBuilder(
                    stream: ref.onValue,
                    builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if(snapshot.data != null){
                          if (!snapshot.hasData) {
                            return const Center(child: Text("Waiting for New Job"));
                          } else {

                            Map<dynamic, dynamic> data = snapshot.data!.snapshot.value as Map;

                            List<dynamic> list = [];
                            list.clear();
                            print(data.values);
                            list = data.values.toList();

                                 print(snapshot.data?.snapshot.children.length,);
                            List<dynamic> keys = data.keys.toList();

                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 1,//snapshot.data?.snapshot.children.length,
                                itemBuilder: (context, index) {
                                  return DashboardJobCard(
                                    customerName: '${list[index]['name']}',
                                                                        customerAddress: '${list[index]['address']}',
                                                                        jobAmount: '${list[1]['total']}',
                                                                        totalHelpers:
                                                                        '${list[1]['total_helpers']}',
                                                                        date: '${list[1]['created_at']}',
                                                                        jobId: list[index]['id'],
                                                                        reference: keys[index],
                                  );

                                  //DashboardJobCard(
                                  //                                     customerName: '${list[index]['data']['job']['name']}',
                                  //                                     customerAddress: '${list[index]['data']['job']['address']}',
                                  //                                     jobAmount: '${list[index]['data']['checkout']['total']}',
                                  //                                     totalHelpers:
                                  //                                     '${list[index]['data']['checkout']['total_helpers']}',
                                  //                                     date: '${list[index]['data']['checkout']['created_at']}',
                                  //                                     jobId: list[index]['data']['job']['id'],
                                  //                                     reference: keys[index],
                                  //                                   );

                                });
                          }
                        }else{
                          return const Center(child: Text("Waiting for New Job"));
                        }

                      }
                    }),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Jobs",
                style: titleTextStyle.copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Obx(
                        () => jobWidget("Accepted Jobs",
                            orderController.companyJobs.value.data?.accepted?.length ?? 0),
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      Obx(
                        () => jobWidget("In-Progress Jobs",
                            orderController.companyJobs.value.data?.inprogress?.length ?? 0),
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      Obx(
                        () => jobWidget("Completed Jobs",
                            orderController.companyJobs.value.data?.complete?.length ?? 0),
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      Obx(
                        () => jobWidget("Declined Jobs",
                            orderController.companyJobs.value.data?.declined?.length ?? 0),
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      Obx(
                        () => jobWidget("Cancelled Jobs",
                            orderController.companyJobs.value.data?.declined?.length ?? 0),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Active Helpers",
                style: titleTextStyle.copyWith(fontSize: 18),
              ),
              Obx(
                () => helperController.helpers.value.data == null
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ))
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: helperController.helpers.value.data?.length,
                        itemBuilder: (context, index) {
                          return DashboardHelperWidget(
                            helper: helperController.helpers.value.data?[index] ?? Helper(),
                          );
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget jobWidget(String title, int numberOfJobs) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            title,
            style: subtitleTextStyle.copyWith(color: Colors.white, fontSize: 18),
          ),
          const Spacer(),
          Text(
            "$numberOfJobs",
            style: subtitleTextStyle.copyWith(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(
            width: 30.0,
          ),
        ],
      ),
    );
  }
}
