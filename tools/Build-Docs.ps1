# Generates readable Markdown versions of the guides in docs/, with quest, item and spell links to Wowhead,
# and links the guide and quest names in README.md to them.
# Usage: powershell -ExecutionPolicy Bypass -File tools/Build-Docs.ps1

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$docsDir = Join-Path $root 'docs'
$wowhead = 'https://www.wowhead.com/forever'
$utf8 = New-Object System.Text.UTF8Encoding $false

# Emoji are built from code points so this file stays ASCII (Windows PowerShell reads BOM-less scripts as ANSI).
function E([int[]]$codes) { ($codes | ForEach-Object { [char]::ConvertFromUtf32($_) }) -join '' }
$ico = @{
    pin = E 0x1F4CD; talk = E 0x1F4AC; accept = E 0x2757; turnin = E 0x2705; goal = E 0x1F3AF
    bag = E 0x1F392; use = E 0x1F590, 0xFE0F; spell = E 0x2728; fly = E 0x2708, 0xFE0F; home = E 0x1F3E0
    walk = E 0x1F6B6; warn = E 0x26A0, 0xFE0F; book = E 0x1F4D6; loop = E 0x1F501; kill = E 0x2694, 0xFE0F
    map = E 0x1F5FA, 0xFE0F
}

# uiMapIDs used by the guides
$mapNames = @{
    '1414' = 'Kalimdor'; '1415' = 'Eastern Kingdoms'; '1426' = 'Dun Morogh'; '1431' = 'Duskwood'
    '1433' = 'Redridge Mountains'; '1436' = 'Westfall'; '1437' = 'Wetlands'; '1438' = 'Teldrassil'
    '1439' = 'Darkshore'; '1450' = 'Moonglade'; '1453' = 'Stormwind City'; '1455' = 'Ironforge'
    '1457' = 'Darnassus'; 'StormwindClassic' = 'Stormwind City'
}
$continents = @('1414', '1415')

$sources = Get-Content (Join-Path $root 'RXPGuides_Dungeons.toc') |
    Where-Object { $_ -match '\.lua\s*$' } | ForEach-Object { $_.Trim() }

# --- Parse ---------------------------------------------------------------------------------------------------

$guides = @()
foreach ($src in $sources) {
    $text = [IO.File]::ReadAllText((Join-Path $root $src), $utf8)
    $blocks = [regex]::Matches($text, 'RegisterGuide\(\[\[(.*?)\]\]\)', 'Singleline')
    foreach ($b in $blocks) {
        $g = [ordered]@{ Source = $src; Header = @{}; Items = New-Object System.Collections.ArrayList }
        $step = $null
        foreach ($raw in ($b.Groups[1].Value -split "`r?`n")) {
            $line = $raw.Trim()
            if ($line -eq '') { continue }
            if ($line -eq 'step') {
                $step = @{ Kind = 'step'; Lines = New-Object System.Collections.ArrayList }
                [void]$g.Items.Add($step)
            } elseif ($line.StartsWith('--')) {
                $step = $null
                [void]$g.Items.Add(@{ Kind = 'section'; Title = $line.TrimStart('-').Trim() })
            } elseif ($null -eq $step) {
                if ($line -match '^#(\w+)\s*(.*)$') { $g.Header[$Matches[1]] = $Matches[2] }
                elseif ($line -match '^<<\s*(.*)$') { $g.Header['faction'] = $Matches[1] }
            } else {
                [void]$step.Lines.Add($line)
            }
        }
        $guides += $g
    }
}

# Quest names from the accept/turn-in text, item names from .collect comments and item icons next to .use
$quests = @{}
$items = @{}
$itemByName = @{}
function Strip-Color([string]$s) { ($s -replace '\|c(RXP_[A-Z]+_|[0-9a-fA-F]{8})', '') -replace '\|r', '' }
function Bracket-Names([string]$s) {
    [regex]::Matches($s, '\|T[^|]*\|t\[((?:[^\]|]|\|c[A-Za-z_]+|\|r)+)\]') | ForEach-Object { Strip-Color $_.Groups[1].Value }
}
function Add-Item($id, $name) {
    if (-not $items.ContainsKey($id)) { $items[$id] = $name }
    if (-not $itemByName.ContainsKey($name)) { $itemByName[$name] = $id }
}
foreach ($g in $guides) {
    foreach ($s in ($g.Items | Where-Object { $_.Kind -eq 'step' })) {
        $unnamedUses = @()
        $names = @()
        foreach ($l in $s.Lines) {
            if ($l -match '^\.(accept|turnin)\s+-?(\d+)\s*>>\s*(?:Accept|Turn in)\s+(.+)$') {
                if (-not $quests.ContainsKey($Matches[2])) { $quests[$Matches[2]] = $Matches[3].Trim() }
            }
            if ($l -match '^\.collect\s+(\d+)[^-]*--\s*(.+?)\s*(\(\d+\))?$') { Add-Item $Matches[1] $Matches[2] }
            if ($l -match '^\.use\s+(\d+)\s*--\s*(.+)$') { Add-Item $Matches[1] $Matches[2].Trim() }
            elseif ($l -match '^\.use\s+(\d+)\s*>>(.*)$') {
                $n = @(Bracket-Names $Matches[2])
                if ($n.Count -ge 1) { Add-Item $Matches[1] $n[0] }
            }
            elseif ($l -match '^\.use\s+(\d+)\s*$') { $unnamedUses += $Matches[1] }
            $names += @(Bracket-Names $l)
        }
        # A bare ".use ID" next to exactly one unknown item icon in the step text names that item
        $unknown = @($names | Select-Object -Unique | Where-Object { -not $itemByName.ContainsKey($_) })
        $unnamedUses = @($unnamedUses | Where-Object { -not $items.ContainsKey($_) })
        if ($unnamedUses.Count -eq 1 -and $unknown.Count -eq 1) { Add-Item $unnamedUses[0] $unknown[0] }
    }
}

# --- Render --------------------------------------------------------------------------------------------------

function Quest-Link($id) {
    $name = if ($quests.ContainsKey($id)) { $quests[$id] } else { "Quest $id" }
    "[$name]($wowhead/quest=$id)"
}
function Item-Link($id) { "[$($items[$id])]($wowhead/item=$id)" }
function Item-Name-Link($name) {
    if ($itemByName.ContainsKey($name)) { Item-Link $itemByName[$name] } else { "**$name**" }
}

function Convert-Text([string]$s) {
    $s = $s -replace '\|Tinterface/worldmap/chatbubble_64grey\.blp:\d+\|t', ''
    $s = [regex]::Replace($s, '\|T[^|]*\|t\[((?:[^\]|]|\|c[A-Za-z_]+|\|r)+)\]',
        [Text.RegularExpressions.MatchEvaluator] { param($m) Item-Name-Link (Strip-Color $m.Groups[1].Value) })
    $s = $s -replace '\|T[^|]*\|t', ''
    $s = [regex]::Replace($s, '\|cRXP_LOOT_([^|]*)\|r',
        [Text.RegularExpressions.MatchEvaluator] { param($m) Item-Name-Link $m.Groups[1].Value })
    $s = $s -replace '\|cRXP_(FRIENDLY|ENEMY|PICK)_([^|]*)\|r', '**$2**'
    ((Strip-Color $s) -replace '\s{2,}', ' ').Trim()
}

function Text-Bullet([string]$raw) {
    $prefix = if ($raw -match 'chatbubble') { $ico.talk } elseif ($raw -match '^\s*\|cRXP_WARN_') { $ico.warn } else { '' }
    (($prefix + ' ' + (Convert-Text $raw))).Trim()
}

function Location($s) {
    $gotos = @($s.Lines | Where-Object { $_ -match '^\.goto ' })
    if ($gotos.Count -eq 0) { return $null }
    $parts = ($gotos[-1] -replace '^\.goto\s+', '' -replace '\s*>>.*$', '') -split ','
    $map = $parts[0].Trim()
    $id = ($map -split '/')[0]
    if ($continents -contains $id) { return $null }
    $zone = if ($mapNames.ContainsKey($id)) { $mapNames[$id] } else { $map }
    if ($map -match '/') { return $zone }  # world coordinates, not map percentages
    $x = ([double]$parts[1]).ToString('0.0', [Globalization.CultureInfo]::InvariantCulture)
    $y = ([double]$parts[2]).ToString('0.0', [Globalization.CultureInfo]::InvariantCulture)
    "$zone $x, $y"
}

function Step-Bullets($s) {
    $out = New-Object System.Collections.ArrayList
    $kills = @()
    foreach ($l in $s.Lines) {
        $text = if ($l -match '>>(.*)$') { $Matches[1].Trim() } else { '' }
        switch -Regex ($l) {
            '^>>' { [void]$out.Add((Text-Bullet $text)); break }
            '^\.accept\s+(\d+)' { [void]$out.Add("$($ico.accept) Accept $(Quest-Link $Matches[1])"); break }
            '^\.turnin\s+-?(\d+)' { [void]$out.Add("$($ico.turnin) Turn in $(Quest-Link $Matches[1])"); break }
            '^\.complete\s+(\d+),\d+\s*(?:--\s*(.*))?$' {
                $goal = if ($Matches[2]) { $Matches[2].Trim() -replace '^\|\d+/\d+\s*', '' } else { 'Complete the objective' }
                [void]$out.Add("$($ico.goal) $goal $([char]0x2014) $(Quest-Link $Matches[1])"); break
            }
            '^\.collect\s+(\d+),(\d+)' {
                $id = $Matches[1]; $n = $Matches[2]
                $name = if ($items.ContainsKey($id)) { Item-Link $id } else { "[Item $id]($wowhead/item=$id)" }
                [void]$out.Add("$($ico.bag) Collect $name ($n)"); break
            }
            '^\.use\s+(\d+)' {
                $id = $Matches[1]
                if ($text) { [void]$out.Add("$($ico.use) $(Convert-Text $text)") }
                elseif ($l -match '--' -and $items.ContainsKey($id)) { [void]$out.Add("$($ico.use) Use $(Item-Link $id)") }
                break
            }
            '^\.cast\s+(\d+)' {
                $id = $Matches[1]
                if ($text -match '^Cast\s+([^|]+)$') { [void]$out.Add("$($ico.spell) Cast [$($Matches[1].Trim())]($wowhead/spell=$id)") }
                else { [void]$out.Add("$($ico.spell) $(Convert-Text $text) ([spell]($wowhead/spell=$id))") }
                break
            }
            '^\.(fly|fp)\b' { if ($text) { [void]$out.Add("$($ico.fly) $(Convert-Text $text)") }; break }
            '^\.(hs|home)\b' { if ($text) { [void]$out.Add("$($ico.home) $(Convert-Text $text)") }; break }
            '^\.(zone|subzone|goto)\b' { if ($text) { [void]$out.Add("$($ico.walk) $(Convert-Text $text)") }; break }
            '^\.trainer\b' { if ($text) { [void]$out.Add("$($ico.book) $(Convert-Text $text)") }; break }
            '^\.isOnQuest\s+(\d+)' { [void]$out.Add("*Only if you have $(Quest-Link $Matches[1])*"); break }
            '^\.isQuestComplete\s+(\d+)' { [void]$out.Add("*Only if $(Quest-Link $Matches[1]) is complete*"); break }
            '^\.mob\s+(.+)$' { $kills += $Matches[1].Trim().TrimStart('+'); break }
        }
    }
    # Name the mobs only when the step text does not already
    $joined = $out -join ' '
    $missing = @($kills | Where-Object { -not $joined.Contains("**$_") } | ForEach-Object { "**$_**" })
    if ($missing.Count) { [void]$out.Add("$($ico.kill) $($missing -join ', ')") }
    , $out
}

function Guide-Title($g) {
    $name = $g.Header['name'] -replace '^[\d-]+\s+', ''
    if ($g.Header['group'] -match 'Class Quests') { "$($g.Header['subgroup']): $name" } else { $name }
}
function Guide-File($g) {
    $base = [IO.Path]::GetFileNameWithoutExtension($g.Source)
    $sameSource = @($guides | Where-Object { $_.Source -eq $g.Source })
    if ($sameSource.Count -eq 1) { return "$base.md" }
    $words = ($g.Header['name'] -replace '^[\d-]+\s+', '') -split '[^A-Za-z0-9]+' | Where-Object { $_ }
    "$base-$(($words | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1) }) -join '').md"
}

function Quest-Table($g) {
    $rows = [ordered]@{}
    foreach ($s in ($g.Items | Where-Object { $_.Kind -eq 'step' })) {
        $npc = @($s.Lines | Where-Object { $_ -match '^\.target ' } | ForEach-Object { $_ -replace '^\.target\s+\+?', '' })
        $who = if ($npc.Count) { "**$($npc[0])**" } else { $null }
        $optional = $s.Lines -contains '#optional'
        foreach ($l in $s.Lines) {
            if ($l -match '^\.(accept|turnin)\s+-?(\d+)') {
                $id = $Matches[2]
                if (-not $rows.Contains($id)) { $rows[$id] = @{ From = @(); To = @(); Optional = $true } }
                if (-not $optional) { $rows[$id].Optional = $false }
                if (-not $who) { continue }
                $key = if ($Matches[1] -eq 'accept') { 'From' } else { 'To' }
                if ($rows[$id][$key] -notcontains $who) { $rows[$id][$key] += $who }
            }
        }
    }
    $lines = @('| Quest | Start | Turn in |', '|---|---|---|')
    foreach ($id in $rows.Keys) {
        $r = $rows[$id]
        $from = if ($r.From.Count) { $r.From -join ', ' } else { 'Item or drop' }
        $to = if ($r.To.Count) { $r.To -join ', ' } else { $([char]0x2014) }
        $opt = if ($r.Optional) { ' *(optional)*' } else { '' }
        $lines += "| $(Quest-Link $id)$opt | $from | $to |"
    }
    $lines
}

if (-not (Test-Path $docsDir)) { New-Item -ItemType Directory $docsDir | Out-Null }
$byName = @{}
foreach ($g in $guides) { $byName[$g.Header['name']] = $g }

foreach ($g in $guides) {
    $levels = ($g.Header['name'] -split '\s+')[0]
    $levelLabel = if ($levels -match '-') { "Levels $levels" } else { "Level $levels" }
    $md = New-Object System.Collections.ArrayList
    [void]$md.Add("# $(Guide-Title $g)")
    [void]$md.Add('')
    [void]$md.Add("**$levelLabel** $([char]0x00B7) $($g.Header['faction']) $([char]0x00B7) *$($g.Header['group']) $([char]0x2192) $($g.Header['subgroup'])*")
    [void]$md.Add('')
    if ($g.Header['next'] -and $byName.ContainsKey($g.Header['next'])) {
        $n = $byName[$g.Header['next']]
        [void]$md.Add("Next guide: [$(Guide-Title $n)]($(Guide-File $n))")
        [void]$md.Add('')
    }
    [void]$md.Add("> Generated from [``$($g.Source)``](../$($g.Source)) by ``tools/Build-Docs.ps1``. Quest, item and spell names link to Wowhead.")
    [void]$md.Add('')
    [void]$md.Add('## Quests')
    [void]$md.Add('')
    Quest-Table $g | ForEach-Object { [void]$md.Add($_) }
    [void]$md.Add('')
    [void]$md.Add('## Route')
    [void]$md.Add('')
    [void]$md.Add("$($ico.pin) location $([char]0x00B7) $($ico.talk) talk $([char]0x00B7) $($ico.accept) accept $([char]0x00B7) $($ico.goal) objective $([char]0x00B7) $($ico.bag) collect $([char]0x00B7) $($ico.turnin) turn in $([char]0x00B7) $($ico.loop) do alongside the next steps")
    $num = 0
    $inList = $false
    foreach ($it in $g.Items) {
        if ($it.Kind -eq 'section') {
            [void]$md.Add('')
            [void]$md.Add("### $($it.Title)")
            $inList = $false
            continue
        }
        $num++
        $bullets = Step-Bullets $it
        $tags = @()
        if ($it.Lines | Where-Object { $_ -match '^#completewith' }) { $tags += "$($ico.loop) *Along the way*" }
        if ($it.Lines -contains '#optional') { $tags += '*Optional*' }
        $loc = Location $it
        if ($loc) { $tags += "$($ico.pin) $loc" }
        if (-not $tags.Count -and $bullets.Count) { $tags += $bullets[0]; $bullets.RemoveAt(0) }
        if (-not $inList) { [void]$md.Add(''); $inList = $true }
        [void]$md.Add("$num. $($tags -join " $([char]0x00B7) ")")
        foreach ($b in $bullets) { [void]$md.Add("    - $b") }
    }
    [void]$md.Add('')
    [IO.File]::WriteAllText((Join-Path $docsDir (Guide-File $g)), ($md -join "`n"), $utf8)
    Write-Host "docs/$(Guide-File $g)"
}

# --- README: link guide names to their docs and quest names to Wowhead ---------------------------------------

$readmePath = Join-Path $root 'README.md'
$titles = @{}
foreach ($g in $guides) { $titles[(Guide-Title $g)] = "docs/$(Guide-File $g)" }
$questIds = @{}
foreach ($id in $quests.Keys) {
    # README writes "Oh Brother. . ." as "Oh Brother..."
    $name = $quests[$id] -replace '\. \. \.$', '...'
    if (-not $questIds.ContainsKey($name)) { $questIds[$name] = $id }
}

$readme = [IO.File]::ReadAllText($readmePath, $utf8) -split "`r?`n"
$readme = foreach ($row in $readme) {
    $cells = $row -split '\|'
    if ($cells.Count -ge 5 -and $row.StartsWith('|') -and $row -notmatch '^\|[-|]+\|$' -and $cells[1].Trim() -ne 'Guide') {
        $title = $cells[1].Trim()
        if ($titles.ContainsKey($title)) { $cells[1] = " [$title]($($titles[$title])) " }
        $names = $cells[3].Trim() -split ', '
        $cells[3] = ' ' + (($names | ForEach-Object {
            $n = $_
            $base = $n -replace ' chain$', ''
            if ($n.StartsWith('[')) { $n }
            elseif ($questIds.ContainsKey($base)) { "[$base]($wowhead/quest=$($questIds[$base]))" + $n.Substring($base.Length) }
            elseif ($n -match '^(The Great Cat Spirit chain) \(or (.+?) for Skyborne\)$' -and $questIds.ContainsKey($Matches[2])) {
                "[The Great Cat Spirit]($wowhead/quest=$($questIds['The Great Cat Spirit'])) chain (or [$($Matches[2])]($wowhead/quest=$($questIds[$Matches[2]])) for Skyborne)"
            }
            else { $n }
        }) -join ', ') + ' '
        $cells -join '|'
    } else { $row }
}
[IO.File]::WriteAllText($readmePath, ($readme -join "`n"), $utf8)
Write-Host 'README.md'
