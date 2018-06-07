<#(Invoke-WebRequest -Uri "https://www.jetbrains.com/toolbox/download/download-thanks.html").Links 
#Invoke-WebRequest –Uri https://www.jetbrains.com/toolbox/download/download-thanks.html
((Invoke-WebRequest -Uri "https://www.jetbrains.com/toolbox/download/download-thanks.html").Links | Where-Object class -eq “download-link”).Title#>

$jetbrains = Invoke-WebRequest -Uri https://www.jetbrains.com/toolbox/download/download-thanks.html
#$jetbrains | Get-Member -MemberType Property
#$jetbrains.Links | Select-Object class | Sort-Object class -Unique
#$jetbrains.Links | Where-Object class -eq 'sub-tittle no-margin-bottom'
#$jetbrains.AllElements | Get-Member
#$jetbrains.AllElements | Select-Object -ExpandProperty tagname -Unique
$jetbrains.ParsedHtml.all | Select-Object ID -Unique
#$jetbrains.ParsedHtml.all | Select-Object download-link
$jetbrainsdownload = $jetbrains.ParsedHtml.all | Where-Object {$_.href -like "https*"} | Where-Object ID -eq "download-link".Title

Start-BitsTransfer -Source $jetbrainsdownload -Destination C:\Users\Kosta\Desktop



<#$mylinks = $webrequest.ParsedHtml.getElementsByTagName('a') | ? {$_.ID -match 'download-link'} | select @{expression = {$_ .href}}

#output to screen
$mylinks | out-string -Width 400

# output to file
$mylinks | out-string -Width 400 > 'C:\Users\Kosta\Desktop\Coding Env\Playground'#>
