-- LIST ALL PERMISSIONS WITH ROLES

-- CREATE FUNCTION listAllPermissionsWithRoles()
-- RETURNS TABLE
-- AS
-- RETURN (
--    SELECT 
--     dp.permission_name,
--     dp.state_desc,         -- GRANT / DENY / REVOKE (REVOKE will not be visible, because REVOKE = delete)
--     dp.class_desc,
--     dp.major_id,
--     obj.name AS object_name,
--     princ.name AS grantee_name
--    FROM sys.database_permissions dp
--    JOIN sys.database_principals princ 
--        ON dp.grantee_principal_id = princ.principal_id
--    LEFT JOIN sys.objects obj 
--        ON dp.major_id = obj.object_id
-- );
-- GO

-----------------------------------------------------------------

-- List permissions for a specific user
SELECT * FROM sys.database_principals WHERE name = 'TestUser';

-- List all permissions
SELECT * FROM sys.database_permissions

-- Create a database user without login (for internal/test usage)
CREATE USER test_user WITHOUT LOGIN;

-- Create a database user linked to a server-level login
CREATE USER test_user FOR LOGIN test_login;

-- Delete a database user
DROP USER test_user

-----------------------------------------------------------------

-- GRANT <permission_type>
-- ON <object_type>::<object_name>
-- TO <principal_name>;

GRANT SELECT ON Employees TO intern 
GRANT INSERT, UPDATE ON Orders TO sales_user;

-- GRANT EXECUTE ON OBJECT::GetCustomerData TO api_user; -- SCHEMA

DENY DELETE ON Customers TO intern_user; 

-- DENY EXECUTE ON PROCEDURE::UpdateStock TO external_app; -- SCHEMA

REVOKE SELECT ON Employees FROM intern; -- TABLE
REVOKE DELETE ON Orders FROM temp_user; -- TABLE

-- REVOKE EXECUTE ON PROCEDURE::LogAccess FROM service_account; -- SCHEMA