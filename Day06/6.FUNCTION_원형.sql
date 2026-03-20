-- 함수 원형 fnc_Interest
CREATE FUNCTION fnc_Interest(
	price INT
) RETURNS int
BEGIN
	-- 변수 선언
	DECLARE myInterest INT;
	-- 가격이 30,000원 이상이면 10%, 그 미만은 5% 이윤남김
	
	IF price >= 30000 THEN 
		SET myInterest = price * 10 / 100;
	ELSE
		SET myInterest = price * 5 / 100;
	END IF;
	
	RETURN myInterest;
END

-- 함수 원형 
CREATE FUNCTION fnc_balanceGrade(
	balance INTEGER
) RETURNS varchar(20)
    DETERMINISTIC
BEGIN
	declare grade varchar(20);
	
	if balance >= 50000 then
		set grade = 'VIP';
	elseif balance >= 20000 then
		set grade = 'GOLD';		
	else
		set grade = 'SILVER';
	end if;

	return grade;
END