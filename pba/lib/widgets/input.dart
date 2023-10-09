import 'package:flutter/material.dart';
// ------------------------------Input Field-----------------------------

class Inputfield extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;

  const Inputfield({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
  }) : super(key: key);

  String? defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty.';
    }
    return null;
  }

  @override
  _InputfieldState createState() => _InputfieldState();
}

class _InputfieldState extends State<Inputfield> {
  final _focusNode = FocusNode();
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_validateField);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_validateField);
    super.dispose();
  }

  void _validateField() {
    setState(() {
      if (widget.validator != null) {
        errorMessage = widget.validator!(widget.controller.text);
        if (errorMessage != null) {
          widget.controller.clear(); // Clear controller on validation failure
        }
      } else {
        errorMessage = widget.defaultValidator(widget.controller.text);
        if (errorMessage != null) {
          widget.controller.clear(); // Clear controller on validation failure
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 209, 206, 206),
        hintText: widget.hintText,
        labelText: widget.labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        errorText: errorMessage,
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon)
            : null, // Display the icon if provided
      ),
      onChanged: (value) {
        // Clear the error message when the user starts typing again
        setState(() {
          errorMessage = null;
        });
      },
      focusNode: _focusNode,
      // Remove the onFieldSubmitted as it's not needed anymore
    );
  }
}

// ------------------------------Secure Field-----------------------------

class Securefield extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;

  const Securefield({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.validator,
    this.prefixIcon,
  }) : super(key: key);
  String? defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty.';
    }
    return null;
  }

  @override
  _SecurefieldState createState() => _SecurefieldState();
}

class _SecurefieldState extends State<Securefield> {
  bool _obscureText = true;
  final _focusNode = FocusNode();
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_validateField);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_validateField);
    super.dispose();
  }

  void _validateField() {
    setState(() {
      if (widget.validator != null) {
        errorMessage = widget.validator!(widget.controller.text);
      } else {
        errorMessage = widget.defaultValidator(widget.controller.text);
      }
    });
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
    _validateField();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade100,
        hintText: widget.hintText,
        labelText: widget.labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        errorText: errorMessage,
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon)
            : null, // Display the icon if provided
        suffixIcon: GestureDetector(
          onTap: _toggleVisibility,
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: _obscureText ? Colors.grey : Theme.of(context).primaryColor,
          ),
        ),
      ),
      onChanged: (value) {
        // Clear the error message when the user starts typing again
        setState(() {
          errorMessage = null;
        });
      },
      focusNode: _focusNode,
    );
  }
}

//--------------------Login input field-------------------------
class LoginInputfield extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  final bool obscureText;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;

  const LoginInputfield({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
  }) : super(key: key);

  String? defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty.';
    }
    return null;
  }

  @override
  _InputfieldState createState() => _InputfieldState();
}

class _LoginInputfieldState extends State<Inputfield> {
  final _focusNode = FocusNode();
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_validateField);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_validateField);
    super.dispose();
  }

  void _validateField() {
    setState(() {
      if (widget.validator != null) {
        errorMessage = widget.validator!(widget.controller.text);
      } else {
        errorMessage = widget.defaultValidator(widget.controller.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: InputBorder.none,
        errorText: errorMessage,
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon)
            : null, // Display the icon if provided
      ),
      onChanged: (value) {
        // Clear the error message when the user starts typing again
        setState(() {
          errorMessage = null;
        });
      },
      focusNode: _focusNode,
      // Remove the onFieldSubmitted as it's not needed anymore
    );
  }
}
