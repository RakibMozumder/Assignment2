CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    region VARCHAR(100)
);
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100),
    scientific_name VARCHAR(100),
    conservation_status VARCHAR(50),
    discovery_year INT
);
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id),
    ranger_id INT REFERENCES rangers(ranger_id),
    location VARCHAR(100),
    sighting_time TIMESTAMP,
    notes TEXT
);
INSERT INTO rangers (name, region) VALUES
('Rasel Khan', 'Shylet Forest'),
('Rakib Mozumder', 'Chittagong Forest'),
('Meera khan', 'Mangrob Forest'),
('Sanjida Rahman', 'Khulna Forest');

INSERT INTO species (common_name, scientific_name, conservation_status, discovery_year) VALUES
('Bengal Tiger', 'Panthera tigris tigris', 'Endangered', 1758),
('Snow Leopard', 'Panthera uncia', 'Vulnerable', 1775),
('Red Panda', 'Ailurus fulgens', 'Endangered', 1825),
('Asiatic Elephant', 'Elephas maximus', 'Endangered', 1750);

INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Tiger Hills', '2024-05-12 08:45:00', 'Tracked for 2 hours'),
(2, 2, 'Snowy Ridge', '2024-05-14 14:20:00', NULL),
(3, 3, 'Redwood Glade', '2024-05-15 09:10:00', 'Solo sighting'),
(2, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

-- Problem 1
INSERT INTO rangers (name, region) VALUES ('Derek Fox', 'Coastal Plains');

-- Problem 2
SELECT COUNT(DISTINCT species_id) AS unique_species_count FROM sightings;

-- Problem 3
SELECT * FROM sightings WHERE location ILIKE '%Pass%';

-- Problem 4
SELECT r.name, COUNT(s.sighting_id) AS total_sightings
FROM rangers r
LEFT JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name;

-- Problem 5
SELECT common_name
FROM species
WHERE species_id NOT IN (SELECT DISTINCT species_id FROM sightings);

-- Problem 6
SELECT sp.common_name, s.sighting_time, r.name
FROM sightings s
JOIN species sp ON s.species_id = sp.species_id
JOIN rangers r ON s.ranger_id = r.ranger_id
ORDER BY s.sighting_time DESC
LIMIT 2;

-- Problem 7
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_year < 1800;

-- Problem 8
SELECT sighting_id,
    CASE
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sighting_time) < 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;

-- Problem 9
DELETE FROM rangers
WHERE ranger_id NOT IN (SELECT DISTINCT ranger_id FROM sightings);