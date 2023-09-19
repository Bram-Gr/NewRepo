-- ********************************************************************************
-- This script creates the database users and grants them the necessary permissions
-- ********************************************************************************

CREATE USER quizzical_owner
WITH PASSWORD 'quizzical_learning';

GRANT ALL
ON ALL TABLES IN SCHEMA public
TO quizzical_owner;

GRANT ALL
ON ALL SEQUENCES IN SCHEMA public
TO final_capstone_owner;

CREATE USER quizzical_appuser
WITH PASSWORD 'quizzical_learning';

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO quizzical_appuser;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO quizzical_appuser;
