import 'package:estibafy_company_app/controllers/helper_controller.dart';
import 'package:estibafy_company_app/models/company_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import '../widgets/backButton.dart';

class HelperDetailsScreen extends StatelessWidget {
  const HelperDetailsScreen({super.key, required this.helper});

  final Helper helper;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              backButton(),
              CircleAvatar(
                radius: 40,
              ),
              SizedBox(
                height: 20,
              ),
              Text(helper.name ?? "--", style: titleTextStyle.copyWith(
                fontSize: 20,
              ),),
              SizedBox(height: 10,),
              Text('ID: #${helper.id.toString()}', style: normalTextStyle.copyWith(
                  fontSize: 14
              ),),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.email_outlined,size: 20,),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email", style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[700]
                            ),),
                            Text(helper.email ?? "--", style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black
                            ),),
                          ],
                        )
                      ],
                    ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Divider(),
                   ),
                    Row(
                      children: [
                        Icon(Icons.call,size: 20,),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Phone Number", style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[700]
                            ),),
                            Text(helper.mobile ?? "--", style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black
                            ),),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,size: 20,),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Address", style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[700]
                            ),),
                            Row(
                              children: [
                                Text('${helper.city}, ' ?? "--", style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black
                                ),
                                ),
                                Text(helper.country ?? "--", style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.black
                                ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    Row(
                      children: [
                        Icon(Icons.security,size: 20,),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Verified", style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[700]
                            ),),
                            Text(helper.isVerified == 1 ? "Yes" : "No", style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black
                            ),),
                          ],
                        )
                      ],
                    ),
                    const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    InkWell(
                      onTap: (){
                        final helperController = Get.put(HelperController());
                        helperController.deleteHelper(helper.id);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Text("Remove Helper from Company",style: TextStyle(
                          color: Colors.white
                        ),),
                      ),

                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
