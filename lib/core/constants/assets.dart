/// path assets (svgs and pngs) path
const String baseSvgPath = 'assets/svgs/';
const String basePngPath = 'assets/pngs/';
const String baseGifPath = 'assets/gifs/';

/// app logo
//final String appIcon = 'app_icon'.png;

/// pngs
final String onboarding4 = 'onboarding_4'.png;
final String nigerianFlag = 'nigeria_flag'.png;
final String idExample = 'id_example'.png;
final String avatar = 'Avatar'.png;
final String qrCodepng = 'qr_codepng'.png;
final String topoPng = 'topo_png'.png;
final String funiturePng = 'funiturePng'.png;
final String wavingHand = 'waving_hand'.png;
final String autolayout = 'auto_layout'.png;
final String psController1 = 'ps_controller'.png;
final String backvirtualpng = 'back_virtual_png'.png;
final String uodatebannerPng = 'uodatebannerPng'.png;
final String intercomPng = 'Intercom'.png;
final String logoimagepng = 'logo_image_png'.png;
final String checkMArk = 'checkMark'.png;
final String walletPng = 'walletPng'.png;
final String questionpng = 'question'.png;
final String btcpng = 'btc'.png;
final String ethpng = 'eth'.png;
final String usdtpng = 'usdtPng'.png;
final String xrpPng = 'xrpPng'.png;
final String icon1 = 'icon1'.png;
final String icon = 'icon'.png;
final String freezePng = 'freezepng'.png;
final String virtualPng = 'virtualPng'.png;

/// svgs
final String middlemanLogo = 'middleman_logo'.svg;
final String onboarding1 = 'onboarding_1'.svg;
final String onboarding2 = 'onboarding_2'.svg;
final String onboarding5 = 'onboarding_5'.svg;
final String nigerianflag = 'nigerian_flag'.svg;
final String forgotPassword = 'forgot_password'.svg;
final String topographic = 'Topo_graphic'.svg;
final String exchange = 'exchange'.svg;
final String fundWallet = 'fund_wallet'.svg;
final String withdraw = 'withdraw'.svg;
final String disputes = 'disputes'.svg;
final String danger = 'danger'.svg;
final String guard = 'guard'.svg;
final String home = 'home'.svg;
final String virtualcard = 'virtual_card'.svg;
final String wallet = 'wallet'.svg;
final String bitcoin = 'bitcoin'.svg;
final String ethereum = 'ethereum'.svg;
final String ripple = 'ripple'.svg;
final String usdt = 'usdt'.svg;
final String phrase = 'phrase'.svg;
final String politicalCorruption = 'Political_corruption'.svg;
final String connectWallet = 'connect_wallet'.svg;
final String eye = 'eye'.svg;
final String fingerprint = 'fingerprint'.svg;
final String padlock = 'padlock'.svg;
final String badge = 'badge'.svg;
final String bell = 'bell'.svg;
final String language = 'language'.svg;
final String agreement = 'agreement'.svg;
final String accountStatement = 'account_statement'.svg;
final String seeasyougo = 'seeasyougo'.svg;
final String facebook = 'Facebook'.svg;
final String twitter = 'twitter'.svg;
final String instagram = 'instagram'.svg;
final String pencil = 'pencil'.svg;
final String primarycard = 'Primary Card'.svg;
final String cryptocard = 'Crypto Card'.svg;
final String qrCode = 'qr_code'.svg;
final String logo = 'logo'.svg;
final String dropDown = 'drop_down'.svg;
final String walletFailure = 'wallet_failure'.svg;
final String copy = 'copy'.svg;
final String download = 'download'.svg;
final String topographiclarge = 'Topographic'.svg;
final String receipt = 'receipt'.svg;
final String checkmark = 'checkmark'.svg;
final String card = 'Cards'.svg;
final String card2 = 'Cards-2'.svg;
final String card3 = 'Cards-3'.svg;
final String eth = 'eth'.svg;
final String usFlag = 'usFlag'.svg;
final String peopleautolayout = 'peopleLayout'.svg;
final String dragHandle = 'dragHandle'.svg;
final String virtual1 = 'virtual_1'.svg;

final String virtual = 'virtual'.svg;
final String visa = 'visa'.svg;
final String freezedcard = 'freezedcard'.svg;
final String rec = 'rec'.svg;
final String bluesvg = 'blue'.svg;
final String yellowsvg = 'yellow'.svg;
final String justice = 'justice'.svg;
final String question = 'question'.svg;
final String pic = 'pic'.svg;
final String updateBanner = 'updateBanner'.svg;
final String emptynoty = 'empty_noty'.svg;
final String logoimage = 'logo_image'.svg;
final String checkMark = 'check_mark'.svg;

/// extensions
extension ImageExtension on String {
  // png paths
  String get png => '$basePngPath$this.png';

  // svgs path
  String get svg => '$baseSvgPath$this.svg';

  // gifs path
  String get gif => '$baseGifPath$this.gif';
}
