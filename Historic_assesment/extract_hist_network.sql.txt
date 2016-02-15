CREATE TABLE guinea_may14 AS
SELECT * FROM new_hist_line h
WHERE h.valid_from <= '2014-05-01 00:00'::timestamp AND h.valid_to >= '2014-05-01 00:00'::timestamp AND h.tags->'highway'<>'';
