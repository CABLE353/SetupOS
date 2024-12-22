Dim oShell, strPath1, strPath2

Set oShell = CreateObject("WScript.Shell")

strPath1 = """E:/setup.exe"""
strPath2 = """X:/Windows/System32/switch.vbs"""

oShell.Run strPath1
oShell.Run strPath2

oShell.AppActivate "setup.exe"
oShell.AppActivate "switch.vbs"

oShell.SendKeys "%{TAB}"