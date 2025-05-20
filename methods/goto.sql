DECLARE @x INT = 1;

IF @x = 1
    GOTO SkipPart;

PRINT 'This will not be printed.';

SkipPart:
PRINT 'This will be printed.';

-- Even if the GOTO statement is not executed, the PRINT statement under SkipPart will be printed.