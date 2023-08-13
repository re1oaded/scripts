:: reference: https://gist.github.com/aivrit/fdfee71e969ba62670ed0b87c26f3aad
:: fix_windows_time.ps1
:: $time = Invoke-RestMethod -Uri http://worldtimeapi.org/api/ip
:: $timezones = Get-TimeZone -ListAvailable
:: foreach ($timezone in $timezones) {
::     if ($timezone.DisplayName.ToString() -match $time.timezone.Split("/")[-1]) {
::         $current_zone = $timezone
::         break
::     }
:: }
:: if (!$current_zone) {throw "Could'nt find time zone. exiting."}
:: Set-TimeZone -Name $current_zone.StandardName
:: Set-Date -Date (Get-Date -Date $time.datetime)

set timezone=America/Los_Angeles

set win_timezone=Pacific Standard Time

set "ps=$time = Invoke-RestMethod -Uri https://worldtimeapi.org/api/timezone/%timezone%;"
set "ps=%ps% Set-TimeZone -Name '%win_timezone%';"
set "ps=%ps% Set-Date -Date (Get-Date -Date $time.datetime);"

powershell -ExecutionPolicy Bypass -NoProfile -NoLogo -Command "%ps%"
