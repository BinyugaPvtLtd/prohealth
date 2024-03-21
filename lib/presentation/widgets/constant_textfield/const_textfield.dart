import 'package:flutter/material.dart';

///prachi to do textfield constant widget
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final double height;
  final double cursorHeight;
  final String labelText;
  final TextStyle labelStyle;
  final double labelFontSize;
  final Icon? suffixIcon;
  final IconData? prefixIcon;
  final FocusNode focusNode;

  CustomTextField({
    required this.width,
    required this.height,
    required this.cursorHeight,
    required this.labelText,
    required this.labelStyle,
    this.suffixIcon,
    this.prefixIcon,
    required this.controller,
    required this.focusNode,
    required this.labelFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          focusNode: focusNode,
          controller: controller,
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: MediaQuery.of(context).size.width / 87),
          textAlignVertical: TextAlignVertical.center,
          cursorHeight: cursorHeight,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3, top: 5, left: 2),
            border: OutlineInputBorder(),
            labelText: labelText,
            labelStyle: labelStyle.copyWith(fontSize: labelFontSize),
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
// ///prachi
// class ImpexTextField extends StatefulWidget {
//   final TextEditingController controller;
//   final bool obscureText;
//   final TextInputType keyboardType;
//   final String labelText;
//   final int maxLines;
//   final TextInputAction textInputAction;
//   final void Function(String) onSubmitted;
//   final bool autofocus;
//
//   const ImpexTextField(
//       {required this.controller,
//       required this.obscureText,
//       required this.keyboardType,
//       required this.labelText,
//       this.maxLines = 1,
//       required this.textInputAction,
//       required this.onSubmitted,
//       this.autofocus = false});
//
//   @override
//   _ImpexTextFieldState createState() => _ImpexTextFieldState();
// }
//
// class _ImpexTextFieldState extends State<ImpexTextField> {
//   FocusNode _focusNode = FocusNode();
//   // Paint paint;
//
//   InputDecoration buildTextInputDecoration(
//     String labelText,
//     TextEditingController controller,
//   ) {
//     return InputDecoration(
//       contentPadding: EdgeInsets.symmetric(horizontal: 3, vertical: 20),
//
//       labelText: labelText,
//       labelStyle: TextStyle(
//         color: Colors.grey,
//         height: 0.8,
//         // background: paint,
//       ),
//       fillColor: Colors.transparent,
//       filled: true,
//       enabledBorder: OutlineInputBorder(
//         borderSide: const BorderSide(
//           color: Color(0xffB1B1B1),
//           width: 1.0,
//         ),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderSide: const BorderSide(
//           color: Color(0xffB1B1B1),
//           width: 2.0,
//         ),
//       ),
//       // suffixIcon: InkWell(
//       //   onTap: () => controller.clear(),
//       //   child: Icon(Icons.cancel),
//       // ),
//       // prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 160,
//       height: 35,
//       child: TextField(
//         cursorHeight: 14,
//         textAlign: TextAlign.start,
//         textAlignVertical: TextAlignVertical.center,
//         focusNode: _focusNode,
//         controller: widget.controller,
//         obscureText: widget.obscureText ?? false,
//         maxLines: widget.maxLines,
//         textInputAction: widget.textInputAction,
//         decoration:
//             buildTextInputDecoration(widget.labelText, widget.controller),
//         keyboardType: widget.keyboardType,
//         autofocus: widget.autofocus,
//         onSubmitted: widget.onSubmitted,
//         onTap: () => setState(() {
//           FocusScope.of(context).requestFocus(_focusNode);
//         }),
//         style: TextStyle(
//           fontSize: 14, // Adjust the font size to your desired value
//         ),
//       ),
//     );
//     // Container(
//     //   height: 20,
//     //   width: 70,
//     //   child: ListView(
//     //     shrinkWrap: true,
//     //     physics: ClampingScrollPhysics(),
//     //     children: <Widget>[
//     //       // Container(height: 12),
//     //       TextField(
//     //         textAlign: TextAlign.start,
//     //         textAlignVertical: TextAlignVertical.center,
//     //         focusNode: _focusNode,
//     //         controller: widget.controller,
//     //         obscureText: widget.obscureText ?? false,
//     //         maxLines: widget.maxLines,
//     //         textInputAction: widget.textInputAction,
//     //         decoration:
//     //             buildTextInputDecoration(widget.labelText, widget.controller),
//     //         keyboardType: widget.keyboardType,
//     //         autofocus: widget.autofocus,
//     //         onSubmitted: widget.onSubmitted,
//     //         onTap: () => setState(() {
//     //           FocusScope.of(context).requestFocus(_focusNode);
//     //         }),
//     //       ),
//     //     ],
//     //   ),
//     // );
//   }
//
//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }
// }
