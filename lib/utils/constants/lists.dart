import '../../generated/assets.dart';
import '../../models/filter_class.dart';
import '../../models/home_model.dart';
import '../../models/wallet_history_model.dart';

// Radio Group Lists
const List<String> horseTypeList = ["Horse", "mare"];
const List<String> conditionList = ["injured", "salim"];
const List<String> originalityList = ["arabic", "hybrid"];
const List<String> yesOrNoList = ["yes", "no"];

// String Lists
List<FilterClass> filterNamesList = [
  FilterClass(
    filterName: "add type",
  ),
  FilterClass(
    filterName: "horse type",
  ),
  FilterClass(
    filterName: "region",
  ),
  FilterClass(
    filterName: "age",
  ),
  FilterClass(
    filterName: "color",
  ),
  FilterClass(
    filterName: "safety",
  ),
  FilterClass(
    filterName: "originality",
  ),
];

//Image Lists
List<String> imagesList = [
  Assets.homeImagesAdvertisingHorseRectangular,
  Assets.homeImagesAdvertisingHorseRectangular,
  Assets.homeImagesAdvertisingHorseRectangular,
];
//Model Lists

List<HomeModel> homePageList = [
  HomeModel(
    horseImage: Assets.homeImagesAdvertisingHorseRectangular,
    owner: "عمر",
    height: "6 أقدام",
    age: "6",
    color: "أبيض",
    name: "دارلي أربيان",
    site: "جدة",
    type: "فرس",
    price: "700",
    safety: "التحقق",
    time: "42:06:55",
    fatherName: "لا شيء",
    isVaccinated: "نعم",
    motherName: "لا شيء",
    originality: "هجين",
    rating: "4.7",
    sales: "6",
    weight: "250 كلغ",
    status: "over",
    isPaymentTransferred: false,
    isApprovedByManagement: true,
    city: "الرياض",
    canHorseRide: true,
    canJumpObstacles: true,
    isCleaningHoovesServiceAvailable: true,
    isDailyReportsServiceAvailable: true,
    isExerciseServiceAvailable: true,
    isFeedServiceAvailable: true,
    isLaundryServiceAvailable: true,
    isTreatmentServiceAvailable: true,
  ),
  HomeModel(
      horseImage: Assets.homeImagesHomeHorseNine,
      owner: "علي",
      height: "6 أقدام",
      age: "6",
      color: "بني",
      name: "الملاوح",
      site: "جدة",
      type: "مهره",
      price: "700",
      safety: "التحقق",
      time: "42:06:55",
      fatherName: "لا شيء",
      isVaccinated: "نعم",
      motherName: "لا شيء",
      originality: "عربي أصيل",
      rating: "4.7",
      sales: "6",
      weight: "250 كلغ",
      status: "over",
      isPaymentTransferred: true,
      isApprovedByManagement: false,
      city: "جدة",
      canHorseRide: true,
      canJumpObstacles: false,
      isCleaningHoovesServiceAvailable: false,
      isDailyReportsServiceAvailable: true,
      isExerciseServiceAvailable: false,
      isFeedServiceAvailable: true,
      isLaundryServiceAvailable: false,
      isSold: true,
      isTreatmentServiceAvailable: true,
      isWaitingForApproval: false,
      isWaitingForDelivery: true,
      isGreen: true),
  HomeModel(
    horseImage: Assets.homeImagesHomeHorseTen,
    owner: "بلال",
    height: "6 أقدام",
    age: "6",
    color: "أبيض",
    name: "بوينت جيفن",
    site: "الرياض",
    type: "فرس",
    price: "700",
    safety: "التحقق",
    time: "42:06:55",
    fatherName: "لا شيء",
    isVaccinated: "نعم",
    motherName: "لا شيء",
    originality: "هجين",
    rating: "4.7",
    sales: "6",
    weight: "250 كلغ",
    status: "over",
    isPaymentTransferred: true,
    isApprovedByManagement: true,
    city: "البكيرية",
    canHorseRide: false,
    canJumpObstacles: true,
    isCleaningHoovesServiceAvailable: true,
    isDailyReportsServiceAvailable: true,
    isExerciseServiceAvailable: false,
    isFeedServiceAvailable: true,
    isLaundryServiceAvailable: false,
    isTreatmentServiceAvailable: true,
  ),
  HomeModel(
    horseImage: Assets.homeImagesHomeHorseTwelve,
    owner: "علي",
    height: "6 أقدام",
    age: "6",
    color: "بني",
    name: "المرتجز",
    site: "الرياض",
    type: "مهره",
    price: "700",
    safety: "التحقق",
    time: "42:06:55",
    fatherName: "لا شيء",
    isVaccinated: "نعم",
    motherName: "لا شيء",
    originality: "عربي أصيل",
    rating: "4.7",
    sales: "6",
    weight: "250 كلغ",
    status: "over",
    isPaymentTransferred: false,
    isApprovedByManagement: false,
    city: "حائل",
    canHorseRide: false,
    canJumpObstacles: false,
    isCleaningHoovesServiceAvailable: true,
    isDailyReportsServiceAvailable: true,
    isExerciseServiceAvailable: true,
    isFeedServiceAvailable: true,
    isLaundryServiceAvailable: true,
    isSold: true,
    isTreatmentServiceAvailable: true,
    isWaitingForApproval: false,
    isWaitingForDelivery: true,
  ),
  HomeModel(
    horseImage: Assets.homeImagesHomeHorseEight,
    owner: "عمر",
    height: "6 أقدام",
    age: "6",
    color: "أبيض",
    name: "نور الدروب",
    site: "الرياض",
    type: "فرس",
    safety: "التحقق",
    price: "700",
    time: "42:06:55",
    fatherName: "لا شيء",
    isVaccinated: "نعم",
    motherName: "لا شيء",
    originality: "هجين",
    rating: "4.7",
    sales: "6",
    weight: "250 كلغ",
    status: "bidding is now taking place",
    isPaymentTransferred: true,
    isApprovedByManagement: true,
    city: "عنيزة",
    canHorseRide: true,
    canJumpObstacles: true,
    isCleaningHoovesServiceAvailable: false,
    isDailyReportsServiceAvailable: false,
    isExerciseServiceAvailable: true,
    isFeedServiceAvailable: true,
    isLaundryServiceAvailable: false,
    isTreatmentServiceAvailable: false,
  ),
  HomeModel(
    horseImage: Assets.homeImagesHomeHorseSeven,
    owner: "بلال",
    height: "6 أقدام",
    age: "6",
    color: "بني",
    name: "الزعفران",
    site: "الرياض",
    type: "مهره",
    safety: "التحقق",
    price: "700",
    time: "42:06:55",
    fatherName: "لا شيء",
    isVaccinated: "نعم",
    motherName: "لا شيء",
    originality: "عربي أصيل",
    rating: "4.7",
    sales: "6",
    weight: "250 كلغ",
    status: "soon",
    isPaymentTransferred: false,
    isApprovedByManagement: false,
    city: "الطائف",
    canHorseRide: true,
    canJumpObstacles: false,
    isCleaningHoovesServiceAvailable: false,
    isDailyReportsServiceAvailable: false,
    isExerciseServiceAvailable: false,
    isFeedServiceAvailable: true,
    isLaundryServiceAvailable: true,
    isSold: true,
    isTreatmentServiceAvailable: true,
    isWaitingForApproval: false,
    isWaitingForDelivery: true,
  ),
  HomeModel(
    horseImage: Assets.homeImagesHomeHorseFour,
    owner: "أبو بكر",
    height: "6 أقدام",
    age: "6",
    color: "أبيض",
    name: "الشاهر",
    site: "الرياض",
    type: "فرس",
    price: "700",
    safety: "التحقق",
    time: "42:06:55",
    fatherName: "لا شيء",
    isVaccinated: "نعم",
    motherName: "لا شيء",
    originality: "هجين",
    rating: "4.7",
    sales: "6",
    weight: "250 كلغ",
    status: "soon",
    isPaymentTransferred: true,
    isApprovedByManagement: true,
    city: "حائل",
    canHorseRide: false,
    canJumpObstacles: false,
    isCleaningHoovesServiceAvailable: true,
    isDailyReportsServiceAvailable: false,
    isExerciseServiceAvailable: true,
    isFeedServiceAvailable: false,
    isLaundryServiceAvailable: true,
    isTreatmentServiceAvailable: false,
  ),
  HomeModel(
    horseImage: Assets.homeImagesHomeHorseSix,
    owner: "عمر",
    height: "6 أقدام",
    age: "6",
    color: "بني",
    name: "الحمالة",
    site: "الرياض",
    type: "مهره",
    price: "700",
    safety: "التحقق",
    time: "42:06:55",
    fatherName: "لا شيء",
    isVaccinated: "نعم",
    motherName: "لا شيء",
    originality: "عربي أصيل",
    rating: "4.7",
    sales: "6",
    weight: "250 كلغ",
    status: "soon",
    isPaymentTransferred: true,
    isApprovedByManagement: true,
    city: "الرياض",
    canHorseRide: false,
    canJumpObstacles: true,
    isCleaningHoovesServiceAvailable: true,
    isDailyReportsServiceAvailable: true,
    isExerciseServiceAvailable: true,
    isFeedServiceAvailable: false,
    isLaundryServiceAvailable: false,
    isSold: true,
    isTreatmentServiceAvailable: false,
  ),
  HomeModel(
    horseImage: Assets.homeImagesHomeHorseOne,
    owner: "عمر",
    height: "6 أقدام",
    age: "6",
    color: "أبيض",
    name: "ذو الريش",
    site: "الرياض",
    type: "فرس",
    price: "700",
    safety: "التحقق",
    time: "42:06:55",
    fatherName: "لا شيء",
    isVaccinated: "نعم",
    motherName: "لا شيء",
    originality: "هجين",
    rating: "4.7",
    sales: "6",
    weight: "250 كلغ",
    status: "soon",
    isPaymentTransferred: false,
    isApprovedByManagement: false,
    city: "جدة",
    canHorseRide: true,
    canJumpObstacles: false,
    isCleaningHoovesServiceAvailable: true,
    isDailyReportsServiceAvailable: true,
    isExerciseServiceAvailable: false,
    isFeedServiceAvailable: false,
    isLaundryServiceAvailable: true,
    isTreatmentServiceAvailable: true,
    isWaitingForApproval: false,
    isWaitingForDelivery: true,
  ),
  HomeModel(
    horseImage: Assets.homeImagesHomeHorseThree,
    owner: "علي",
    height: "6 أقدام",
    age: "6",
    color: "بني",
    name: "ذو الريش",
    site: "الرياض",
    type: "مهره",
    price: "700",
    safety: "التحقق",
    time: "42:06:55",
    fatherName: "لا شيء",
    isVaccinated: "Yes",
    motherName: "لا شيء",
    originality: "عربي أصيل",
    rating: "4.7",
    sales: "6",
    weight: "250 كلغ",
    status: "soon",
    isPaymentTransferred: true,
    isApprovedByManagement: false,
    city: "الطائف",
    canHorseRide: false,
    canJumpObstacles: false,
    isCleaningHoovesServiceAvailable: false,
    isDailyReportsServiceAvailable: true,
    isExerciseServiceAvailable: false,
    isFeedServiceAvailable: true,
    isLaundryServiceAvailable: false,
    isSold: true,
    isTreatmentServiceAvailable: true,
    isWaitingForApproval: false,
    isWaitingForDelivery: true,
  ),
];

List<WalletHistoryModel> walletHistoryList = [
  WalletHistoryModel(
      entryType: "debit",
      date: "2022/01/11",
      amount: "6400",
      doShareImage: false,
      method: "1544152"),
  WalletHistoryModel(
      entryType: "debit",
      date: "2022/01/11",
      amount: "6400",
      doShareImage: false,
      method: "1544152"),
  WalletHistoryModel(
      entryType: "credit",
      date: "2022/01/04",
      amount: "5000",
      doShareImage: true,
      method: "Apple Pay"),
];

List<String> citiesList = [
  "riyadh",
  "makkah",
  "medina",
  "al qassim",
  "al sharqiya",
  "aseer",
  "tabuk",
  "hail",
  "northern borders province",
  "jazan",
  "najran",
  "al bahah",
  "al jowf",
];
List<String> citiesListArabic = [
  "الرياض",
  "مكة المكرمة",
  "المدينة المنورة",
  "القصيم",
  "الشرقية",
  "تبوك",
  "حائل",
  "الحدود الشمالية",
  "جازان",
  "نجران",
  "الباحة",
  "الجوف",
];
List<String> banksList = [
  "saudi national bank",
  "the saudi british bank",
  "saudi investment bank",
  "alinma bank",
  "banque saudi fransi",
  "riyad bank",
  "al rajhi bank",
  "arab national bank",
  "bank albilad",
  "bank alJazira",
  "gulf international bank",
];
List<String> banksListArabic = [
  "البنك الأهلي السعودي",
  "لبنك السعودي البريطاني",
  "البنك السعودي للاستثمار",
  "مصرف الإنماء",
  "البنك السعودي الفرنسي",
  "بنك الرياض",
  "مصرف الراجحي",
  "البنك العربي الوطني",
  "بنك البلاد",
  "بنك الجزيرة",
  "بنك الخليج الدولي",
];
