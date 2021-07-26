SELECT a.title, CONCAT(d.first_name,' ',d.last_name) FROM books a
LEFT JOIN book_genres b ON (a.book_id=b.book_id)
LEFT JOIN book_authors c ON (a.book_id=c.book_id)
LEFT JOIN authors d ON (c.author_id=d.author_id)
WHERE b.genre="Фантастика"