SELECT a.first_name, COUNT(*) FROM authors a
LEFT JOIN book_authors b ON (a.author_id=b.author_id)
GROUP BY a.first_name
LIMIT 1