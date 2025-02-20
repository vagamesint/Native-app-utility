using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;

namespace vagamesint.native_app_utility
{
    public class IosAlert
    {
#if UNITY_IOS
        [DllImport("__Internal")]
        private static extern void ShowAlert(string title, string message);
        [DllImport("__Internal")]
        private static extern void ShowToast(string message, double timer);

        public static void ShowAlertBox(string title, string message)
        {
            ShowAlert(title, message);
        }

        public static void ShowToast()
        {
            ShowToast("Some message...", 3.0);
        }
#endif
    }
}
