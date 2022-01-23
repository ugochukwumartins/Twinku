class ApiPath {
  static String Post(String uid, String PostId) => 'users/$uid/Posts/$PostId';
  static String Posts(String uid) => 'users/$uid/Posts';
}
