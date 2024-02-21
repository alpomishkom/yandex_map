package com.example.yandex_map

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine;
import com.yandex.mapkit.MapKitFactory;

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("5d6635a4-578e-47dd-b911-7221fe7c81d2")
        super.configureFlutterEngine(flutterEngine)
    }
}
