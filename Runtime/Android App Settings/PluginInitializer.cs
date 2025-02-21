using System;
using UnityEngine;

namespace Android.Util
{
    public class PluginInitializer : IDisposable
    {
        private AndroidJavaObject pluginInstance;
        private AndroidJavaClass unityClass;
        private AndroidJavaObject unityActivity;

        public AndroidJavaObject CurretActivity => unityActivity;
        public AndroidJavaObject PluginInstance => pluginInstance;

        public PluginInitializer(string packageName)
        {
            Initialize("com.android.util." + packageName);
        }

        private void Initialize(string pluginName)
        {
            unityClass = new AndroidJavaClass("com.unity3d.player.UnityPlayer");
            unityActivity = unityClass.GetStatic<AndroidJavaObject>("currentActivity");
            pluginInstance = new AndroidJavaObject(pluginName);
        }

        public void Dispose()
        {
            unityClass.Dispose();
            unityActivity.Dispose();
            pluginInstance.Dispose();
        }
    }
}

