// import 'package:flutter/material.dart';
//
// class SidebarProvider with ChangeNotifier {
//   bool _isSidebarOpen = false;
//   bool get isSidebarOpen => _isSidebarOpen;
//
//   late final AnimationController animationController;
//   Animation<Offset>? slideAnimation; // make nullable
//
//   bool _isInitialized = false;
//   bool get isInitialized => _isInitialized;
//
//   void init(TickerProvider tickerProvider) {
//     animationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: tickerProvider,
//     );
//
//     slideAnimation = Tween<Offset>(
//       begin: const Offset(-1.0, 0.0),
//       end: const Offset(0.0, 0.0),
//     ).animate(CurvedAnimation(
//       parent: animationController,
//       curve: Curves.easeInOut,
//     ));
//
//     _isInitialized = true;
//     notifyListeners();
//   }
//
//   void toggleSidebar() {
//     if (!_isInitialized) return;
//     _isSidebarOpen = !_isSidebarOpen;
//     _isSidebarOpen ? animationController.forward() : animationController.reverse();
//     notifyListeners();
//   }
//
//   void disposeController() {
//     animationController.dispose();
//   }
// }
