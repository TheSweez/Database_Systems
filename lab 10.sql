--#1 Function PreReqsFor(courseNum) - Returns the immediate prerequisites for the passed-in course	number. --

CREATE OR REPLACE FUNCTION PreReqsFor(INT, REFCURSOR) 
RETURNS REFCURSOR AS $$ DECLARE
        course INT:=$1;
        resultset REFCURSOR:=$2;
BEGIN
        open resultset FOR
        SELECT prereqnum
        FROM prerequisites
        WHERE courseNum = course;
        RETURN resultset;
END;
$$ LANGUAGE plpgsql;

SELECT PreReqsFor(499, 'results');
FETCH ALL FROM results;

--#2 function IsPreReqFor(courseNum) - Returns the courses for which the passed-in course number is an immediate pre-requisite. --

CREATE OR REPLACE FUNCTION IsPreReqFor(INT, REFCURSOR)
RETURNS refcursor AS $$ DECLARE
       prereq int:=$1;
       RESULTSET REFCURSOR:=$2;
BEGIN
       OPEN RESULTSET FOR
       SELECT coursenum
       FROM prerequisites
       WHERE prereqnum = prereq;
       RETURN RESULTSET;
END;
$$ LANGUAGE plpgsql;

SELECT IsPreReqFor(120, 'results');
FETCH ALL FROM results;











