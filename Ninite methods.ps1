<#(Invoke-WebRequest -Uri "https://www.jetbrains.com/toolbox/download/download-thanks.html").Links 
#Invoke-WebRequest –Uri https://www.jetbrains.com/toolbox/download/download-thanks.html
((Invoke-WebRequest -Uri "https://www.jetbrains.com/toolbox/download/download-thanks.html").Links | Where-Object class -eq “download-link”).Title

$jetbrains = Invoke-WebRequest -Uri https://www.jetbrains.com/toolbox/download/download-thanks.html
#$jetbrains | Get-Member -MemberType Property
#$jetbrains.Links | Select-Object class | Sort-Object class -Unique
#$jetbrains.Links | Where-Object class -eq 'sub-tittle no-margin-bottom'
#$jetbrains.AllElements | Get-Member
#$jetbrains.AllElements | Select-Object -ExpandProperty tagname -Unique
$jetbrains.ParsedHtml.all | Select-Object ID -Unique
$jetbrains.ParsedHTML.GetElementByID('download-link') | Select-Object -Property id
$url = 'https://www.jetbrains.com/toolbox/download/download-thanks.html'
$jetbrains2 = (Invoke-WebRequest -Uri $url).Links | Where-Object href -like *exe*
$jetbrains2 | Select-Object -Unique href | ForEach-Object { 
    #get file name
    $name = $jetbrains2 | Where-Object href -eq $_.href  | Select-Object -First 1 -ExpandProperty innerHtml 
        
        
    "going to DL $name"
        
    #get actual DL link

    $link = Invoke-WebRequest $_.href  | Select-Object -ExpandProperty Links | Where-Object href -Like *exe | Select-Object -ExpandProperty href
    
    timeout 5
        
    Invoke-WebRequest -Uri $link  -OutFile C:\Users\Kosta\Desktop -Verbose 
}        





<#$mylinks = $webrequest.ParsedHtml.getElementsByTagName('a') | ? {$_.ID -match 'download-link'} | select @{expression = {$_ .href}}

#output to screen
$mylinks | out-string -Width 400

# output to file
$mylinks | out-string -Width 400 > 'C:\Users\Kosta\Desktop\Coding Env\Playground'#>#>


$jetbrains = Invoke-WebRequest -Uri https://www.jetbrains.com/toolbox/download/download-thanks.html
$jetbrains.ParsedHtml.getElementsByTagName('p') |
    Where-Object { $_.className -eq 'sub-title no-margin-bottom' } |
    ForEach-Object { $_.getElementsByTagName('download-link') } |
    Select-Object -Expand href

$jetbrains.Links |
    Where-Object { $_.ID -eq 'download-link' } |
    Select-Object -ExpandProperty href
    $jetbrainsdownload = Select-Object -ExpandProperty href
    Write-Host $jetbraindownload.toString()
    Start-BitsTransfer -Source $jetbrainsdownload -Destination C:\Users\Kosta\Desktop