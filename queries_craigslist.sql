-- List users organized by region
SELECT r.name, username FROM users u
JOIN regions r ON u.preferred_region = r.id
ORDER BY r.name ASC, username ASC;

-- List all posts headlines and text organized by category with newer posts before older ones
SELECT c.name AS category, p.headline, p.content FROM posts p
JOIN post_categories pc ON p.id = pc.post_id
JOIN categories c ON c.id = pc.category_id
ORDER BY category ASC, p.id DESC;

-- Show number of posts per region in descending order of post qty, then sorted alphabetically
SELECT r.name AS region, COUNT(*) FROM regions r
JOIN posts p ON r.id = p.region_id
GROUP BY region
ORDER BY COUNT(*) DESC, region ASC;

-- Show number of posts per user in descending order of post qty, then sorted alphabetically
SELECT username, COUNT(*) FROM users u
JOIN posts p ON u.id = p.user_id
GROUP BY username
ORDER BY COUNT(*) DESC, username ASC;