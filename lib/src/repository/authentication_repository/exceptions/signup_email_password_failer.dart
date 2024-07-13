class SignUpWithEmailAndPasswordFailer {
  final String message;
  const SignUpWithEmailAndPasswordFailer(
      [this.message = "An Unknown error occured"]);

  factory SignUpWithEmailAndPasswordFailer.code(String code) {
    switch (code) {
      case 'weak password':
        return SignUpWithEmailAndPasswordFailer(
            'Please enter a strongger password');
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailer(
            'Email is not valid or badly formatted');
      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailer(
            'An account already exist for that email');
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailer(
            'Operation is not allowed. Please contact support');
      case 'user-disabled':
        return SignUpWithEmailAndPasswordFailer(
            'This user has been disabled. Please contact support for help');
      case 'wrong-password':
        return SignUpWithEmailAndPasswordFailer(
            'Incorrect password. Please try again.');
      default:
        return SignUpWithEmailAndPasswordFailer();
    }
  }
}
