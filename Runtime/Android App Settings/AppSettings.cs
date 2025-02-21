using System;

namespace Android.Util
{
    public class AppSettings : IDisposable
    {
        private PluginInitializer pluginInitializer;

        public AppSettings() 
        {
            pluginInitializer = new PluginInitializer("Settings");
        }

        public void Dispose()
        {
            pluginInitializer.Dispose();
        }

        public void Open()
        {
            if (pluginInitializer.PluginInstance != null)
            {
                pluginInitializer.PluginInstance.Call("OpenAppInfo", pluginInitializer.CurretActivity);
            }
        }

    }
}