using System;
using Android.Util;
using UnityEngine;
using UnityEngine.UI;

public class AppSettingsActivity : MonoBehaviour, IDisposable
{
    [SerializeField]
    private Button m_GotoSettingsButton;

    private AppSettings appSettings;

    void Awake()
    {
        appSettings = new AppSettings();
    }

    private void OnEnable()
    {
        m_GotoSettingsButton.onClick.AddListener(Open);   
    }

    public void Open()
    {
        appSettings.Open();
    }

    private void OnDisable()
    {
        Dispose();
        m_GotoSettingsButton.onClick.RemoveListener(Open);
    }

    public void Dispose()
    {
        appSettings.Dispose();
    }
}
