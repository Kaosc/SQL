DECLARE @x INT = 1;

IF @x = 1
    GOTO SkipPart;

PRINT 'This will not be printed.';

SkipPart:
PRINT 'This will be printed.';
