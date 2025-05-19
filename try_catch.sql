-- BEGIN TRY
--     -- logic to execute
-- END TRY
-- BEGIN CATCH
--     -- logic to handle error
-- END CATCH

BEGIN TRY
    -- Division by zero error
    DECLARE @x INT = 1, @y INT = 0;
    DECLARE @z INT;
    SET @z = @x / @y;  -- This will cause a division by zero error
END TRY
BEGIN CATCH
    PRINT 'An error occurred:';
    PRINT ERROR_MESSAGE();  -- Prints the error message
END CATCH

-- | Fonksiyon           | Açıklama                     |
-- | ------------------- | -----------------------------|
-- | `ERROR_MESSAGE()`   | Error message returns        |
-- | `ERROR_NUMBER()`    | Error number returns         |
-- | `ERROR_SEVERITY()`  | Error severity returns       |
-- | `ERROR_LINE()`      | Error line number returns    |
-- | `ERROR_PROCEDURE()` | Error procedure name returns |
