# NAVIGATION INDEX GENERATOR - VERSION 1.0
# Generates a premium 'Areas We Serve' page with the KarmaDocs theme.

$BaseDir = "c:\Users\GCV\Desktop\KarmaDocs location pages"
$OutFile = Join-Path $BaseDir "areas-we-serve.html"

# Comprehensive Locations List (Same as generation script)
$Locations = @(
    'Palm Springs', 'Twenty Nine Palms', 'Rancho Mirage', 'San Bernardino', 'Riverside', 'Moreno Valley',
    'Temecula', 'Murrieta', 'Cathedral City', 'Palm Desert', 'La Quinta', 'Indio', 'Coachella',
    'Desert Hot Springs', 'Indian Wells', 'Hemet', 'San Jacinto', 'Perris', 'Lake Elsinore',
    'Yucca Valley', 'Beaumont', 'Banning', 'Mecca', 'Thermal', 'Salton City', 'Desert Shores',
    'Niland', 'Calipatria', 'Palo Verde'
) | Sort-Object

function Slugify($text) {
    return $text.ToLower().Replace(' ', '-').Replace('(', '').Replace(')', '').Trim('-')
}

# HTML Construction
$LinksHtml = ""
foreach ($Loc in $Locations) {
    $Slug = Slugify $Loc
    $LinksHtml += "<a href='areas-we-serve/psychiatrist-near-$Slug.html' class='loc-link'>$Loc</a>`n"
}

$Html = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Areas We Serve | Karma Doctors & Associates</title>
    <meta name="description" content="Karma Doctors serving multiple communities in California with expert psychiatric care and TMS therapy.">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;700;800;900&display=swap" rel="stylesheet">
    <style>
        :root {
            --brand-purple: #603177;
            --brand-orange: #F48F12;
            --brand-dark: #1a0f3c;
            --brand-gray: #f9fafb;
        }

        * { margin:0; padding:0; box-sizing:border-box; }
        body { font-family: 'Inter', sans-serif; background: #fff; color: var(--brand-dark); line-height: 1.6; }

        .hero {
            padding: 120px 20px;
            background: linear-gradient(135deg, #1a0f3c 0%, var(--brand-purple) 100%);
            color: white;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .hero h1 { font-size: 64px; font-weight: 900; letter-spacing: -2px; margin-bottom: 20px; }
        .hero p { font-size: 22px; opacity: 0.9; max-width: 800px; margin: 0 auto; }

        .container {
            max-width: 1400px;
            margin: 80px auto;
            padding: 0 40px;
        }

        .grid-header {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 50px;
        }
        .grid-header h2 { font-size: 32px; font-weight: 800; color: var(--brand-purple); }
        .grid-header .line { flex-grow: 1; height: 1px; background: #eee; }

        .location-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 15px;
        }

        .loc-link {
            display: block;
            padding: 15px 20px;
            background: var(--brand-gray);
            border: 1px solid #eee;
            border-radius: 12px;
            text-decoration: none;
            color: #4b5563;
            font-size: 15px;
            font-weight: 600;
            transition: all 0.2s ease;
        }

        .loc-link:hover {
            background: white;
            border-color: var(--brand-orange);
            color: var(--brand-orange);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(244,143,18,0.1);
        }

        footer {
            padding: 60px 20px;
            background: var(--brand-dark);
            color: white;
            text-align: center;
            margin-top: 100px;
        }
    </style>
</head>
<body>

<section class="hero">
    <div style="position: absolute; top:0; left:0; right:0; bottom:0; background-image: radial-gradient(rgba(255,255,255,0.05) 1px, transparent 1px); background-size: 30px 30px; opacity: 0.3;"></div>
    <h1>Areas We Serve</h1>
    <p>Providing expert psychiatric clinical excellence to multiple communities across California.</p>
</section>

<div class="container">
    <div class="grid-header">
        <h2>Clinical Network</h2>
        <div class="line"></div>
        <span style="color: #999; font-weight: 700;">$($Locations.Count) Locations</span>
    </div>

    <div class="location-grid">
        $LinksHtml
    </div>
</div>

<footer>
    <p style="margin-bottom: 15px;">&copy; 2026 Karma Doctors & Associates. All rights reserved.</p>
    <a href="https://karmadocs.com/" style="color: var(--brand-orange); text-decoration: none; font-weight: 800;">Back to Homepage</a>
</footer>

</body>
</html>
"@

[System.IO.File]::WriteAllText($OutFile, $Html, [System.Text.Encoding]::UTF8)
Write-Host "Success! Created areas-we-serve.html"
