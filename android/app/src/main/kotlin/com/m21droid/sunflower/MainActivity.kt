package com.m21droid.sunflower

import androidx.core.view.WindowCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity(), MethodChannel.MethodCallHandler {

    private var methodChannel: MethodChannel? = null

    override fun onPostResume() {
        super.onPostResume()

        WindowCompat.setDecorFitsSystemWindows(window, false)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        methodChannel = MethodChannel(flutterEngine.dartExecutor, "geo_api_key").apply {
            setMethodCallHandler(this@MainActivity)
        }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "requestGeoApiKey" -> {
                result.success(getString(R.string.geo_api_key))
            }
        }
    }

}
