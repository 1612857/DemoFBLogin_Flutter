
class LoopBackConfig {
//  static String _path = 'https://colleagues-server.herokuapp.com';
//  static String _path = 'https://colleagues-app-dev.herokuapp.com';
//  static String _path = 'http://192.168.1.139:3001';
  static String _path = 'http://colleagues-api.ap-southeast-1.elasticbeanstalk.com';
  static String _web_path = 'https://datlich.mcom.app';
  static String _imagePath = 'https://s3-colleagues-dev.s3.ap-northeast-1.amazonaws.com';
  static String _version = 'api';
  static String _authPrefix = '';

  static String _uploadContainer = 's3-colleagues-dev';

  static void setUploadContainer([String container = '']) {
    LoopBackConfig._uploadContainer = container;
  }

  static String getUploadContainer() {
    return LoopBackConfig._uploadContainer;
  }

  static void setApiVersion([String version = 'api']) {
    LoopBackConfig._version = version;
  }

  static String getApiVersion() {
    return LoopBackConfig._version;
  }

  static void setBaseURL([String url = '/']) {
    LoopBackConfig._path = url;
  }

  static String getPath() {
    return LoopBackConfig._path;
  }

  static void setBaseWebpath([String url = '/']) {
    LoopBackConfig._web_path = url;
  }

  static String getWebPath() {
    return LoopBackConfig._web_path;
  }

  static String buildDeepLinkPath(String cardId) {
    return 'https://acrossmti.page.link/?link=${LoopBackConfig._web_path}${cardId}&apn=mtivn.product.across&ibi=mtivn.product.across&isi=1392334224';
  }

  static void setAuthPrefix([String authPrefix = '']) {
    LoopBackConfig._authPrefix = authPrefix;
  }

  static String getAuthPrefix() {
    return LoopBackConfig._authPrefix;
  }

  static void setBaseImagepath([String url = '/']) {
    LoopBackConfig._imagePath = url;
  }

  static String getImagePath(String id) {
//    if (id != null && id.startsWith('http')) {
//      return id;
//    }
    return LoopBackConfig._imagePath + '/$id';
//    return '${LoopBackConfig._path}/image/${id}?key=${DepartmentService().auth.accessToken().id}';
  }
}
