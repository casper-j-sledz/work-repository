> # work-repository
>> ```powershell
>> git submodule update --init --recursive
>> git submodule foreach git pull origin main
>> git submodule foreach git reset --hard "origin/main"
>> Set-Location notes
>> Set-Location power-shell