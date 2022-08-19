import 'package:mc_dart/ui/account/AccountAnswer.dart';
import 'package:mc_dart/ui/account/AccountForm.dart';
import 'package:mc_dart/ui/account/AccountQuestion.dart';
import 'package:mc_dart/ui/loan/historyPayment.dart';
import 'package:mc_dart/ui/loan/paymentLoan.dart';
import 'package:mc_dart/ui/loan/periodPayment.dart';
import 'package:mc_dart/ui/account/AccountBank.dart';
import 'package:mc_dart/ui/account/AccountChangePassword.dart';
import 'package:mc_dart/ui/account/AccountRules.dart';
import 'package:mc_dart/ui/account/AccountSercurity.dart';
import 'package:mc_dart/ui/account/AccountSupport.dart';
import 'package:mc_dart/ui/account/BankInfo.dart';
import 'package:mc_dart/ui/account/ListBank.dart';
import 'package:mc_dart/ui/loan/CreateLoanRequest.dart';
import 'package:mc_dart/ui/loan/DetailCreateLoan.dart';
import 'package:mc_dart/ui/loan/LoanInfomation.dart';
import 'package:mc_dart/ui/loan/ProductLoan.dart';
import 'package:mc_dart/ui/tabbar/tabbar.dart';
import 'package:mc_dart/ui/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:mc_dart/ui/loan/loanDetail.dart';
import 'package:mc_dart/ui/loan/resultLoan.dart';
import 'package:mc_dart/ui/loan/transactionDetail.dart';

import '../../ui/loan/InfoLoan.dart';

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
    home: (BuildContext context) => TabBarScreen(),
    loanDetail: (BuildContext context) => LoanDetailScreen(),
    paymentLoan: (BuildContext context) => PaymentLoanScreen(),
    resultLoan: (BuildContext context) => ResultLoanScreen(),
    periodPayment: (BuildContext context) => PeriodPaymentScreen(),
    transactionDetail: (BuildContext context) => TransactionDetailScreen(),
    historyPayment: (BuildContext context) => HistoryPaymentScreen(),
    bank: (BuildContext context) => AccountBankScreen(),
    rule: (BuildContext context) => AccountRuleScreen(),
    cecurity: (BuildContext context) => AccountSercurityScreen(),
    support: (BuildContext context) => AccountSupportScreen(),
    changePassword: (BuildContext context) => AccountChangePasswordScreen(),
    accountForm: (BuildContext context) => AccountFormScreen(),
    accountQuestion: (BuildContext context) => AccountQuestionScreen(),
    accountAnswer: (BuildContext context) => AccountAnswerScreen(),
    infoLoan: (BuildContext context) => InfoLoanScreen(),
    listBank: (BuildContext context) => ListBankScreen(),
    bankInfo: (BuildContext context) => BankInfoScreen(),
    productLoan: (BuildContext context) => ProductLoanScreen(),
    createLoan: (BuildContext context) => DetailCreateLoanScreen(),
    createLoanRequest: (BuildContext context) => CreateLoanRequestScreen(),
    loanInfomation: (BuildContext context) => LoanInfomationScreen(),
    paymentLoan: (BuildContext context) => PaymentLoanScreen(),
    resultLoan: (BuildContext context) => ResultLoanScreen(),
    periodPayment: (BuildContext context) => PeriodPaymentScreen(),
    transactionDetail: (BuildContext context) => TransactionDetailScreen(),
    historyPayment: (BuildContext context) => HistoryPaymentScreen(),
  };
}
