Write-Host 
"
╔═══╗──────────╔╗──╔═══╗╔╗──╔═══╦═══╗
║╔═╗║──────────║║──║╔═╗╠╝╚╗─║╔═╗║╔═╗║
║╚══╦══╦══╦═╦══╣╚═╗║║─╚╬╗╔╝─║╚═╝║╚══╗
╚══╗║║═╣╔╗║╔╣╔═╣╔╗║║║╔═╬╣╠══╣╔══╩══╗║
║╚═╝║║═╣╔╗║║║╚═╣║║║║╚╩═║║╚╦═╣║──║╚═╝║
╚═══╩══╩╝╚╩╝╚══╩╝╚╝╚═══╩╩═╝─╚╝──╚═══╝
SearchGit-ps is a simple PowerShell search engine for Github."
Write-Host ""

function gitSearch {
    
Write-Host "If you type more then one word, add a '+' in between.
Example: 'Windows+hacking' = 'windows hacking'.

"
    $find = Read-Host "Type of Git to search"
    $url = 'https://github.com/search?q=' + $find
    Write-Host ""
    Write-Host "Here is a list of the top 10 results:"
    $contributors = Invoke-WebRequest -Uri $url -UseBasicParsing
    $contributors.Links| Where-Object class -EQ "v-align-middle" | Select-Object href | Out-String
    Write-Output $output

}

gitSearch

function Get-Menu {

    Write-Host 
    "
    Options:

    Want to explore a 'Git-README'? Type 1
    
    Want to download a 'Git-Repo'? Type 2 
    (After webpage loads press the green 'Code' button to choose your download choice.)
    
    Want to exit? Type 3

    "
    $choice = Read-Host "Type number here"
    Write-Host ""
    if ([string]1 -eq $choice )

    {
    $add = Read-Host "Copy and past an above repo here"
    $url2 = 'https://raw.githubusercontent.com' + $add + '/master/README.md'
    $contributors2 = Invoke-WebRequest -Uri $url2 -UseBasicParsing
    $contributors2.RawContent | Out-String
    Write-Output $output
    Write-Host "

    "
    Write-Host 
    "
    Options:

    Want to download the 'Git-Repo'? Type 1 
    (After webpage loads press the green 'Code' button to choose your download choice.)
    
    Want to exit? Type 2
    
    "
    $choice2 = Read-Host "Type number here"

        if ([string]1 -eq $choice2 ) 
        {
        $test = 'https://github.com' + $add
        Start-Process $test
        }
        if ([string]2 -eq $choice2 )
        {
        exit
        clear
        }
     

    }

    if ([string]2 -eq $choice )

    {
    $add1 = Read-Host "Copy and past an above repo here"
    $test = 'https://github.com' + $add1
    Start-Process $test
    }

    if ([string]3 -eq $choice )

    {
    exit
    clear
    }

}

Get-Menu
