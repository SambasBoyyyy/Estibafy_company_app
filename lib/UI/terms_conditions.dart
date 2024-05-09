
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/colors.dart';

class TermsAndConditions extends StatelessWidget {
   TermsAndConditions({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
      title: const Text('Terms and Conditions', style: TextStyle(color: AppColors.primaryColor)),
      elevation: 0.0,
      leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon:  const Icon(
                  Icons.arrow_back,
                  color: AppColors.primaryColor,
                )),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.0),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: const [
            Text("A terms and conditions agreement outlines the website administrator’s rules regarding user behavior and provides information about the actions the website administrator can and will perform"
    "Essentially, your terms and conditions text is a contract between your website and its users. In the event of a legal dispute, arbitrators will look at it to determine whether each party acted within their rights."
    "Creating the best terms and conditions page possible will protect your business from the following:"
    "Abusive users: Terms and Conditions agreements allow you to establish what constitutes appropriate activity"
   " on your site or app, empowering you to remove abusive users and content that violates your guidelines Intellectual property theft: Asserting your claim to the creative assets of your site in your terms and conditions will prevent ownership disputes and copyright infringement.Potential litigation: If a user lodges a legal complaint against your business, showing that they were presented with clear terms and conditions before they used your site will help you immensely in court.In short, terms and conditions give you control over your site and legal enforcement if users try "
                "to take advantage of your operations.Are You Legally Required to Have Terms and Conditions?"
    "Technically, no. You aren’t legally required to have a terms and conditions agreement."

    "However, having terms and conditions for websites is considered standard business practice in the US, Canada, the UK, and just about everywhere else — from South Africa to Australia."

    "If you plan to grow your business or expand your user base, a simple website terms and conditions page will provide your site with an additional layer of legal protection."

    "Not sure which documents you need to protect your site? Find out the difference between a terms of use and a privacy policy in our guide."

    "Reasons to Have a Terms and Conditions"
    "Besides giving your business more legal protection, you should also have a terms and conditions agreement on your website for the following reasons:"

    "To Set Liabilities Limits"
    "Almost every terms and conditions agreement has a warranty or limitations of liability disclaimer. We’ll cover it in more detail in our section about what clauses to include in your terms and conditions, but this clause essentially limits what customers can hold you liable for"

    "Most companies restrict liability for:"

    "Inaccuracies and errors"
    "Lack of enjoyment Product or website downtime Viruses, spyware, and product damage To Outline Policies and Avoid Abusive Behavior"
    "Many companies use their website’s terms and conditions to lay down the rules that users must agree to and follow before accessing your website or service."

    "Most of these rules revolve around how users should interact with others and what they can and can’t post or do. "
    "To Terminate Abusive Users’ Accounts"
    "Your terms and conditions agreement is also a great place to list when and why you can terminate the accounts of abusive users. Most companies, for instance, will ban users if they’re using the platform or site for illegal activities, bullying other users, and unauthorized web scraping."
    "Keep Others From Copying Your Content"
    "Another reason for having a terms and conditions agreement is to disclose and protect your intellectual property rights."
                "Adding an intellectual property disclosure clause to your terms and conditions text informs users of your intellectual property rights, such as your logos, content, and other protected ideas and marks."),
  ]),
      ),
    );
  }
}
