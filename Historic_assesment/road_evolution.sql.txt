WITH time_table AS(
SELECT * FROM generate_series('2006-01-01 00:00'::timestamp,
                              '2015-11-01 00:00', '1 month') time_points)
SELECT t.time_points, sum(st_length(h.geom))
FROM new_liberia h
RIGHT JOIN time_table t ON (h.valid_from<=t.time_points AND h.valid_to >=t.time_points AND h.tags->'highway'<>'')
GROUP BY t.time_points
ORDER BY t.time_points
