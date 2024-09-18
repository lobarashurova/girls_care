import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:girls_care/common/extensions/theme_extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    super.key,
    this.hint,
    this.controller,
    this.obscureText = false,
    this.prefixIcon,
    this.errorText,
    this.onChanged,
    this.keyboardType,
    this.inputFormatter,
    this.enabled,
    this.suffix,
    this.mask,
    this.maxLength,
    this.enabledBorderColor,
    this.background,
    this.suffixPressed,
    this.moneyInput = false,
    this.autofocus = false,
    this.padding,
    this.initialValue,
    this.textInputAction,
    this.labelText,
    this.onTap,
    this.minLines,
    this.maxLines = 1,
  });

  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffix;
  final TextEditingController? controller;
  final bool obscureText;
  final bool? enabled;
  final String? labelText;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;
  final Color? enabledBorderColor;
  final Color? background;
  final String? mask;
  final int? maxLength;
  final VoidCallback? suffixPressed;
  final bool moneyInput;
  final bool autofocus;
  final EdgeInsets? padding;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final GestureTapCallback? onTap;
  final int? maxLines;
  final int? minLines;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool passwordVisible = false;
  late MaskTextInputFormatter maskFormatter;

  @override
  void initState() {
    passwordVisible = widget.obscureText;
    super.initState();
    maskFormatter = MaskTextInputFormatter(
      mask: widget.mask,
      filter: {"#": RegExp(r'\d')},
      type: MaskAutoCompletionType.lazy,
    );
  }

  @override
  void dispose() {
    maskFormatter.clear();
    widget.controller?.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      initialValue: widget.initialValue,
      autofocus: widget.autofocus,
      enabled: widget.enabled,
      controller: widget.controller,
      onTap: widget.onTap,
      keyboardType: widget.keyboardType,
      obscureText: passwordVisible,
      cursorColor: context.colors.primary,
      textAlign: TextAlign.start,
      inputFormatters:
          widget.moneyInput ? [PriceInputFormatter()] : [maskFormatter],
      onChanged: widget.onChanged == null
          ? null
          : (phone) {
              final number = widget.moneyInput
                  ? phone.replaceAll(' ', '')
                  : maskFormatter.unmaskText(phone);
              widget.onChanged!(number);
            },
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        filled: true,
        labelText: widget.labelText,
        alignLabelWithHint: true,
        labelStyle:
            GoogleFonts.nunito(fontSize: 12, color: context.colors.display),
        fillColor: widget.background ?? context.colors.grey.withOpacity(0.2),
        hintText: widget.hint,
        errorText: widget.errorText,
        contentPadding: widget.padding ??
            const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
        prefixIcon: widget.prefixIcon == null
            ? null
            : Align(
                widthFactor: 1,
                alignment: Alignment.center,
                child: widget.prefixIcon,
              ),
        hintStyle: GoogleFonts.balooTamma2(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: context.colors.display,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: context.colors.primary2.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.colors.primary2.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.colors.primary2.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.colors.primary2),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.colors.errorColor),
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: context.colors.display,
                ),
                onPressed: () {
                  setState(() => passwordVisible = !passwordVisible);
                },
              )
            :  Padding(
              padding: const EdgeInsets.all(20.0),
              child: widget.suffix,
            ),
      ),
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: context.colors.label,
      ),
    );
  }
}

class PriceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;

    newText = newText.replaceAll(RegExp(r'\D'), '');

    String formattedText = '';
    int len = newText.length;
    for (int i = len - 1; i >= 0; i--) {
      formattedText = newText[i] + formattedText;
      if ((len - i) % 3 == 0 && i != 0) {
        formattedText = ' $formattedText';
      }
    }

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
