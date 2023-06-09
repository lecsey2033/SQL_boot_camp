CREATE VIEW v_generated_dates 
AS SELECT day::date AS generated_date 
FROM generate_series(timestamp '2022-01-01', '2022-01-31', '1 day') AS day
ORDER BY generated_date;

