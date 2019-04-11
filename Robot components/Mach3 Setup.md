[Mach3 will crash windows 7 after certain updates](https://support.machmotion.com/books/knowledge-base/page/mach3-shutting-down-pc-on-launch)

To fix this, launch cmd.exe as administrator and run the following lines:
```
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 3 /f

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f
```

Mach3 Motor Outputs for TB6600HG Driver:

Signal |Step Pin# | Dir Pin#
-|-|-
X Axis | 2 | 3
Y Axis | 4 | 5
Z Axis | 6 | 7
