using System.Runtime.InteropServices;

namespace vagamesint.native_app_utility
{
    public class IosSettings
    {
#if UNITY_IOS
        [DllImport("__Internal")]
        private static extern void Open();
       
        public static void OpenAppSettings()
        {
            Open();
        }
#endif
    }
}
