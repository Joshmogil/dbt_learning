CREATE USER dbt WITH PASSWORD 'password';
GRANT SELECT ON ALL TABLES IN SCHEMA public TO dbt;