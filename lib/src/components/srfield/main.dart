import 'package:flutter/material.dart';
import 'package:sunrise_ui/src/constants/srcolor/main.dart';
import 'package:sunrise_ui/src/constants/srfont/main.dart';

class SRField extends StatefulWidget {
  final String? srHint;
  final bool srSecure;
  final TextInputType srKeyboardtype;
  final bool srEnable;
  final Function(String value)? srOnChange;
  final String? srErrorTxt;
  final Color? srBaseColor;
  final Color? srBaseLabelColor;
  final int? srMaxLength;
  final bool? srCalendar;
  final Function(DateTime value)? srCallbackCalendar;
  final String? srValue;
  const SRField(
      {super.key,
      this.srHint = 'Text Hint!',
      this.srSecure = false,
      this.srKeyboardtype = TextInputType.text,
      this.srEnable = true,
      this.srOnChange,
      this.srErrorTxt,
      this.srBaseColor = Colors.white,
      this.srBaseLabelColor = Colors.white,
      this.srMaxLength,
      this.srCalendar = false,
      this.srCallbackCalendar,
      this.srValue});

  @override
  State<SRField> createState() => _SRFieldState();
}

class _SRFieldState extends State<SRField> {
  bool secure = false;
  bool isEmpty = true;
  late TextEditingController textEditingController;
  late FocusNode focusNode = FocusNode()
    ..addListener(() {
      setState(() {});
    });

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
    setState(() {
      secure = widget.srSecure;
    });
  }

  @override
  void didUpdateWidget(covariant SRField oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget != oldWidget) {
      textEditingController.text = widget.srValue ?? '';
    }
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onTap: () => {
        // if (widget.srCalendar == true)
        //   {
        //     CFormCalendar(
        //         context: context,
        //         onCallBack: (newDateTime) =>
        //             widget.ipCallbackCalendar?.call(newDateTime))
        //   }
      },
      readOnly: widget.srCalendar ?? false,
      maxLength: widget.srMaxLength,
      focusNode: focusNode,
      onChanged: (value) {
        setState(() {
          isEmpty = value.isEmpty ? true : false;
        });
        widget.srOnChange?.call(value);
      },
      textAlignVertical: widget.srSecure == true
          ? TextAlignVertical.center
          : TextAlignVertical.top,
      enabled: widget.srEnable,
      keyboardType: widget.srKeyboardtype,
      obscureText: secure,
      style: TextStyle(color: widget.srBaseColor, fontSize: SRFont.large),
      cursorColor: SRColor.baseYellow,
      decoration: InputDecoration(
        labelText: widget.srHint,
        labelStyle: TextStyle(
            color: widget.srErrorTxt != null
                ? Colors.red
                : (focusNode.hasFocus
                    ? SRColor.baseYellow
                    : widget.srBaseLabelColor)),
        errorStyle:
            const TextStyle(fontSize: SRFont.medium3, color: Colors.red),
        errorText: widget.srErrorTxt,
        contentPadding:
            EdgeInsets.only(left: 15, right: widget.srSecure == true ? 0 : 15),
        suffixIcon: widget.srSecure == true
            ? InkWell(
                onTap: () {
                  setState(() {
                    secure = secure == false ? true : false;
                  });
                },
                child: const Icon(
                  Icons.remove_red_eye,
                  color: Colors.white,
                  size: 25,
                ),
              )
            : null,
        border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: SRColor.baseYellow)),
      ),
    );
  }
}
