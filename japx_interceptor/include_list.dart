class IncludeList {
  static const String _includeList = 'includeList';

  static String? fromExtra(Map<String, dynamic> extra) {
    return extra[_includeList];
  }

  static Map<String, dynamic> toExtra(String includeList) {
    return <String, dynamic>{_includeList: includeList};
  }
}
