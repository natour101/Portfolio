diff --git a/Portfolio/README.md b/Portfolio/README.md
index eaf7dd6feddf930ba6a3439a220bcd5b787e2447..7b8b0e0fc68d3b8369e7fd3042b797bb354fefbf 100644
--- a/Portfolio/README.md
+++ b/Portfolio/README.md
@@ -1,16 +1,14 @@
-# portfolio
+# Portfolio (Flutter Web)
 
-A new Flutter project.
+Single-page dark portfolio for **Mohammad Natour** built with Flutter (Material 3) and Firebase Firestore.
 
-## Getting Started
-
-This project is a starting point for a Flutter application.
-
-A few resources to get you started if this is your first Flutter project:
+## Structure
+- `lib/` contains all app code split into sections (hero, about, skills, projects, contact), models, and widgets.
+- `assets/images/placeholder.png` is the placeholder image used for the hero and project cards.
+- `firebase_options.dart` holds the Firebase web configuration (replace with real values before deploying).
 
-- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
-- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
-
-For help getting started with Flutter development, view the
-[online documentation](https://docs.flutter.dev/), which offers tutorials,
-samples, guidance on mobile development, and a full API reference.
+## Getting Started
+1. Ensure you have the latest stable Flutter SDK installed.
+2. Run `flutter pub get`.
+3. Update `lib/firebase_options.dart` with your Firebase project settings.
+4. Serve locally with `flutter run -d chrome` or build for the web with `flutter build web`.
