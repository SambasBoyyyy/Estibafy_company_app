import '../API/api_service.dart';
import '../models/earning_model.dart';

Future<List<JobData>> fetchEarn() async {
  final response = await API().getRequest(endPoint: "/company/wallet");

  if (response?.statusCode == 200) {
    print(response?.data);

    // Assuming response?.data is already a decoded JSON map
    var jsonResponse = response?.data;

    if (jsonResponse is Map<String, dynamic> && jsonResponse.containsKey('data')) {
      List data = jsonResponse['data'];
      var jobDataList = data.map((job) => JobData.fromJson(job)).toList();
      print(jobDataList);
      return jobDataList;
    } else {
      throw Exception('Invalid response format');
    }
  } else {
    throw Exception('Failed to load jobs');
  }
}
