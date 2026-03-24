# NAVIGATION INDEX GENERATOR - VERSION 1.0
# Generates a premium 'Areas We Serve' page with the KarmaDocs theme.

$BaseDir = "c:\Users\GCV\Desktop\KarmaDocs location pages"
$OutFile = Join-Path $BaseDir "areas-we-serve.html"

# Comprehensive Locations List (Same as generation script)
$Locations = @(
    'Indio', 'Palm Springs', 'Rancho Mirage', 'Palm Desert', 'Cathedral City', 'Desert Hot Springs', 'Indian Wells', 'La Quinta', 'Coachella', 'Bermuda Dunes', 'Thousand Palms', 'Thermal', 'Mecca', 'Sun City Palms', 'Shadow Hills', 'Sun City Shadow Hills', 'Terra Lago', 'Sun City Palm Desert', 'Trilogy at La Quinta', 'PGA West', 'The Hideaway', 'The Madison Club', 'Ironwood Country Club', 'The Reserve', 'Bighorn Golf Club', 'The Vintage Club', 'Seven Lakes', 'Deep Well', 'Old Las Palmas', 'Vista Las Palmas', 'Twin Palms', 'Tahquitz River Estates', 'Warm Sands', 'The Mesa', 'Andreas Hills', 'Los Compadres', 'Movie Colony', 'El Mirador', 'Racquet Club Estates', 'Victoria Park', 'Ruth Hardy Park',
    'Riverside', 'Moreno Valley', 'Corona', 'Temecula', 'Murrieta', 'Jurupa Valley', 'Menifee', 'Hemet', 'Eastvale', 'San Jacinto', 'Lake Elsinore', 'Perris', 'Wildomar', 'Banning', 'Beaumont', 'Calimesa', 'Canyon Lake', 'Norco', 'Arlington', 'Arlanza', 'La Sierra', 'Woodcrest', 'Orangecrest', 'Canyon Crest', 'Highgrove', 'Grand Terrace', 'Bloomington', 'Muscoy', 'Devore', 'Arrowhead Farms', 'Sun City', 'Quail Valley', 'Sedco Hills', 'Lakeland Village', 'Meadowbrook', 'Nuevo', 'Winchester', 'French Valley', 'De Luz', 'Aguanga', 'Anza', 'Mountain Center', 'Idyllwild', 'Pine Cove', 'Fern Valley', 'Valle Vista', 'Green Acres', 'Homeland', 'Romoland', 'Heritage Lake', 'Silverhawk', 'Wolf Creek', 'Redhawk', 'Paseo del Sol', 'Morgan Hill',
    'San Bernardino', 'Fontana', 'Ontario', 'Rancho Cucamonga', 'Victorville', 'Rialto', 'Hesperia', 'Chino', 'Chino Hills', 'Upland', 'Apple Valley', 'Redlands', 'Highland', 'Colton', 'Yucaipa', 'Loma Linda', 'Barstow', 'San Manuel Village', 'Mentone', 'Oak Glen', 'Forest Falls', 'Angelus Oaks', 'Big Bear Lake', 'Big Bear City', 'Sugarloaf', 'Fawnskin', 'Rimforest', 'Lake Arrowhead', 'Blue Jay', 'Cedar Glen', 'Twin Peaks', 'Crestline', 'Green Valley Lake', 'Running Springs', 'Skyforest', 'Lake Gregory', 'Valley of Enchantment', 'Silverwood Lake', 'Wrightwood', 'Phelan', 'Pinon Hills', 'Oak Hills', 'Lucerne Valley', 'Johnson Valley', 'Yucca Valley', 'Joshua Tree', 'Twentynine Palms', 'Landers', 'Morongo Valley', 'Pioneertown', 'Sky Valley', 'Desert Edge', 'North Palm Springs', 'Whitewater', 'Cabazon',
    'Santa Ana', 'Anaheim', 'Irvine', 'Huntington Beach', 'Garden Grove', 'Orange', 'Fullerton', 'Costa Mesa', 'Mission Viejo', 'Westminster', 'Newport Beach', 'Lake Forest', 'Tustin', 'Yorba Linda', 'San Clemente', 'Laguna Niguel', 'La Habra', 'Fountain Valley', 'Placentia', 'Aliso Viejo', 'Cypress', 'Rancho Santa Margarita', 'Brea', 'Stanton', 'San Juan Capistrano', 'Dana Point', 'Laguna Hills', 'Seal Beach', 'Laguna Beach', 'Laguna Woods', 'La Palma', 'Los Alamitos', 'Villa Park', 'Coto de Caza', 'Ladera Ranch', 'Las Flores', 'Midway City', 'North Tustin', 'Rossmoor', 'Silverado', 'Trabuco Canyon',
    'Long Beach', 'Glendale', 'Santa Clarita', 'Lancaster', 'Palmdale', 'Pomona', 'Torrance', 'Pasadena', 'El Monte', 'Downey', 'Inglewood', 'West Covina', 'Norwalk', 'Burbank', 'Compton', 'South Gate', 'Santa Monica', 'Carson', 'Santa Fe Springs', 'Whittier', 'Hawthorne', 'Alhambra', 'Lakewood', 'Bellflower', 'Baldwin Park', 'Lynwood', 'Redondo Beach', 'Montebello', 'Pico Rivera', 'Monterey Park', 'Gardena', 'Huntington Park', 'Arcadia', 'Diamond Bar', 'Paramount', 'Rosemead', 'Glendora', 'Cerritos', 'La Mirada', 'Covina', 'Azusa', 'Bell Gardens', 'La Puente', 'Rancho Palos Verdes', 'San Gabriel', 'Culver City', 'Monrovia', 'Bell', 'Manhattan Beach', 'Temple City', 'San Dimas', 'Lawndale', 'La Verne', 'Walnut', 'Maywood', 'South Pasadena', 'Cudahy', 'San Marino', 'Commerce', 'Malibu', 'Agoura Hills', 'Signal Hill', 'Sierra Madre', 'Westlake Village', 'Rolling Hills Estates', 'Rolling Hills', 'Hidden Hills', 'Bradbury', 'Irwindale', 'Industry', 'Vernon', 'La Crescenta', 'Altadena', 'Marina del Rey', 'Playa del Rey', 'Playa Vista', 'Venice', 'Mar Vista', 'Palms', 'Brentwood', 'Bel Air', 'Pacific Palisades', 'Westwood', 'Century City', 'Beverly Grove', 'Fairfax District', 'Miracle Mile', 'Hancock Park', 'Windsor Square', 'Larchmont Village', 'Silver Lake', 'Echo Park', 'Atwater Village', 'Glassell Park', 'Mount Washington', 'Eagle Rock', 'Highland Park', 'Boyle Heights', 'Lincoln Heights', 'El Sereno', 'Chinatown', 'Koreatown', 'Wilshire Center', 'Westlake', 'Pico-Union', 'Harvard Heights', 'West Adams', 'Jefferson Park', 'Leimert Park', 'View Park', 'Windsor Hills', 'Baldwin Hills', 'Crenshaw', 'Faircrest Heights', 'Reynier Village', 'Lafayette Square', 'Arlington Heights', 'Mid-City', 'Carthay Circle', 'Cheviot Hills', 'Rancho Park', 'Sawtelle', 'Del Rey', 'Studio City', 'Sherman Oaks', 'Encino', 'Tarzana', 'Woodland Hills', 'Warner Center', 'West Hills', 'Canoga Park', 'Winnetka', 'Reseda', 'Lake Balboa', 'Van Nuys', 'Valley Glen', 'Valley Village', 'North Hollywood', 'Toluca Lake', 'Sun Valley', 'Pacoima', 'Arleta', 'Panorama City', 'North Hills', 'Mission Hills', 'Sylmar', 'San Fernando', 'Granada Hills', 'Porter Ranch', 'Chatsworth', 'Northridge', 'Lake View Terrace', 'Sunland', 'Tujunga',
    'Oceanside', 'Escondido', 'Carlsbad', 'Vista', 'San Marcos', 'Encinitas', 'Poway', 'Solana Beach', 'Del Mar', 'Fallbrook', 'Bonsall', 'Valley Center', 'Pauma Valley', 'Palomar Mountain', 'Warner Springs', 'Ranchita', 'Borrego Springs', 'Julian', 'Santa Ysabel', 'Ramona', 'Lakeside', 'Alpine', 'Descanso', 'Pine Valley', 'Guatay', 'Mount Laguna', 'Boulevard', 'Jacumba', 'Campo', 'Potrero', 'Tecate', 'Dulzura', 'Jamul', 'Spring Valley', 'Lemon Grove', 'La Mesa', 'El Cajon', 'Santee', 'Imperial Beach', 'Chula Vista', 'National City', 'Bonita', 'Coronado', 'Point Loma', 'Ocean Beach', 'Mission Beach', 'Pacific Beach', 'La Jolla', 'Clairemont', 'Kearny Mesa', 'Mira Mesa', 'Scripps Ranch', 'Tierrasanta', 'Allied Gardens', 'Del Cerro', 'San Carlos', 'Navajo', 'Rancho Bernardo', 'Rancho Penasquitos', 'Carmel Valley', 'Sorento Valley', 'Torrey Pines', 'Torrey Hills', 'Black Mountain Ranch', 'Santa Luz', 'Rancho Santa Fe', 'Fairbanks Ranch', '4S Ranch', 'Scripps Miramar Ranch',
    'El Centro', 'Brawley', 'Calexico', 'Imperial', 'Holtville', 'Westmorland', 'Calipatria', 'Niland', 'Heber', 'Seeley', 'Salton City', 'Ocotillo', 'Winterhaven', 'Palo Verde', 'Bard', 'Bombay Beach', 'Desert Shores', 'Vista del Mar', 'Salton Sea Beach',
    'Santa Barbara', 'Santa Maria', 'Lompoc', 'Orcutt', 'Goleta', 'Carpinteria', 'Montecito', 'Summerland', 'Solvang', 'Buellton', 'Santa Ynez', 'Los Olivos', 'Ballard', 'Newlove', 'Garey', 'Sisquoc', 'Casmalia', 'Vandenberg Village', 'Guadalupe', 'Los Alamos',
    'Ventura', 'Oxnard', 'Simi Valley', 'Thousand Oaks', 'Camarillo', 'Moorpark', 'Santa Paula', 'Fillmore', 'Port Hueneme', 'Ojai', 'Oak View', 'Meiners Oaks', 'Mira Monte', 'Oak Park', 'Casa Conejo', 'Santa Rosa Valley', 'Bell Canyon', 'Lake Sherwood', 'Somis', 'Saticoy', 'El Rio', 'Nyeland Acres', 'Silver Strand', 'Hollywood Beach', 'Hollywood by the Sea', 'Piru', 'Upper Ojai', 'Point Mugu',
    'Rancho Mirage South', 'Rancho Mirage North', 'Palm Springs West', 'Palm Springs East', 'Cathedral City South', 'Desert Hot Springs North', 'Indio Hills', 'Mecca North', 'Thermal South', 'Coachella East', 'La Quinta West', 'Palm Desert South', 'Indian Wells North'
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
    <meta name="description" content="Karma Doctors serving over 490 communities in California with expert psychiatric care and TMS therapy.">
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
    <p>Providing expert psychiatric clinical excellence to over 490 communities across California.</p>
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
