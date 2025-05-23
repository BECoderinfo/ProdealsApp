# Razorpay SDK - Prevent R8 from removing required classes/annotations
-keep class com.razorpay.** { *; }

# Keep Razorpay annotations that are sometimes stripped
-dontwarn proguard.annotation.**
-keep @interface proguard.annotation.Keep
-keep @interface proguard.annotation.KeepClassMembers

# Keep Google Pay-related classes used by Razorpay
-keep class com.google.android.apps.nbu.paisa.inapp.client.api.** { *; }

# Prevent warnings about missing optional classes
-dontwarn com.google.android.apps.nbu.paisa.inapp.client.api.**