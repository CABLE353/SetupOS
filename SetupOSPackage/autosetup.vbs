Dim oShell, strPath1, strAttr1, strAttr2
Set oShell = CreateObject("WScript.Shell")
strPath1 = """setup.exe"""
oShell.Run strPath1

oShell.AppActivate "setup.exe"
WScript.Sleep 30000
oShell.SendKeys "{TAB}"
WScript.Sleep 200
oShell.SendKeys "{TAB}"
WScript.Sleep 200
oShell.SendKeys "{TAB}"
WScript.Sleep 200
oShell.SendKeys "{ENTER}"
WScript.Sleep 200
oShell.SendKeys "{ENTER}"
WScript.Sleep 30000
oShell.SendKeys "%{TAB}"
WScript.Sleep 200
oShell.SendKeys " "
WScript.Sleep 200
oShell.SendKeys "{TAB}"
WScript.Sleep 200
oShell.SendKeys "{ENTER}"
WScript.Sleep 200
oShell.SendKeys "{TAB}"
WScript.Sleep 200
oShell.SendKeys "{ENTER}"
WScript.Sleep 1000
oShell.SendKeys "{TAB}"
WScript.Sleep 1000
oShell.SendKeys "{TAB}"
WScript.Sleep 1000
oShell.SendKeys "{ENTER}"
WScript.Sleep 1000
oShell.SendKeys "{TAB}"
WScript.Sleep 1000
oShell.SendKeys "{ENTER}"
WScript.Sleep 1000
oShell.SendKeys "{ENTER}"
WScript.Sleep 2000
oShell.SendKeys "{TAB}"
WScript.Sleep 300
oShell.SendKeys "{TAB}"
WScript.Sleep 300
oShell.SendKeys "{TAB}"
WScript.Sleep 300
oShell.SendKeys "{TAB}"
WScript.Sleep 300
oShell.SendKeys "{TAB}"
WScript.Sleep 300
oShell.SendKeys "{ENTER}"
