// MySQL CRUD

#define NOMINMAX	// Window 매크로 충돌
#include <iostream>
#include <mysql.h>
#include <Windows.h>
#include <clocale>
#include <string>
#include <limits>

using namespace std;

// 메뉴 출력
void printMenu() {
	cout << "==================================================\n";
	cout << "               MySQL CRUD 예제\n";
	cout << "==================================================\n";
	cout << "1. 조회\n";
	cout << "2. 추가\n";
	cout << "3. 수정\n";
	cout << "4. 삭제\n";
	cout << "5. 종료\n";
	cout << "선택\n";


}

// 입력 버퍼 클리어
void clearInput() {
	cin.clear();
	cin.ignore(numeric_limits<streamsize>::max(), '\n');
}

//MySQL 접속
MYSQL* connectDB() {
	MYSQL* conn = mysql_init(NULL);	//초기화 인자는 옵션
	// 초기화 실패
	if (conn == NULL) {
		cerr << "MySQL 초기화 실패" << endl;
		return NULL; // 함수 탈출
	}

	// 접속 시도
	conn = mysql_real_connect(
		conn,
		"127.0.0.1",
		"madang",
		"madang",
		"madangdb",
		3306,
		NULL,
		0
	);

	// 접속 실패
	if (conn == NULL) {
		cerr << "MysQL접속 실패 : " << mysql_error(conn) << endl;
		return NULL; // 함수 탈충
	}
	// MYSQL

	return conn;
}

// SELECT 조회함수
void selectBook(MYSQL* conn) {
	const char* query = "SELECT bookid, bookname, publisher, price FROM Book";

	if (mysql_query(conn, query) != 0) {
		cerr << "SELECT 에러 : " << mysql_error(conn) << endl;
		return;
	}
	MYSQL_RES* result = mysql_store_result(conn);
	if (result == NULL) {
		cerr << "Result 에러 : " << mysql_error(conn) << endl;
		return;
	}

	MYSQL_ROW row;

	cout << "\n========================================\n";
	cout << "\n=================도서정보===============\n";
	cout << "\n========================================\n";
	cout << "\nbookid\tbookname\tpublisher\tprice\n";
	cout << "\n========================================\n";

	// 조회에 사용
	while ((row = mysql_fetch_row(result)) != NULL) {
		cout << row[0] << '\t' << row[1] << '\t'
			<< row[2] << '\t' << (row[3] ? row[3] : "0") << "\n";
	}
}

// INSERT 실행함수
void insertBook(MYSQL* conn) {
	string bookid;
	string bookname;
	string publisher;
	string price;

	clearInput();
	cout << "\nbookid > ";
	getline(cin, bookid);

	cout << "bookname > ";
	getline(cin, bookname);

	cout << "publosher > ";
	getline(cin, publisher);

	cout << "price > ";
	getline(cin, price);

	// bookid, price int형, to_string()으로 형변환 // 쉼표 주의
	string query = "INSERT INTO Book VALUES (" + bookid + ", '" + bookname + "', '" + publisher + "', " + price + ")";

	if (mysql_query(conn, query.c_str()) != 0) {
		cerr << "INSERT 에러 : " << mysql_error(conn) << endl;
		return;
	}

	cout << mysql_affected_rows(conn) << " 건 INSERT 완료\n\n";


}

// UPDATE 실행함수
void updateBook(MYSQL* conn) {
	string bookid;
	string bookname;
	string publisher;
	string price;

	clearInput();
	cout << "\nbookid > ";
	getline(cin, bookid);

	cout << "bookname > ";
	getline(cin, bookname);

	cout << "publosher > ";
	getline(cin, publisher);

	cout << "price > ";
	getline(cin, price);

	string query = "UPDATE Book "
		" SET bookname = '"
		+ bookname + "', publisher = '"
		+ publisher + "', price = "
		+ price + " WHERE bookid = " + bookid;

	// 쿼리실행
	if (mysql_query(conn, query.c_str()) != 0) {
		cerr << "UPDATE 에러 : " << mysql_error(conn) << endl;
		return;
	}

	uint64_t count = mysql_affected_rows(conn);

	if (count == 0) {
		cout << "해당 bookid가 없습니다.\n\n";
	}
	else {
		cout << count << "건 UPDATE 완료" << endl;
	}

}

// DELETE 실행함수
void deleteBook(MYSQL* conn) {
	string bookid;

	clearInput();
	cout << "\nbookid > ";
	getline(cin, bookid);

	string query = "DELETE FROM Book WHERE bookid = " + bookid;

	// 쿼리실행
	if (mysql_query(conn, query.c_str()) != 0) {
		cerr << "DELETE 에러 : " << mysql_error(conn) << endl;
		return;
	}
	uint64_t count = mysql_affected_rows(conn);

	if (count == 0) {
		cout << "해당 bookid가 없습니다.\n\n";
	}
	else {
		cout << count << "건 DELETE 완료" << endl;
	}

}

int main()
{
	// 콘솔 utf-8 설정
	SetConsoleOutputCP(CP_UTF8);
	SetConsoleCP(CP_UTF8);
	setlocale(LC_ALL, ".UTF8");

	// DB연결
	MYSQL*conn = connectDB();
	if (conn == NULL) {
		return 1; // 종료
	}

	cout << "MySQL 연결 성공!\n";
	
	while (true) {
		int menu;
		// 메뉴출력
		printMenu();
		cin >> menu; // 메뉴를 출력

		// 숫자이외 잘못된 입력
		if (cin.fail()) {
			clearInput();
			cout << "메뉴는 숫자로 입력\n\n";
			continue;
		}

		switch(menu) {
		case 1:
			//SELECT
			//cout << "조회 실행" << endl;
			selectBook(conn);
			break;

		case 2:
			//INSERT
			//cout << "추가 실행" << endl;
			insertBook(conn);
			break;

		case 3:
			// update
			//cout << "수정 실행" << endl;
			updateBook(conn);
			break;

		case 4:
			// delete
			//cout << "삭제 실행" << endl;
			deleteBook(conn);
			break;

		case 5: // 프로그램 종료
			// 접속 종료
			cout << "종료 실행" << endl;
			mysql_close(conn);
			return 0;
		default:
			cout << "잘못된 메뉴\n\n";
			break;
		}
	}

	// 연결종료
	mysql_close(conn);
	return 0;
}

