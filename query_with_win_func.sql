SELECT
	STUDENT_ID,
    TEST_ID,
    GRADE_ID,
    PERIOD_ID,
    TEST_DATE,
    IF(MAX(PASS_FAIL) OVER (PARTITION BY STUDENT_ID, GRADE_ID, PERIOD_ID), '+', '-') AS METREQ,
    IF(MAX(PASS_FAIL) OVER (PARTITION BY STUDENT_ID, GRADE_ID, PERIOD_ID) = 0 AND TEST_DATE = MAX(TEST_DATE) OVER (PARTITION BY STUDENT_ID, GRADE_ID, PERIOD_ID), 1, 0) AS IN_PROGRESS
FROM exam
