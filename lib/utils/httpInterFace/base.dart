class BaseType {
    String messgae;
    int status;
    int get statuss => status;
    set statuss(int _status) {
      this.status = _status;
    }
    String get message => messgae;
    set message(String _message) {
      this.messgae = _message;
    }
    
}