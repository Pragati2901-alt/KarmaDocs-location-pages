# CONFIGURATION
$BaseDir = "c:\Users\GCV\Desktop\KarmaDocs location pages\areas-we-serve"
$TemplateFile = Join-Path $BaseDir "psychiatrist-near-indio.html"

# 499 LOCATIONS
$Locations = @(
    'Palm Springs', 'Twenty Nine Palms', 'Rancho Mirage', 'San Bernardino', 'Riverside', 'Moreno Valley',
    'Temecula', 'Murrieta', 'Cathedral City', 'Palm Desert', 'La Quinta', 'Indio', 'Coachella',
    'Desert Hot Springs', 'Indian Wells', 'Hemet', 'San Jacinto', 'Perris', 'Lake Elsinore',
    'Yucca Valley', 'Beaumont', 'Banning', 'Mecca', 'Thermal', 'Salton City', 'Desert Shores',
    'Niland', 'Calipatria', 'Palo Verde'
)

# CONTENT VARIATIONS - SINGLE QUOTES ESCAPED WITH DOUBLE SINGLE QUOTES
$AboutTemplates = @(
    '{{LOCATION}} is a vibrant and growing community that values high-quality lifestyle and professional excellence. However, access to specialized mental health care hasn''t always kept pace with the community''s growth.',
    'Known for its unique character and scenic beauty, {{LOCATION}} is home to thousands of residents who deserve the absolute best in modern psychiatric care and neurological wellness.',
    '{{LOCATION}} represents the diverse and energetic spirit of Southern California. Karma Doctors & Associates is proud to bridge the gap in specialized mental healthcare for this exceptional area.',
    'As {{LOCATION}} continues to evolve, the demand for cutting-edge, data-driven psychiatric treatments is higher than ever. We are committed to serving the families and professionals of {{LOCATION}}.',
    'From its local landmarks to its tight-knit neighborhoods, {{LOCATION}} is a place where community matters. We bring that same sense of personalized care to every patient we see from {{LOCATION}}.',
    'Nestled within the region''s dynamic landscape, {{LOCATION}} residents often find themselves traveling long distances for expert care. We are changing that by bringing elite psychiatry closer to home.',
    'The resident of {{LOCATION}} are known for their resilience and vitality. Our goal is to support that health through advanced neuro-imaging and personalized treatment protocols.',
    'Whether you are a long-time resident or new to the {{LOCATION}} area, Karma Doctors is your partner in achieving long-term mental clarity and emotional stability.',
    '{{LOCATION}} is more than just a place on a map—it''s a community of high-achieving individuals who deserve psychiatric care that is as sophisticated as the technologies they use every day.',
    'We understand the unique lifestyle of {{LOCATION}} residents. That''s why our integrative approach is designed to fit seamlessly into your life, focusing on recovery without the standard side effects.'
)

function Slugify($text) {
    $slug = $text.ToLower()
    $slug = $slug -replace '[^a-z0-9]+', '-'
    $slug = $slug.Trim('-')
    return $slug
}

if (-not (Test-Path $TemplateFile)) {
    Write-Error "Template file not found: $TemplateFile"
    exit
}

$TemplateContent = [System.IO.File]::ReadAllText($TemplateFile)

Write-Host "Starting generation of $($Locations.Count) pages..."

$Count = 0
$AboutIndex = 0

foreach ($Loc in $Locations) {
    if ($Loc -imatch 'Indio') { continue }
    
    $Slug = Slugify $Loc
    $AboutText = $AboutTemplates[$AboutIndex % $AboutTemplates.Count].Replace('{{LOCATION}}', $Loc)
    $AboutIndex++

    $Content = $TemplateContent
    $Content = $Content.Replace('Expert Psychiatrist Near Indio, CA', "Expert Psychiatrist Near $Loc, CA")
    $Content = $Content.Replace('Near Indio, CA', "Near $Loc, CA")
    $Content = $Content.Replace('Serving Indio', "Serving $Loc")
    $Content = $Content.Replace('Indio Community', "$Loc Community")
    $Content = $Content.Replace('Indio Resident', "$Loc Resident")
    $Content = $Content.Replace('psychiatrist-near-indio', "psychiatrist-near-$Slug")
    $Content = $Content.Replace('/psychiatrist-near-indio/', "/psychiatrist-near-$Slug/")

    # 1b. Proximity Office & Map Embed Customization
    $PalmSpringsGroup = @(
        'Palm Springs', 'San Bernardino', 'Riverside', 'Moreno Valley', 'Temecula', 'Murrieta',
        'Cathedral City', 'Desert Hot Springs', 'Hemet', 'San Jacinto', 'Perris', 'Lake Elsinore',
        'Beaumont', 'Banning'
    )

    $TwentyninePalmsGroup = @(
        'Twenty Nine Palms', 'Yucca Valley'
    )

    if ($PalmSpringsGroup -contains $Loc) {
        $OfficeHtml = @"
            <!-- CLINIC DIRECTORY -->
            <div style="display: grid; gap: 20px;">
                <div
                    style="display: flex; align-items: start; gap: 15px; background: var(--brand-gray); padding: 20px; border-radius: 20px; border: 1px solid #E5E7EB; border-left: 5px solid var(--brand-orange);">
                    <div
                        style="background: var(--brand-orange); color: white; width: 30px; height: 30px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 800; flex-shrink: 0;">
                        1</div>
                    <div>
                        <h4 style="font-weight: 800; color: var(--brand-dark); font-size: 18px; margin-bottom: 5px;">
                            Palm Springs <span style="background: var(--brand-orange); color: white; font-size: 11px; padding: 2px 8px; border-radius: 10px; margin-left: 8px; font-weight: 800; text-transform: uppercase;">Closest Office</span></h4>
                        <p style="color: #6B7280; font-size: 14px;">560 S Paseo Dorotea, Suite 4-B, Palm Springs, CA 92264</p>
                    </div>
                </div>
                <div
                    style="display: flex; align-items: start; gap: 15px; background: var(--brand-gray); padding: 20px; border-radius: 20px; border: 1px solid #E5E7EB;">
                    <div
                        style="background: var(--brand-purple); color: white; width: 30px; height: 30px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 800; flex-shrink: 0;">
                        2</div>
                    <div>
                        <h4 style="font-weight: 800; color: var(--brand-dark); font-size: 18px; margin-bottom: 5px;">
                            Rancho Mirage</h4>
                        <p style="color: #6B7280; font-size: 14px;">35400 Bob Hope Dr. Suite 206, Rancho Mirage, CA 92270</p>
                    </div>
                </div>
                <div
                    style="display: flex; align-items: start; gap: 15px; background: var(--brand-gray); padding: 20px; border-radius: 20px; border: 1px solid #E5E7EB;">
                    <div
                        style="background: var(--brand-purple); color: white; width: 30px; height: 30px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 800; flex-shrink: 0;">
                        3</div>
                    <div>
                        <h4 style="font-weight: 800; color: var(--brand-dark); font-size: 18px; margin-bottom: 5px;">
                            Twentynine Palms</h4>
                        <p style="color: #6B7280; font-size: 14px;">72724 29 Palms Hwy. Suite 107, Twentynine Palms, CA 92277</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- GOOGLE MAP -->
        <div
            style="height: 550px; border-radius: 30px; overflow: hidden; box-shadow: 0 20px 60px rgba(96, 49, 119, 0.12);">
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3416.7118465902095!2d-116.53856102412097!3d33.80582967324902!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80db1b58ab263901%3A0xa193fa021ad5815a!2s560%20S%20Paseo%20Dorotea%20%234b%2C%20Palm%20Springs%2C%20CA%2092264!5e0!3m2!1sen!2sus!4v1700000000000"
                width="100%" height="100%" style="border: 0;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade">
            </iframe>
        </div>
"@
    } elseif ($TwentyninePalmsGroup -contains $Loc) {
        $OfficeHtml = @"
            <!-- CLINIC DIRECTORY -->
            <div style="display: grid; gap: 20px;">
                <div
                    style="display: flex; align-items: start; gap: 15px; background: var(--brand-gray); padding: 20px; border-radius: 20px; border: 1px solid #E5E7EB; border-left: 5px solid var(--brand-orange);">
                    <div
                        style="background: var(--brand-orange); color: white; width: 30px; height: 30px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 800; flex-shrink: 0;">
                        1</div>
                    <div>
                        <h4 style="font-weight: 800; color: var(--brand-dark); font-size: 18px; margin-bottom: 5px;">
                            Twentynine Palms <span style="background: var(--brand-orange); color: white; font-size: 11px; padding: 2px 8px; border-radius: 10px; margin-left: 8px; font-weight: 800; text-transform: uppercase;">Closest Office</span></h4>
                        <p style="color: #6B7280; font-size: 14px;">72724 29 Palms Hwy. Suite 107, Twentynine Palms, CA 92277</p>
                    </div>
                </div>
                <div
                    style="display: flex; align-items: start; gap: 15px; background: var(--brand-gray); padding: 20px; border-radius: 20px; border: 1px solid #E5E7EB;">
                    <div
                        style="background: var(--brand-purple); color: white; width: 30px; height: 30px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 800; flex-shrink: 0;">
                        2</div>
                    <div>
                        <h4 style="font-weight: 800; color: var(--brand-dark); font-size: 18px; margin-bottom: 5px;">
                            Rancho Mirage</h4>
                        <p style="color: #6B7280; font-size: 14px;">35400 Bob Hope Dr. Suite 206, Rancho Mirage, CA 92270</p>
                    </div>
                </div>
                <div
                    style="display: flex; align-items: start; gap: 15px; background: var(--brand-gray); padding: 20px; border-radius: 20px; border: 1px solid #E5E7EB;">
                    <div
                        style="background: var(--brand-purple); color: white; width: 30px; height: 30px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 800; flex-shrink: 0;">
                        3</div>
                    <div>
                        <h4 style="font-weight: 800; color: var(--brand-dark); font-size: 18px; margin-bottom: 5px;">
                            Palm Springs</h4>
                        <p style="color: #6B7280; font-size: 14px;">560 S Paseo Dorotea, Suite 4-B, Palm Springs, CA 92264</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- GOOGLE MAP -->
        <div
            style="height: 550px; border-radius: 30px; overflow: hidden; box-shadow: 0 20px 60px rgba(96, 49, 119, 0.12);">
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3408.016335345718!2d-116.0592911241113!3d34.13327667312762!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80dad019fa76a445%3A0xb3cd2b027d142d17!2s72724%2029%20Palms%20Hwy%20%23107%2C%20Twentynine%20Palms%2C%20CA%2092277!5e0!3m2!1sen!2sus!4v1700000000000"
                width="100%" height="100%" style="border: 0;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade">
            </iframe>
        </div>
"@
    } else {
        $OfficeHtml = @"
            <!-- CLINIC DIRECTORY -->
            <div style="display: grid; gap: 20px;">
                <div
                    style="display: flex; align-items: start; gap: 15px; background: var(--brand-gray); padding: 20px; border-radius: 20px; border: 1px solid #E5E7EB; border-left: 5px solid var(--brand-orange);">
                    <div
                        style="background: var(--brand-orange); color: white; width: 30px; height: 30px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 800; flex-shrink: 0;">
                        1</div>
                    <div>
                        <h4 style="font-weight: 800; color: var(--brand-dark); font-size: 18px; margin-bottom: 5px;">
                            Rancho Mirage <span style="background: var(--brand-orange); color: white; font-size: 11px; padding: 2px 8px; border-radius: 10px; margin-left: 8px; font-weight: 800; text-transform: uppercase;">Closest Office</span></h4>
                        <p style="color: #6B7280; font-size: 14px;">35400 Bob Hope Dr. Suite 206, Rancho Mirage, CA 92270</p>
                    </div>
                </div>
                <div
                    style="display: flex; align-items: start; gap: 15px; background: var(--brand-gray); padding: 20px; border-radius: 20px; border: 1px solid #E5E7EB;">
                    <div
                        style="background: var(--brand-purple); color: white; width: 30px; height: 30px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 800; flex-shrink: 0;">
                        2</div>
                    <div>
                        <h4 style="font-weight: 800; color: var(--brand-dark); font-size: 18px; margin-bottom: 5px;">
                            Palm Springs</h4>
                        <p style="color: #6B7280; font-size: 14px;">560 S Paseo Dorotea, Suite 4-B, Palm Springs, CA 92264</p>
                    </div>
                </div>
                <div
                    style="display: flex; align-items: start; gap: 15px; background: var(--brand-gray); padding: 20px; border-radius: 20px; border: 1px solid #E5E7EB;">
                    <div
                        style="background: var(--brand-purple); color: white; width: 30px; height: 30px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 800; flex-shrink: 0;">
                        3</div>
                    <div>
                        <h4 style="font-weight: 800; color: var(--brand-dark); font-size: 18px; margin-bottom: 5px;">
                            Twentynine Palms</h4>
                        <p style="color: #6B7280; font-size: 14px;">72724 29 Palms Hwy. Suite 107, Twentynine Palms, CA 92277</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- GOOGLE MAP -->
        <div
            style="height: 550px; border-radius: 30px; overflow: hidden; box-shadow: 0 20px 60px rgba(96, 49, 119, 0.12);">
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3415.7001479860367!2d-116.41725512411986!3d33.784534773258525!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80db1be5165b4c69%3A0xe51f28b495204481!2s35400%20Bob%20Hope%20Dr%20%23206%2C%20Rancho%20Mirage%2C%20CA%2092270!5e0!3m2!1sen!2sus!4v1700000000000"
                width="100%" height="100%" style="border: 0;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade">
            </iframe>
        </div>
"@
    }

    $Content = $Content -replace '(?s)<!--\s*CLINIC\s+DIRECTORY\s*-->.*?<\/iframe>\s*<\/div>', $OfficeHtml
    
    $IndioAbout = "Indio, the vibrant heart of the Coachella Valley, is home to a diverse and growing community of over 90,000 residents. Known for its rich cultural heritage, the annual Coachella and Stagecoach festivals, and the beautiful desert landscape, Indio is a city that pulses with energy and life."
    $Content = $Content.Replace($IndioAbout, $AboutText)
    
    $Content = $Content.Replace('downtown Indio', "downtown $Loc")
    $Content = $Content.Replace('central Indio', "central $Loc")
    
    $FilePath = Join-Path $BaseDir "psychiatrist-near-$Slug.html"
    [System.IO.File]::WriteAllText($FilePath, $Content)
    
    $Count++
    if ($Count % 50 -eq 0) {
        Write-Host "Generated $Count pages..."
    }
}

Write-Host "Done! Total pages generated: $Count"
