SELECT count(h.id), sum(st_length(h.geom)) 
FROM new_hist_line h
WHERE h.valid_from<='2015-11-01 00:00'::timestamp AND h.valid_to >='2015-11-01 00:00'::timestamp AND h.tags->'highway'='unclassified'
