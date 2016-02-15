SELECT count(h.id), sum(st_length(h.geom))
FROM new_hist_line h 
WHERE h.valid_from<='2015-11-01 00:00'::timestamp AND h.valid_to >='2015-11-01 00:00'::timestamp AND h.tags->'highway'<> 
ALL ( ARRAY['motorway', 'trunk', 'primary', 'secondary', 'tertiary', 'unclassified', 'residential', 'service', 'motorway_link',
 'trunk_link', 'primary_link', 'secondary_link', 'tertiary_link', 'living_street', 'pedestrian', 'track', 'bus_guideway', 'raceway',
'road', 'footway', 'bridleway', 'steps', 'path', 'cycleway', 'proposed', 'construction', 'escape'] )
