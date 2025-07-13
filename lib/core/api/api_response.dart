import 'package:flutter/material.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String message = "";
  bool isLoading;

  ApiResponse({
    this.message = "Unknown error occurred",
    this.data,
    this.status,
    this.isLoading = false,
  });
  ApiResponse.completed(this.data)
      : status = Status.completed,
        isLoading = false;
  ApiResponse.error(this.message)
      : status = Status.error,
        isLoading = false;
  ApiResponse.init()
      : status = null,
        data = null,
        message = '',
        isLoading = false;

  bool isInitialState() => !(status == Status.completed && data != null);
  bool get isSuccess => status == Status.completed;
  bool get isError => status == Status.error;

  ApiResponse<T> copiedLoading(bool isLoading) => ApiResponse<T>(
        status: Status.loading,
        data: data,
        message: message,
        isLoading: isLoading,
      );

  ApiResponse<T> copiedError(String errorMessage) => ApiResponse<T>(
        status: Status.error,
        data: null,
        message: errorMessage,
        isLoading: false,
      );

  ApiResponse<T> copiedSuccess(T? response) => ApiResponse<T>(
        status: Status.completed,
        data: response,
        message: message,
        isLoading: false,
      );

  Widget when({
    required Widget Function(T data) done,
    required Widget Function(String message) error,
    required Widget Function() loading,
  }) {
    switch (status) {
      case Status.idle:
        {
          return const SizedBox.shrink();
        }
      case Status.loading:
        {
          return loading();
        }
      case Status.completed:
        {
          return done(data as T);
        }
      case Status.error:
        {
          return error(message);
        }
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  bool operator ==(covariant ApiResponse other) => identical(this, other);

  @override
  int get hashCode => Object.hash(status, data, message, isLoading);

  @override
  String toString() => "Status : $status \n Message : $message \n Data : $data";
}

enum Status { idle, loading, completed, error }






// <manifest xmlns:android="http://schemas.android.com/apk/res/android">
//     <uses-permission android:name="android.permission.INTERNET"/>
//     <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
//     <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
//     <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
//     <application
//         android:label="Igbigi"
//         android:name="${applicationName}"
//         android:icon="@mipmap/ic_launcher"
//         android:usesCleartextTraffic="true">
       
//         <activity
//             android:name=".MainActivity"
//             android:exported="true"
//             android:launchMode="singleTop"
//             android:theme="@style/LaunchTheme"
//             android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
//             android:hardwareAccelerated="true"
//             android:windowSoftInputMode="adjustResize">
//             <!-- Specifies an Android theme to apply to this Activity as soon as
//                  the Android process has started. This theme is visible to the user
//                  while the Flutter UI initializes. After that, this theme continues
//                  to determine the Window background behind the Flutter UI. -->
//             <meta-data
//               android:name="io.flutter.embedding.android.NormalTheme"
//               android:resource="@style/NormalTheme"
//               />
//             <intent-filter>
//                 <action android:name="android.intent.action.MAIN"/>
//                 <category android:name="android.intent.category.LAUNCHER"/>
//             </intent-filter>
//         </activity>
//         <!-- Don't delete the meta-data below.
//              This is used by the Flutter tool to generate GeneratedPluginRegistrant.java -->
//         <meta-data
//             android:name="flutterEmbedding"
//             android:value="2" />  
//     </application>
// </manifest>