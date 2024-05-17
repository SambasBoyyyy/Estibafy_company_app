import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../API/api_service.dart';
import '../models/company_jobs_model.dart';

class OrderController extends GetxController {
  Rx<CompanyJobsModel> companyJobs = CompanyJobsModel().obs;

  final ref = FirebaseDatabase.instance.ref('company').child('job');

  getOrders() {
    API().getRequest(endPoint: "/company/jobs").then((value) {
      if (value != null) {
        companyJobs.value = CompanyJobsModel.fromJson(value.data);
        print(companyJobs.value.data);
      }
    });
  }

  acceptJob({int? jobId, String? path}) {
    var body = {
      'status': 'accepted',
      'job_id': jobId,
    };
    print(path);
    API()
        .postRequest(endPoint: '/company/job/accept', body: body, dataType: 'form-data')
        .then((value) => {
              if (value != null)
                {

                  if (value.statusCode == 200) {ref.remove()}
                }
            });
  }

  int getListLength(int orderCategory) {
    return orderCategory == 0
        ? (companyJobs.value.data?.accepted?.length ?? 1)
        : orderCategory == 1
            ? (companyJobs.value.data?.inprogress?.length ?? 1)
            : orderCategory == 2
                ? (companyJobs.value.data?.complete?.length ?? 1)
                : (companyJobs.value.data?.declined?.length ?? 1);
  }

  JobData? getSelectedList(int index, int orderCategory) {
    return orderCategory == 0
        ? companyJobs.value.data!.accepted![index]
        : orderCategory == 1
            ? companyJobs.value.data!.inprogress![index]
            : orderCategory == 2
                ? companyJobs.value.data!.complete![index]
                : companyJobs.value.data!.declined![index];
  }
}
