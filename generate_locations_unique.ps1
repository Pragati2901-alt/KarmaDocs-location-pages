# MAXIMUM UNIQUENESS GENERATION ENGINE - FINAL VERSION
# Robust content generation with dynamic community sections and branded linking.

$BaseDir = "c:\Users\GCV\Desktop\KarmaDocs location pages\areas-we-serve"
$TemplateFile = Join-Path $BaseDir 'psychiatrist-near-indio.html'

# Comprehensive Locations List (Truncated for readability, using the full list in actual run)
$Locations = @(
    'Palm Springs', 'Rancho Mirage', 'Palm Desert', 'Cathedral City', 'Desert Hot Springs', 'Indian Wells', 'La Quinta', 'Coachella', 'Bermuda Dunes', 'Thousand Palms', 'Thermal', 'Mecca', 'Sun City Palms', 'Shadow Hills', 'Sun City Shadow Hills', 'Terra Lago', 'Sun City Palm Desert', 'Trilogy at La Quinta', 'PGA West', 'The Hideaway', 'The Madison Club', 'Ironwood Country Club', 'The Reserve', 'Bighorn Golf Club', 'The Vintage Club', 'Seven Lakes', 'Deep Well', 'Old Las Palmas', 'Vista Las Palmas', 'Twin Palms', 'Tahquitz River Estates', 'Warm Sands', 'The Mesa', 'Andreas Hills', 'Los Compadres', 'Movie Colony', 'El Mirador', 'Racquet Club Estates', 'Victoria Park', 'Ruth Hardy Park',
    'Riverside', 'Moreno Valley', 'Corona', 'Temecula', 'Murrieta', 'Jurupa Valley', 'Menifee', 'Hemet', 'Eastvale', 'San Jacinto', 'Lake Elsinore', 'Perris', 'Wildomar', 'Banning', 'Beaumont', 'Calimesa', 'Canyon Lake', 'Norco', 'Arlington', 'Arlanza', 'La Sierra', 'Woodcrest', 'Orangecrest', 'Canyon Crest', 'Highgrove', 'Grand Terrace', 'Bloomington', 'Muscoy', 'Devore', 'Arrowhead Farms', 'Sun City', 'Quail Valley', 'Sedco Hills', 'Lakeland Village', 'Meadowbrook', 'Nuevo', 'Winchester', 'French Valley', 'De Luz', 'Aguanga', 'Anza', 'Mountain Center', 'Idyllwild', 'Pine Cove', 'Fern Valley', 'Valle Vista', 'Green Acres', 'Homeland', 'Romoland', 'Heritage Lake', 'Silverhawk', 'Wolf Creek', 'Redhawk', 'Paseo del Sol', 'Morgan Hill',
    'San Bernardino', 'Fontana', 'Ontario', 'Rancho Cucamonga', 'Victorville', 'Rialto', 'Hesperia', 'Chino', 'Chino Hills', 'Upland', 'Apple Valley', 'Redlands', 'Highland', 'Colton', 'Yucaipa', 'Loma Linda', 'Barstow', 'San Manuel Village', 'Mentone', 'Oak Glen', 'Forest Falls', 'Angelus Oaks', 'Big Bear Lake', 'Big Bear City', 'Sugarloaf', 'Fawnskin', 'Rimforest', 'Lake Arrowhead', 'Blue Jay', 'Cedar Glen', 'Twin Peaks', 'Crestline', 'Green Valley Lake', 'Running Springs', 'Skyforest', 'Lake Gregory', 'Valley of Enchantment', 'Silverwood Lake', 'Wrightwood', 'Phelan', 'Pinon Hills', 'Oak Hills', 'Lucerne Valley', 'Johnson Valley', 'Yucca Valley', 'Joshua Tree', 'Twentynine Palms', 'Landers', 'Morongo Valley', 'Pioneertown', 'Sky Valley', 'Desert Edge', 'North Palm Springs', 'Whitewater', 'Cabazon',
    'Santa Ana', 'Anaheim', 'Irvine', 'Huntington Beach', 'Garden Grove', 'Orange', 'Fullerton', 'Costa Mesa', 'Mission Viejo', 'Westminster', 'Newport Beach', 'Lake Forest', 'Tustin', 'Yorba Linda', 'San Clemente', 'Laguna Niguel', 'La Habra', 'Fountain Valley', 'Placentia', 'Aliso Viejo', 'Cypress', 'Rancho Santa Margarita', 'Brea', 'Stanton', 'San Juan Capistrano', 'Dana Point', 'Laguna Hills', 'Seal Beach', 'Laguna Beach', 'Laguna Woods', 'La Palma', 'Los Alamitos', 'Villa Park', 'Coto de Caza', 'Ladera Ranch', 'Las Flores', 'Midway City', 'North Tustin', 'Rossmoor', 'Silverado', 'Trabuco Canyon',
    'Long Beach', 'Glendale', 'Santa Clarita', 'Lancaster', 'Palmdale', 'Pomona', 'Torrance', 'Pasadena', 'El Monte', 'Downey', 'Inglewood', 'West Covina', 'Norwalk', 'Burbank', 'Compton', 'South Gate', 'Santa Monica', 'Carson', 'Santa Fe Springs', 'Whittier', 'Hawthorne', 'Alhambra', 'Lakewood', 'Bellflower', 'Baldwin Park', 'Lynwood', 'Redondo Beach', 'Montebello', 'Pico Rivera', 'Monterey Park', 'Gardena', 'Huntington Park', 'Arcadia', 'Diamond Bar', 'Paramount', 'Rosemead', 'Glendora', 'Cerritos', 'La Mirada', 'Covina', 'Azusa', 'Bell Gardens', 'La Puente', 'Rancho Palos Verdes', 'San Gabriel', 'Culver City', 'Monrovia', 'Bell', 'Manhattan Beach', 'Temple City', 'San Dimas', 'Lawndale', 'La Verne', 'Walnut', 'Maywood', 'South Pasadena', 'Cudahy', 'San Marino', 'Commerce', 'Malibu', 'Agoura Hills', 'Signal Hill', 'Sierra Madre', 'Westlake Village', 'Rolling Hills Estates', 'Rolling Hills', 'Hidden Hills', 'Bradbury', 'Irwindale', 'Industry', 'Vernon', 'La Crescenta', 'Altadena', 'Marina del Rey', 'Playa del Rey', 'Playa Vista', 'Venice', 'Mar Vista', 'Palms', 'Brentwood', 'Bel Air', 'Pacific Palisades', 'Westwood', 'Century City', 'Beverly Grove', 'Fairfax District', 'Miracle Mile', 'Hancock Park', 'Windsor Square', 'Larchmont Village', 'Silver Lake', 'Echo Park', 'Atwater Village', 'Glassell Park', 'Mount Washington', 'Eagle Rock', 'Highland Park', 'Boyle Heights', 'Lincoln Heights', 'El Sereno', 'Chinatown', 'Koreatown', 'Wilshire Center', 'Westlake', 'Pico-Union', 'Harvard Heights', 'West Adams', 'Jefferson Park', 'Leimert Park', 'View Park', 'Windsor Hills', 'Baldwin Hills', 'Crenshaw', 'Faircrest Heights', 'Reynier Village', 'Lafayette Square', 'Arlington Heights', 'Mid-City', 'Carthay Circle', 'Cheviot Hills', 'Rancho Park', 'Sawtelle', 'Del Rey', 'Studio City', 'Sherman Oaks', 'Encino', 'Tarzana', 'Woodland Hills', 'Warner Center', 'West Hills', 'Canoga Park', 'Winnetka', 'Reseda', 'Lake Balboa', 'Van Nuys', 'Valley Glen', 'Valley Village', 'North Hollywood', 'Toluca Lake', 'Sun Valley', 'Pacoima', 'Arleta', 'Panorama City', 'North Hills', 'Mission Hills', 'Sylmar', 'San Fernando', 'Granada Hills', 'Porter Ranch', 'Chatsworth', 'Northridge', 'Lake View Terrace', 'Sunland', 'Tujunga',
    'Oceanside', 'Escondido', 'Carlsbad', 'Vista', 'San Marcos', 'Encinitas', 'Poway', 'Solana Beach', 'Del Mar', 'Fallbrook', 'Bonsall', 'Valley Center', 'Pauma Valley', 'Palomar Mountain', 'Warner Springs', 'Ranchita', 'Borrego Springs', 'Julian', 'Santa Ysabel', 'Ramona', 'Lakeside', 'Alpine', 'Descanso', 'Pine Valley', 'Guatay', 'Mount Laguna', 'Boulevard', 'Jacumba', 'Campo', 'Potrero', 'Tecate', 'Dulzura', 'Jamul', 'Spring Valley', 'Lemon Grove', 'La Mesa', 'El Cajon', 'Santee', 'Imperial Beach', 'Chula Vista', 'National City', 'Bonita', 'Coronado', 'Point Loma', 'Ocean Beach', 'Mission Beach', 'Pacific Beach', 'La Jolla', 'Clairemont', 'Kearny Mesa', 'Mira Mesa', 'Scripps Ranch', 'Tierrasanta', 'Allied Gardens', 'Del Cerro', 'San Carlos', 'Navajo', 'Rancho Bernardo', 'Rancho Penasquitos', 'Carmel Valley', 'Sorento Valley', 'Torrey Pines', 'Torrey Hills', 'Black Mountain Ranch', 'Santa Luz', 'Rancho Santa Fe', 'Fairbanks Ranch', '4S Ranch', 'Scripps Miramar Ranch',
    'El Centro', 'Brawley', 'Calexico', 'Imperial', 'Holtville', 'Westmorland', 'Calipatria', 'Niland', 'Heber', 'Seeley', 'Salton City', 'Ocotillo', 'Winterhaven', 'Palo Verde', 'Bard', 'Bombay Beach', 'Desert Shores', 'Vista del Mar', 'Salton Sea Beach',
    'Santa Barbara', 'Santa Maria', 'Lompoc', 'Orcutt', 'Goleta', 'Carpinteria', 'Montecito', 'Summerland', 'Solvang', 'Buellton', 'Santa Ynez', 'Los Olivos', 'Ballard', 'Newlove', 'Garey', 'Sisquoc', 'Casmalia', 'Vandenberg Village', 'Guadalupe', 'Los Alamos',
    'Ventura', 'Oxnard', 'Simi Valley', 'Thousand Oaks', 'Camarillo', 'Moorpark', 'Santa Paula', 'Fillmore', 'Port Hueneme', 'Ojai', 'Oak View', 'Meiners Oaks', 'Mira Monte', 'Oak Park', 'Casa Conejo', 'Santa Rosa Valley', 'Bell Canyon', 'Lake Sherwood', 'Somis', 'Saticoy', 'El Rio', 'Nyeland Acres', 'Silver Strand', 'Hollywood Beach', 'Hollywood by the Sea', 'Piru', 'Upper Ojai', 'Point Mugu',
    'Rancho Mirage South', 'Rancho Mirage North', 'Palm Springs West', 'Palm Springs East', 'Cathedral City South', 'Desert Hot Springs North', 'Indio Hills', 'Mecca North', 'Thermal South', 'Coachella East', 'La Quinta West', 'Palm Desert South', 'Indian Wells North'
)

# Hero
$HeroTemplates = @(
    'Trusted Psychiatrist <br /> <span style="color: var(--brand-orange);">Near {{LOCATION}}</span>'
)

$SubHeroTemplates = @(
    'Delivering advanced, compassionate mental health care across {{LOCATION}}, bringing the same clinical excellence trusted at our Coachella Valley locations directly to you.',
    'Access world-class psychiatric care in {{LOCATION}}. We bring our signature data-driven mental health protocols from the Coachella Valley to your doorstep.',
    'Your journey to wellness starts in {{LOCATION}}. Experience the same elite clinical standards established at our premier Coachella Valley centers.',
    'Transforming lives in {{LOCATION}} through innovative psychiatry. We provide the highest standard of care previously reserved for our Coachella Valley patients.',
    'Bringing expert psychiatric intervention to the {{LOCATION}} community. Our mission is to provide clinical brilliance and genuine hope for every resident.',
    'Elite mental healthcare is now local to {{LOCATION}}. We extend our proven Coachella Valley psychiatric excellence to serve you and your family.',
    'Data-driven, compassionate psychiatry has arrived in {{LOCATION}}. We utilize the same advanced technologies and protocols found at our main clinical hubs.',
    'Commitment to excellence in {{LOCATION}}. Our team is dedicated to providing residents with the highest level of psychiatric care available in Southern California.',
    'Empowering the {{LOCATION}} community through precision-medicine. We bring years of Coachella Valley clinical success to help you reclaim your mental health.',
    'Experience a higher standard of care in {{LOCATION}}. Our integrative psychiatric approach combines science and heart for lasting local recovery.'
)

$ProximityH2Templates = @(
    'Elite Care Is <br /> <span style="color: var(--brand-purple);">Closer Than You Think.</span>',
    'Advanced Psychiatry <br /> <span style="color: var(--brand-purple);">Right in Your Region.</span>',
    'World-Class Support <br /> <span style="color: var(--brand-purple);">Serving {{LOCATION}}.</span>',
    'Clinical Excellence <br /> <span style="color: var(--brand-purple);">Always Within Reach.</span>',
    'Premier Mental Health <br /> <span style="color: var(--brand-purple);">For {{LOCATION}} Residents.</span>'
)

$ProximityDescTemplates = @(
    'We have strategically established three premier centers to ensure residents of {{LOCATION}} have immediate access to world-class psychiatric care and the latest in TMS technology.',
    'Our clinical network was built specifically for the {{LOCATION}} community, offering a professional sanctuary for those seeking cutting-edge mental health solutions.',
    'Accessing elite psychiatric intervention should never be a burden. We provide three convenient regional hubs for all families and individuals living in {{LOCATION}}.',
    'We bridge the gap between innovation and accessibility in {{LOCATION}}, ensuring that the very best neurological care is just a short drive from your home.',
    'Karma Doctors is dedicated to the {{LOCATION}} region, providing a seamless network of expert care focused on your long-term mental well-being.'
)

$CTAH2Templates = @(
    'Find Your Way Back to Happiness',
    'Your Path to Wellness Starts Today',
    'Reconnect with the Life You Love',
    'Begin Your Transformative Journey',
    'Clinical Hope for Lasting Recovery'
)

$CTAPTemplates = @(
    'Take the first step toward a transformative recovery with our data-driven, compassionate psychiatric care near {{LOCATION}}.',
    'Experience the premier standard of mental health support in {{LOCATION}}. We help you rediscover your strength and clarity.',
    'Join the hundreds of individuals in {{LOCATION}} who have reclaimed their lives through our expert psychiatric interventions.',
    'Your mental health is our clinical priority. Start your recovery journey in {{LOCATION}} with our world-class medical team.',
    'Building a brighter future for the {{LOCATION}} community. Connect with our psychiatric specialists for empathetic, expert care.'
)

$CommunityIntros = @(
    '{{LOCATION}} is a community defined by its unique character and vibrant local culture, making it one of the standout areas in Southern California.',
    'In {{LOCATION}}, life moves with a distinctive rhythm, where natural beauty meets a close-knit and growing population.',
    '{{LOCATION}} represents the best of our region, combining historical roots with a modern, forward-thinking approach to community living.',
    'From its scenic landscapes to its diverse neighborhoods, {{LOCATION}} is a place where many families and professionals have found their home.',
    'The energy of {{LOCATION}} is unmistakable, characterized by a spirit of innovation and a deep appreciation for top-tier quality of life.'
)

$CommunityMiddles = @(
    'As {{LOCATION}} continues to evolve, the demand for specialized, high-level psychiatric care has never been greater. <a href="https://karmadocs.com/" style="color: var(--brand-purple); text-decoration: none; font-weight: 700;">Karma Doctors & Associates</a> is proud to serve this need.',
    'Every resident in {{LOCATION}} deserves access to mental health protocols that are as unique as they are. Our team at <a href="https://karmadocs.com/" style="color: var(--brand-purple); text-decoration: none; font-weight: 700;">Karma Doctors & Associates</a> is dedicated to precision-driven care.',
    'Navigating mental wellness shouldn''t be a challenge for those in {{LOCATION}}. We bridge the gap between world-class science and local accessibility, ensuring elite psychiatry is within reach for all.',
    'We recognize that {{LOCATION}} is a fast-paced environment where mental resilience is key. Our solutions are tailored specifically for the residents of {{LOCATION}}, focusing on long-term recovery.',
    'Our commitment to {{LOCATION}} is built on a foundation of medical excellence and compassionate support, making <a href="https://karmadocs.com/" style="color: var(--brand-purple); text-decoration: none; font-weight: 700;">Karma Doctors & Associates</a> the premier choice.'
)

$CommunityOutros = @(
    'Whether you are located in the historic center or the newer residential developments of {{LOCATION}}, our nearby clinics provide a seamless path to wellness.',
    'Serving the entirety of {{LOCATION}}, from the quietest suburban streets to the bustling commercial hubs, we ensure that elite psychiatric care is always a convenient drive away.',
    'Our reach extends to every corner of {{LOCATION}}, offering a local sanctuary for those seeking to reclaim their mental clarity.',
    'From the heart of {{LOCATION}} to its furthest boundaries, our mission remains the same: to provide the highest standard of psychiatric intervention to every person who calls {{LOCATION}} home.',
    'Conveniently located to serve the {{LOCATION}} region, our offices provide a welcoming environment where your recovery is our singular focus.'
)

$CommunityCardSets = @(
    @(
        @{ H = 'Regional Mental Health Hub'; P = 'Three strategically located clinics ensure no resident is more than a short drive from expert care.' },
        @{ H = 'Culturally Sensitive Approach'; P = 'We honor {{LOCATION}}''s diverse community with culturally aware, bilingual-friendly services that respect every patient.' },
        @{ H = 'Nearby Communities Served'; P = 'We proudly serve patients throughout the entire region, ensuring deep local access to world-class psychiatry.' }
    ),
    @(
        @{ H = 'qEEG Brain Mapping'; P = 'Get a detailed view of your brain''s electrical activity to inform a hyper-personalized treatment plan near {{LOCATION}}.' },
        @{ H = 'FDA-Cleared TMS Therapy'; P = 'A non-drug, non-invasive treatment for depression and OCD available to all {{LOCATION}} residents.' },
        @{ H = 'Secure Video Visits'; P = 'Access our specialists from the comfort of your home in {{LOCATION}} with our robust telehealth platform.' }
    )
)

function Slugify($text) {
    return $text.ToLower().Replace(' ', '-').Replace('(', '').Replace(')', '').Trim('-')
}

$Template = [System.IO.File]::ReadAllText($TemplateFile)

Write-Host "Generating unique pages..."

foreach ($Loc in $Locations) {
    if ($Loc -imatch 'Indio') { continue }
    $Slug = Slugify $Loc
    $PageFile = Join-Path $BaseDir "psychiatrist-near-$Slug.html"
    
    # Random Assembly
    $Hero = ($HeroTemplates | Get-Random).Replace('{{LOCATION}}', $Loc)
    $SubHero = ($SubHeroTemplates | Get-Random).Replace('{{LOCATION}}', $Loc)
    $ProxH2 = ($ProximityH2Templates | Get-Random).Replace('{{LOCATION}}', $Loc)
    $ProxDesc = ($ProximityDescTemplates | Get-Random).Replace('{{LOCATION}}', $Loc)
    $CtaH2 = ($CTAH2Templates | Get-Random).Replace('{{LOCATION}}', $Loc)
    $CtaP = ($CTAPTemplates | Get-Random).Replace('{{LOCATION}}', $Loc)
    $ComIntro = ($CommunityIntros | Get-Random).Replace('{{LOCATION}}', $Loc)
    $ComMid = ($CommunityMiddles | Get-Random).Replace('{{LOCATION}}', $Loc)
    $ComOut = ($CommunityOutros | Get-Random).Replace('{{LOCATION}}', $Loc)
    
    $ShuffledCardSet = $CommunityCardSets | Get-Random
    $CardHtml = ""
    foreach ($card in $ShuffledCardSet) {
        $ch = $card.H.Replace('{{LOCATION}}', $Loc)
        $cp = $card.P.Replace('{{LOCATION}}', $Loc)
        $CardHtml += "<div style='background: var(--brand-gray); padding: 35px; border-radius: 25px; border: 1px solid #E5E7EB; margin-bottom: 20px;'><h4 style='font-size: 20px; font-weight: 900; color: var(--brand-purple); margin-bottom: 12px;'>$ch</h4><p style='color: #4B5563; font-size: 16px; line-height: 1.7;'>$cp</p></div>"
    }

    $C = $Template
    
    # 1. Base Meta & Logo Links
    $C = $C.Replace('Karma TMS', 'Karma Doctors & Associates')
    $C = $C.Replace('Expert Psychiatrist Near Indio, CA', "Expert Psychiatrist Near $Loc, CA")
    $C = $C.Replace('psychiatrist-near-indio', "psychiatrist-near-$Slug")
    
    # 2. Hero Section
    $C = $C -replace '(?s)<h1 class="lux-animate".*?</h1>', "<h1 class='lux-animate' style='font-size: clamp(3.5rem, 8vw, 5.5rem); font-weight: 900; line-height: 0.95; margin-bottom: 40px; letter-spacing: -0.04em;'>$Hero</h1>"
    
    # 2b. Sub-Hero Section
    $SubHeroRex = '(?s)<p\s+class="lux-animate"\s+style="font-size:\s*24px;\s*color:\s*rgba\(255,\s*255,\s*255,\s*0\.9\);.*?">.*?</p>'
    $C = $C -replace $SubHeroRex, "<p class='lux-animate' style='font-size: 24px; color: rgba(255, 255, 255, 0.9); margin-bottom: 70px; line-height: 1.6; max-width: 850px; margin-left: auto; margin-right: auto; font-weight: 300;'>$SubHero</p>"
    
    # 2c. Proximity Section
    $ProxH2Rex = '(?s)<h2\s+style="font-size:\s*46px;.*?margin-bottom:\s*35px;.*?">.*?</h2>'
    $C = $C -replace $ProxH2Rex, "<h2 style='font-size: 46px; font-weight: 900; color: var(--brand-dark); line-height: 1.1; margin-bottom: 35px; letter-spacing: -0.02em;'>$ProxH2</h2>"
    
    $ProxDescRex = '(?s)<p\s+style="font-size:\s*20px;\s*line-height:\s*1.9;\s*color:\s*#4B5563;.*?">.*?</p>'
    $C = $C -replace $ProxDescRex, "<p style='font-size: 20px; line-height: 1.9; color: #4B5563; margin-bottom: 40px;'>$ProxDesc</p>"
    
    # 2d. Final CTA Section
    $CtaH2Rex = '(?s)<h2\s+style="font-size:\s*clamp\(2\.5rem,.*?margin-bottom:\s*25px;.*?">.*?</h2>'
    $C = $C -replace $CtaH2Rex, "<h2 style='font-size: clamp(2.5rem, 5vw, 3.8rem); font-weight: 900; color: white; margin-bottom: 25px; letter-spacing: -0.04em; line-height: 1.1;'>$CtaH2</h2>"
    
    $CtaPRex = '(?s)<p\s+style="font-size:\s*20px;\s+color:\s+rgba\(255,255,255,0\.8\);.*?margin-bottom:\s*50px;.*?">.*?</p>'
    $C = $C -replace $CtaPRex, "<p style='font-size: 20px; color: rgba(255,255,255,0.8); max-width: 650px; margin: 0 auto 50px; line-height: 1.6; font-weight: 300;'>$CtaP</p>"
    
    # 3. Community Section - Using the debugged robust regex
    $ComRex = '(?s)<!--\s*ABOUT\s+INDIO.*?LOCAL\s+COMMUNITY\s+SECTION\s*-->.*?<!--\s*PATIENT\s+TESTIMONIALS\s+SLIDER\s*-->'
    $NewCom = "<!-- ABOUT $Loc COMMUNITY SECTION -->
<section style='padding: 120px 20px; background: #ffffff;'>
<div style='max-width: 1200px; margin: 0 auto; display: grid; grid-template-columns: repeat(auto-fit, minmax(400px, 1fr)); gap: 80px; align-items: center;'>
<div><div style='display: flex; align-items: center; gap: 20px; margin-bottom: 30px;'><div style='height: 2px; width: 60px; background: var(--brand-orange);'></div><span style='text-transform: uppercase; font-weight: 800; letter-spacing: 4px; font-size: 13px; color: var(--brand-orange);'>Serving $Loc</span></div>
<h2 style='font-size: 42px; font-weight: 900; color: var(--brand-dark); line-height: 1.1; margin-bottom: 30px; letter-spacing: -0.02em;'>Proudly Serving the <br /><span style='color: var(--brand-purple);'>$Loc Community</span></h2>
<p style='font-size: 18px; color: #4B5563; line-height: 1.9; margin-bottom: 25px;'>$ComIntro</p>
<p style='font-size: 18px; color: #4B5563; line-height: 1.9; margin-bottom: 25px;'>$ComMid</p>
<p style='font-size: 18px; color: #4B5563; line-height: 1.9;'>$ComOut</p></div>
<div>$CardHtml</div></div></section>
<!-- PATIENT TESTIMONIALS SLIDER -->"
    
    $C = $C -replace $ComRex, $NewCom

    # 4. Branded Homepage Link
    $BrandLink = "<a href='https://karmadocs.com/' style='color: var(--brand-orange); text-decoration: none; font-weight: 700;'>Karma Doctors & Associates</a>"
    # Replace all mentions except in metadata
    $lines = $C -split "`n"
    for($i=15; $i -lt $lines.Length; $i++) {
        $lines[$i] = $lines[$i].Replace('Karma Doctors & Associates', $BrandLink)
    }
    $C = $lines -join "`n"

    # 5. Global Indio cleanup
    $C = $C.Replace('Indio', $Loc)

    [System.IO.File]::WriteAllText($PageFile, $C, [System.Text.Encoding]::UTF8)
}
Write-Host "Success! Generated unique content across all location pages."
