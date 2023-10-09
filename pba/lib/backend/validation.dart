// import 'package:email_validator/email_validator.dart';

// class Validations {
//   RegExp Grn_Format = RegExp(r'^(M|F)\d{8,9}$', caseSensitive: true);
//   RegExp Phone_Format = RegExp(r'^[0-9]{10}$');
//   RegExp Aadhar_Format = RegExp(r'^[0-9]{12}$');
//   RegExp Wing_Format = RegExp(r'^W[1-6]$', caseSensitive: true);

//   static String? validate_grn(String? value) {
//     if (!Validations().Grn_Format.hasMatch(value!)) {
//       return "Enter a valid GRN";
//     }

//     return null;
//   }

//   static String? validate_phone(String? value) {
//     if (!Validations().Phone_Format.hasMatch(value!)) {
//       return "Enter a valid Phone No. ";
//     }

//     return null;
//   }

//   static String? validate_aadhar(String? value) {
//     if (!Validations().Aadhar_Format.hasMatch(value!)) {
//       return "Enter a valid Aadhar No. ";
//     }

//     return null;
//   }

//   static String? validate_email(String? value) {
//     if (!EmailValidator.validate(value!)) {
//       return "Enter a valid Email_id";
//     }

//     return null;
//   }

//   static String? validate_wing(String? value) {
//     if (!Validations().Wing_Format.hasMatch(value!)) {
//       return "Enter a valid Wing";
//     }

//     return null;
//   }
// }
