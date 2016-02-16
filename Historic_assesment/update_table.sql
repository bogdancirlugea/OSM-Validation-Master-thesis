CREATE TABLE new_hist_line AS
SELECT * FROM hist_line
UPDATE new_hist_line SET valid_to='2999-01-01 00:00' WHERE valid_to IS NULL;
