-- 트리거 원본
-- 입력 트리거
DELIMITER $$

CREATE TRIGGER trg_AfterUpdateBook
AFTER UPDATE ON Book
FOR EACH ROW
BEGIN
    INSERT INTO Book_log
        (bookid_l, bookname_l, publisher_l, price_l, dml_type) -- 철자 주의!
    VALUES
        (OLD.bookid, OLD.bookname, OLD.publisher, OLD.price, 'UPDATE');
END $$

DELIMITER ;
-- Alt+X로 전체 실행


-- 수정 트리거. 수정은 NEW. OLD. 모두 사용가능. 
-- old만 사용추천
DELIMITER $$

CREATE TRIGGER trg_AfterUpdateBook
AFTER UPDATE ON Book
FOR EACH ROW
BEGIN
    INSERT INTO Book_log
        (bookid_l, bookname_l, publisher_l, price_l, dml_type)
    VALUES
        (OLD.bookid, OLD.bookname, OLD.publisher, OLD.price, 'UPDATE');
END;
$$
DELIMITER $$;

-- 삭제 트리거
DELIMITER $$

CREATE TRIGGER trg_AfterDeleteBook
AFTER DELETE ON Book
FOR EACH ROW
BEGIN
    INSERT INTO Book_log
        (bookid_l, bookname_l, publisher_l, price_l, dml_type)
    VALUES
        (OLD.bookid, OLD.bookname, OLD.publisher, OLD.price, 'DELETE');
END
$$
DELIMITER $$;