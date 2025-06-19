class ConstApi {
  static const baseApiUrl = "http://inframart.goproject.in/api";
  static const getconnectionApi = "$baseApiUrl/getconnection";
  static const operatorLogin = "$baseApiUrl/login-operator";
  static const operatorLogoutapi = "$baseApiUrl/logout-operator?=null";
  static const operatorPunchIn = "$baseApiUrl/punch_in";

  static const punchOutOperator = "$baseApiUrl/punch_out";

  static const invardDetailsApi = "$baseApiUrl/store_inwards";

  static const qualitycheckApi = "$baseApiUrl/qualityCheck";

  static const qrCodeapi = "$baseApiUrl/qr_scan_store";

  static const coilSlittingApi = "$baseApiUrl/coilSlitting";
  static const catagoryApi = "$baseApiUrl/inward_type_list";

  static const subCatagoryApi = "$baseApiUrl/inward_category_list";

  static const forgetPasswordApi = "$baseApiUrl/forgot-password";
  static const verifyotp = "$baseApiUrl/verify-otp";

  static const reSetPassword = "$baseApiUrl/reset-password";

  static const vendorsListApi = "$baseApiUrl/vendor_list";

  static const coilslittingPlanSearchapi = "$baseApiUrl/searchCoilSlittingPlan";

  static const piklingPlanlistApi = "$baseApiUrl/pickling_plan_list";

  static const picklingProcessApi = "$baseApiUrl/pickling";
  static const crmplanListingApi = "$baseApiUrl/crm_plan_list";

  static const crmProcessingApi = "$baseApiUrl/cold_rolling_mill";
  static const cglPlanListingApi = "$baseApiUrl/cgl_plan_list";

  static const cglProcessApi = "$baseApiUrl/cgl_process";
  static const annealingPlanListApi = "$baseApiUrl/annealing_plan_list";
  static const skinPassPlanlistApi = "$baseApiUrl/skin_pass_plan_list";
  static const skinpassProcessApi = "$baseApiUrl/skinpass_process";
  static const miniCoilSlittingPlanapi = "$baseApiUrl/mini_slitting_plan_list";
  static const miniCoilslittingProcessApi = "$baseApiUrl/mini_slitting_process";
  static const tubeMillPlanListApi = "$baseApiUrl/tube_mill_plan_list";
  static const printQrcodeApi = "$baseApiUrl/print_qr";
}
