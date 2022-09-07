
import 'package:mc_dart/ui/splash/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String loanDetail = '/loanDetail';
  static const String firstLogin = '/first_login';
  static const String formPhone = '/form_phone';
  static const String otpLogin = '/otp_login';
  static const String paymentLoan = '/paymentLoan';
  static const String resultLoan = '/resultLoan';
  static const String periodPayment = '/periodPayment';
  static const String transactionDetail = '/transactionDetail';
  static const String historyPayment = '/historyPayment';
  static const String appLogin = '/app_login';
  static const String changePasswordOTP = '/change_password_otp';
  static const String createPassword = '/create_password';
  static const String bank = '/bank';
  static const String rule = '/rule';
  static const String cecurity = '/cecurity';
  static const String support = '/support';
  static const String changePassword = '/change_password';
  static const String accountForm = '/AccountForm';
  static const String accountQuestion = '/AccountQuestion';
  static const String accountAnswer = '/AccountAnswer';
  static const String infoLoan = '/InfoLoan';
  static const String listBank = '/list_bank';
  static const String bankInfo = '/bank_info';
  static const String productLoan = '/product_loan';
  static const String createLoan = '/create_loan';
  static const String createLoanRequest = '/create_loan_request';
  static const String loanInfomation = '/loan_infomation';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
  };
}
