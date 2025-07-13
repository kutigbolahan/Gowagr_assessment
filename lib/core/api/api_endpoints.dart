import 'package:middleman/core/core.dart';

final baseUrl = AppConfig.baseUrl;

class _AuthEndpoints {
  String createAccount = '$baseUrl/auth/UserSignup';
  String uploadFiles = '$baseUrl/upload-files';
  String verifyOtpCode = '$baseUrl/users/user/verify-signup-or-login-code';
  String createTag = '$baseUrl/users/add-IGBIGI-tag/add-user-IGBIGI-tag';
  String signIn = '$baseUrl/auth/user/user-email-login';
  String addMobileNumber(dynamic userID) =>
      '$baseUrl/users/add-phone-number/$userID';
  String findUserById(dynamic userID) =>
      '$baseUrl/users/find-user-by-id/$userID';
  String biometricLogin(dynamic userID) =>
      '$baseUrl/auth/biometrics-login/$userID';
}

class _ForgotPasswordEndpoints {
  String forgotPasswordPhoneNumber(dynamic phoneNumber) =>
      '$baseUrl/users/verification/initiate-forgot-password-flow/$phoneNumber';
  String forgotPasswordEmail(dynamic email) =>
      '$baseUrl/users/admin/verification/initiate-forgot-password-flow/$email';
  String finalizeForgetPasswordFlow(dynamic uniqueVerificationCode) =>
      '$baseUrl/users/verification/finalize-forgot-password-flow/$uniqueVerificationCode';
  String changePassword = '$baseUrl/users/verification/change-password';
}

class _DealsEndpoints {
  String getDealsTransactions(dynamic userID) =>
      '$baseUrl/deals/transaction/all-deals-for-user/$userID?page=1&limit=100000';
  String ongoingDeals(dynamic userID) =>
      '$baseUrl/deals/ongoing/$userID?page=1&limit=1000';
  String completedDeals(dynamic userID) =>
      '$baseUrl/deals/completed/$userID?page=1&limit=1000';
  String requestDeals(dynamic userID) =>
      '$baseUrl/deals/requests/$userID?page=1&limit=1000';
  String disputeDeals(dynamic userID) =>
      '$baseUrl/deals/disputes/$userID?page=1&limit=1000';
  String createNewDeals = '$baseUrl/deals';
  String findUserByTag(dynamic tag) =>
      '$baseUrl/users/find-user-by-IGBIGItag/$tag';
  String sendDealsToBuyer(dynamic dealId, dynamic userTag) =>
      '$baseUrl/deals/send-deal-to-buyer/$dealId/buyer/$userTag';
  String giveratings(dynamic dealId) =>
      '$baseUrl/deals/buyer-rate-deal/$dealId/rating';
  String sellerSummaryDetails(dynamic sellerId) =>
      '$baseUrl/deals/seller-deal/summary/$sellerId';
  String buyerAcceptDeal(dynamic dealId, dynamic buyerId) =>
      '$baseUrl/deals/buyer-accept-deal/$dealId/buyer/$buyerId/status';
  String addDeliveryAddress(dynamic dealId) =>
      '$baseUrl/deals/payment/address-for-delivery/$dealId';
  String confirmDelivery(dynamic dealId) =>
      '$baseUrl/deals/update-timeline/delivery-confirmed/$dealId';
  final buyerRejectDeal = '$baseUrl/deals/Buyer-reject-deal-offer/reject';
  final sellerWithdrawOffer =
      '$baseUrl/deals/seller-withdraw-deal-offer/withdraw';
  final buyerMakePayment =
      '$baseUrl/deals/buyer-make-payment/verify-and-process';
  final dealsStatement =
      '$baseUrl/deals/Deal-history_account-statement/generate-report';
  String buyerAcceptitemonDelivery(dynamic dealId, dynamic buyerId) =>
      '$baseUrl/deals/buyer-accept-and-confirm-deal-on-delivery/$buyerId/$dealId';
  String findDealsByID(dynamic dealId, dynamic userId) =>
      '$baseUrl/deals/add-more/find-deal-by-id/$dealId?userId=$userId';
}

class _ProfileEndpoints {
  String changeTransactionPin(dynamic userID) =>
      '$baseUrl/users/$userID/change-pin';
  String deleteAccount(dynamic userID) => '$baseUrl/users/$userID';
  String updateUser(dynamic userID) => '$baseUrl/users/user/$userID';
  String userResendOtp(dynamic userID) =>
      '$baseUrl/users/userResend-otp-code/$userID';
}

class _NotificationsEndpoints {
  String getAllNotifications(dynamic userID) =>
      '$baseUrl/notification/$userID/paginated?page=1&limit=100000';
}

class _DisputesEndpoints {
  String getDisputeDetails(dynamic id) => '$baseUrl/dispute/$id';
  final sellerDeclineProposal =
      '$baseUrl/dispute/seller-decline-proposal/decline-proposal';
  final sellerAcceptProposal = '$baseUrl/dispute/seller-accept-proposal/accept';
  final createDispute = '$baseUrl/dispute';
  final buyeracceptSellerProposal =
      '$baseUrl/dispute/buyer-accept-seller-proposal';
  final buyerDeclineSellerProposal =
      '$baseUrl/dispute/buyer-decline-seller-proposal';
}

class _WalletEndpoints {
  String walletTransactions(dynamic userID) =>
      '$baseUrl/transaction/user/transaction-history/$userID?page=1&limit=100000';
  String getallWallet(dynamic quidaxuserID) =>
      '$baseUrl/crypto/admin/quidax/user-wallet/active/$quidaxuserID';
  //'$baseUrl/crypto/admin/quidax/user_wallet/active/$quidaxuserID';
  String wallertReport =
      '$baseUrl/transaction/generate-report/generate-report-for-user';
  String transactionFees = '$baseUrl/transaction/transaction/fees';
  String generalAppFees = '$baseUrl/fees';
  String appBanner = '$baseUrl/appbanner';
}

class _CryptoEndpoints {
  String getACryptoOnAccount(dynamic quidaxuserID, dynamic currency) =>
      '$baseUrl/crypto/activate-wallet-address/$quidaxuserID/wallets/$currency/address';
  String fetchUserWallets(dynamic quidaxuserID, dynamic currency) =>
      '$baseUrl/crypto/users/$quidaxuserID/wallet/$currency';
  String graph(
    dynamic market,
    dynamic period,
  ) =>
      '$baseUrl/crypto/crypto-graphs/markets/${market}ngn?date=${DateTime.parse(DateTime.now().toString())}&period=$period&limit=30';

  String buyCrypto = '$baseUrl/crypto/buy/user-buy-crypto';
  String sellCrypto = '$baseUrl/crypto/sell/user-sell-crypto';
  String exchangeRateCrypto(dynamic currency) =>
      '$baseUrl/crypto/tickers/${currency}ngn';
}

class _WithdrawalEndpoints {
  String listOfBanks = '$baseUrl/wallet/list-of-banks';
  String verifyAccount = '$baseUrl/wallet/verify-account/verify-user-bank';
  String withdrawal = '$baseUrl/withdrawal';
  String appBanner = '$baseUrl/appbanner';
}

class _VirtualCardEndponts {
  String createVirtualCard(dynamic userID) =>
      '$baseUrl/virtualcard/create-card-for-customer/create/$userID';
  String getCardDetails(dynamic cardId) =>
      '$baseUrl/virtualcard/get-card-details/$cardId';
  String getCardToken(dynamic cardId) => '$baseUrl/virtualcard/$cardId/token';
  String getCardTransactions(dynamic cardId) =>
      '$baseUrl/virtualcard/$cardId/transactions?page=1&limit=100&fromDate=2024-01-01&toDate=2025-01-01';
  String getVirtualExchangeRate = '$baseUrl/virtualcard/rate/USDNGN';
  String fundVirtualWallet = '$baseUrl/virtualcard/fund';
  String withdrawVirtualWallet = '$baseUrl/virtualcard/withdraw';
  String freezeUnfreezeCard(dynamic id) =>
      '$baseUrl/virtualcard/freezing_and_unfreezing_account/status/$id';
  String revealCardDetails(dynamic cardId) =>
      '$baseUrl/virtualcard/$cardId/reveal/card-details';
}

final authEndpoints = _AuthEndpoints();
final forgotEndpoints = _ForgotPasswordEndpoints();
final profileEndpoints = _ProfileEndpoints();
final dealsEndpoints = _DealsEndpoints();
final nottificationsEndpoints = _NotificationsEndpoints();
final walletEndpoints = _WalletEndpoints();
final disputesEndpoints = _DisputesEndpoints();
final cryptoEndpoints = _CryptoEndpoints();
final withdrawalEndpoints = _WithdrawalEndpoints();
final virtualEndpoints = _VirtualCardEndponts();
