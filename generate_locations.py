import os
import re

# CONFIGURATION
BASE_DIR = r"c:\Users\GCV\Desktop\KarmaDocs location pages\areas-we-serve"
TEMPLATE_FILE = os.path.join(BASE_DIR, "psychiatrist-near-indio.html")

# 499 LOCATIONS (Southern California Cities and Neighborhoods)
LOCATIONS = [
    "Palm Springs", "Rancho Mirage", "Palm Desert", "Cathedral City", "Desert Hot Springs", "Indian Wells", "La Quinta", "Coachella", "Bermuda Dunes", "Thousand Palms", "Thermal", "Mecca", "Sun City Palms", "Shadow Hills", "Sun City Shadow Hills", "Terra Lago", "Sun City Palm Desert", "Trilogy at La Quinta", "PGA West", "The Hideaway", "The Madison Club", "Ironwood Country Club", "The Reserve", "Bighorn Golf Club", "The Vintage Club", "Seven Lakes", "Deep Well", "Old Las Palmas", "Vista Las Palmas", "Twin Palms", "Tahquitz River Estates", "Warm Sands", "The Mesa", "Andreas Hills", "Los Compadres", "Movie Colony", "El Mirador", "Racquet Club Estates", "Victoria Park", "Ruth Hardy Park",
    "Riverside", "Moreno Valley", "Corona", "Temecula", "Murrieta", "Jurupa Valley", "Menifee", "Hemet", "Eastvale", "San Jacinto", "Lake Elsinore", "Perris", "Wildomar", "Banning", "Beaumont", "Calimesa", "Canyon Lake", "Norco", "San Jacinto", "Breezy Heights", "Arlington", "Arlanza", "La Sierra", "Woodcrest", "Orangecrest", "Canyon Crest", "Highgrove", "Grand Terrace", "Bloomington", "Muscoy", "Devore", "Arrowhead Farms", "Sun City", "Quail Valley", "Sedco Hills", "Lakeland Village", "Meadowbrook", "Nuevo", "Winchester", "French Valley", "De Luz", "Aguanga", "Anza", "Mountain Center", "Idyllwild", "Pine Cove", "Fern Valley", "Valle Vista", "Green Acres", "Homeland", "Romoland", "Heritage Lake", "Silverhawk", "Wolf Creek", "Redhawk", "Paseo del Sol", "Morgan Hill",
    "San Bernardino", "Fontana", "Ontario", "Rancho Cucamonga", "Victorville", "Rialto", "Hesperia", "Chino", "Chino Hills", "Upland", "Apple Valley", "Redlands", "Highland", "Colton", "Yucaipa", "Loma Linda", "Barstow", "San Manuel Village", "Mentone", "Oak Glen", "Forest Falls", "Angelus Oaks", "Big Bear Lake", "Big Bear City", "Sugarloaf", "Fawnskin", "Rimforest", "Lake Arrowhead", "Blue Jay", "Cedar Glen", "Twin Peaks", "Crestline", "Green Valley Lake", "Running Springs", "Skyforest", "Lake Gregory", "Valley of Enchantment", "Silverwood Lake", "Wrightwood", "Phelan", "Pinon Hills", "Oak Hills", "Lucerne Valley", "Johnson Valley", "Yucca Valley", "Joshua Tree", "Twentynine Palms", "Landers", "Morongo Valley", "Pioneertown", "Sky Valley", "Desert Edge", "North Palm Springs", "Whitewater", "Cabazon",
    "Santa Ana", "Anaheim", "Irvine", "Huntington Beach", "Garden Grove", "Orange", "Fullerton", "Costa Mesa", "Mission Viejo", "Westminster", "Newport Beach", "Lake Forest", "Tustin", "Yorba Linda", "San Clemente", "Laguna Niguel", "La Habra", "Fountain Valley", "Placentia", "Aliso Viejo", "Cypress", "Rancho Santa Margarita", "Brea", "Stanton", "San Juan Capistrano", "Dana Point", "Laguna Hills", "Seal Beach", "Laguna Beach", "Laguna Woods", "La Palma", "Los Alamitos", "Villa Park", "Coto de Caza", "Ladera Ranch", "Las Flores", "Midway City", "North Tustin", "Rossmoor", "Silverado", "Trabuco Canyon",
    "Long Beach", "Glendale", "Santa Clarita", "Lancaster", "Palmdale", "Pomona", "Torrance", "Pasadena", "El Monte", "Downey", "Inglewood", "West Covina", "Norwalk", "Burbank", "Compton", "South Gate", "Santa Monica", "Carson", "Santa Fe Springs", "Whittier", "Hawthorne", "Alhambra", "Lakewood", "Bellflower", "Baldwin Park", "Lynwood", "Redondo Beach", "Montebello", "Pico Rivera", "Monterey Park", "Gardena", "Huntington Park", "Arcadia", "Diamond Bar", "Paramount", "Rosemead", "Glendora", "Cerritos", "La Mirada", "Covina", "Azusa", "Bell Gardens", "La Puente", "Rancho Palos Verdes", "San Gabriel", "Culver City", "Monrovia", "Bell", "Manhattan Beach", "Hills", "Temple City", "San Dimas", "Lawndale", "La Verne", "Walnut", "Maywood", "South Pasadena", "Cudahy", "San Marino", "Commerce", "Malibu", "Agoura Hills", "Signal Hill", "Sierra Madre", "Westlake Village", "Rolling Hills Estates", "Rolling Hills", "Hidden Hills", "Bradbury", "Irwindale", "Industry", "Vernon", "La Crescenta", "Altadena", "Marina del Rey", "Playa del Rey", "Playa Vista", "Venice", "Mar Vista", "Palms", "Brentwood", "Bel Air", "Pacific Palisades", "Westwood", "Century City", "Beverly Grove", "Fairfax District", "Miracle Mile", "Hancock Park", "Windsor Square", "Larchmont Village", "Silver Lake", "Echo Park", "Atwater Village", "Glassell Park", "Mount Washington", "Eagle Rock", "Highland Park", "Boyle Heights", "Lincoln Heights", "El Sereno", "Chinatown", "Koreatown", "Wilshire Center", "Westlake", "Pico-Union", "Harvard Heights", "West Adams", "Jefferson Park", "Leimert Park", "View Park", "Windsor Hills", "Baldwin Hills", "Crenshaw", "Faircrest Heights", "Reynier Village", "Lafayette Square", "Arlington Heights", "Mid-City", "Carthay Circle", "Cheviot Hills", "Rancho Park", "Sawtelle", "Del Rey", "Studio City", "Sherman Oaks", "Encino", "Tarzana", "Woodland Hills", "Warner Center", "West Hills", "Canoga Park", "Winnetka", "Reseda", "Lake Balboa", "Van Nuys", "Valley Glen", "Valley Village", "North Hollywood", "Toluca Lake", "Sun Valley", "Pacoima", "Arleta", "Panorama City", "North Hills", "Mission Hills", "Sylmar", "San Fernando", "Granada Hills", "Porter Ranch", "Chatsworth", "Northridge", "Lake View Terrace", "Shadow Hills", "Sunland", "Tujunga",
    "Oceanside", "Escondido", "Carlsbad", "Vista", "San Marcos", "Encinitas", "Poway", "Solana Beach", "Del Mar", "Fallbrook", "Bonsall", "Valley Center", "Pauma Valley", "Palomar Mountain", "Warner Springs", "Ranchita", "Borrego Springs", "Julian", "Santa Ysabel", "Ramona", "Lakeside", "Alpine", "Descanso", "Pine Valley", "Guatay", "Mount Laguna", "Boulevard", "Jacumba", "Campo", "Potrero", "Tecate", "Dulzura", "Jamul", "Spring Valley", "Lemon Grove", "La Mesa", "El Cajon", "Santee", "Imperial Beach", "Chula Vista", "National City", "Bonita", "Coronado", "Point Loma", "Ocean Beach", "Mission Beach", "Pacific Beach", "La Jolla", "Clairemont", "Kearny Mesa", "Mira Mesa", "Scripps Ranch", "Tierrasanta", "Allied Gardens", "Del Cerro", "San Carlos", "Navajo", "Rancho Bernardo", "Rancho Penasquitos", "Carmel Valley", "Sorento Valley", "Torrey Pines", "Torrey Hills", "Black Mountain Ranch", "Santa Luz", "Rancho Santa Fe", "Fairbanks Ranch", "4S Ranch", "Scripps Miramar Ranch",
    "El Centro", "Brawley", "Calexico", "Imperial", "Holtville", "Westmorland", "Calipatria", "Niland", "Heber", "Seeley", "Salton City", "Ocotillo", "Winterhaven", "Palo Verde", "Bard", "Bombay Beach", "Desert Shores", "Vista del Mar", "Salton Sea Beach",
    "Santa Barbara", "Santa Maria", "Lompoc", "Orcutt", "Goleta", "Carpinteria", "Montecito", "Summerland", "Solvang", "Buellton", "Santa Ynez", "Los Olivos", "Ballard", "Newlove", "Garey", "Sisquoc", "Casmalia", "Vandenberg Village", "Guadalupe", "Los Alamos",
    "Ventura", "Oxnard", "Simi Valley", "Thousand Oaks", "Camarillo", "Moorpark", "Santa Paula", "Fillmore", "Port Hueneme", "Ojai", "Oak View", "Meiners Oaks", "Mira Monte", "Oak Park", "Casa Conejo", "Santa Rosa Valley", "Bell Canyon", "Lake Sherwood", "Somis", "Saticoy", "El Rio", "Nyeland Acres", "Silver Strand", "Hollywood Beach", "Hollywood by the Sea", "Piru", "Upper Ojai", "Point Mugu",
    "Rancho Mirage South", "Rancho Mirage North", "Palm Springs West", "Palm Springs East", "Cathedral City South", "Desert Hot Springs North", "Indio Hills", "Mecca North", "Thermal South", "Coachella East", "La Quinta West", "Palm Desert South", "Indian Wells North"
]

# CONTENT VARIATIONS for "About [Location]"
ABOUT_TEMPLATES = [
    "{{LOCATION}} is a vibrant and growing community that values high-quality lifestyle and professional excellence. However, access to specialized mental health care hasn't always kept pace with the community's growth.",
    "Known for its unique character and scenic beauty, {{LOCATION}} is home to thousands of residents who deserve the absolute best in modern psychiatric care and neurological wellness.",
    "{{LOCATION}} represents the diverse and energetic spirit of Southern California. Karma Doctors & Associates is proud to bridge the gap in specialized mental healthcare for this exceptional area.",
    "As {{LOCATION}} continues to evolve, the demand for cutting-edge, data-driven psychiatric treatments is higher than ever. We are committed to serving the families and professionals of {{LOCATION}}.",
    "From its local landmarks to its tight-knit neighborhoods, {{LOCATION}} is a place where community matters. We bring that same sense of personalized care to every patient we see from {{LOCATION}}.",
    "Nestled within the region's dynamic landscape, {{LOCATION}} residents often find themselves traveling long distances for expert care. We are changing that by bringing elite psychiatry closer to home.",
    "The resident of {{LOCATION}} are known for their resilience and vitality. Our goal is to support that health through advanced neuro-imaging and personalized treatment protocols.",
    "Whether you are a long-time resident or new to the {{LOCATION}} area, Karma Doctors is your partner in achieving long-term mental clarity and emotional stability.",
    "{{LOCATION}} is more than just a place on a map—it's a community of high-achieving individuals who deserve psychiatric care that is as sophisticated as the technologies they use every day.",
    "We understand the unique lifestyle of {{LOCATION}} residents. That's why our integrative approach is designed to fit seamlessly into your life, focusing on recovery without the standard side effects."
]

def slugify(text):
    slug = text.lower()
    slug = re.sub(r'[^a-z0-9]+', '-', slug).strip('-')
    return slug

def main():
    if not os.path.exists(TEMPLATE_FILE):
        print(f"Error: Template file not found: {TEMPLATE_FILE}")
        return

    with open(TEMPLATE_FILE, "r", encoding="utf-8") as f:
        template = f.read()

    # Pre-process the template to handle replacements accurately
    # We replace "Indio" and "indio" with placeholders in the template once
    # but we must be careful not to break assets or specific strings.
    
    # Let's create a "working template"
    # We'll replace the word "Indio" in specific contexts
    template = template.replace("Expert Psychiatrist Near Indio, CA", "Expert Psychiatrist Near {{LOCATION}}, CA")
    template = template.replace("Near Indio, CA", "Near {{LOCATION}}, CA")
    template = template.replace("Serving Indio", "Serving {{LOCATION}}")
    template = template.replace("Indio Community", "{{LOCATION}} Community")
    template = template.replace("Indio Resident", "{{LOCATION}} Resident")
    template = template.replace("psychiatrist-near-indio", "psychiatrist-near-{{SLUG}}")
    template = template.replace("/psychiatrist-near-indio/", "/psychiatrist-near-{{SLUG}}/")
    
    # The specific "About Indio" paragraph
    indio_about = "Indio, the vibrant heart of the Coachella Valley, is home to a diverse and growing community of over 90,000 residents. Known for its rich cultural heritage, the annual Coachella and Stagecoach festivals, and the beautiful desert landscape, Indio is a city that pulses with energy and life."
    template = template.replace(indio_about, "{{ABOUT_TEXT}}")

    print(f"Starting generation of {len(LOCATIONS)} pages...")

    count = 0
    for i, loc in enumerate(LOCATIONS):
        slug = slugify(loc)
        about_text = ABOUT_TEMPLATES[i % len(ABOUT_TEMPLATES)].replace("{{LOCATION}}", loc)
        
        content = template.replace("{{LOCATION}}", loc)
        content = content.replace("{{SLUG}}", slug)
        content = content.replace("{{ABOUT_TEXT}}", about_text)
        
        # Final catch-all for any remaining "Indio" case-insensitive (be careful)
        # content = re.sub(r'\bIndio\b', loc, content) 
        # Actually, let's stick to explicit replacements to avoid breaking links like "downtown Indio" vs "downtown {{LOCATION}}"
        content = content.replace("downtown Indio", f"downtown {loc}")
        content = content.replace("central Indio", f"central {loc}")
        
        file_path = os.path.join(BASE_DIR, f"psychiatrist-near--{slug}.html")
        
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(content)
        
        count += 1
        if count % 50 == 0:
            print(f"Generated {count} pages...")

    print(f"Done! Total pages generated: {count}")

if __name__ == "__main__":
    main()
