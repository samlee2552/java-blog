
package com.sbs.java.blog.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBUtil {
	
	//데이터 여러개 선택
	public static List<Map<String, Object>> selectRows(Connection conn, String sql) {
		List<Map<String, Object>> rows = new ArrayList<>();

		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			ResultSetMetaData metaData = rs.getMetaData();
			int columnSize = metaData.getColumnCount();

			while (rs.next()) {
				Map<String, Object> row = new HashMap<>();

				for (int columnIndex = 0; columnIndex < columnSize; columnIndex++) {
					String columnName = metaData.getColumnName(columnIndex + 1);
					Object value = rs.getObject(columnName);

					if (value instanceof Long) {
						int numValue = (int) (long) value;
						row.put(columnName, numValue);
					} else if (value instanceof Timestamp) {
						String dateValue = value.toString();
						dateValue = dateValue.substring(0, dateValue.length() - 2);
						row.put(columnName, dateValue);
					} else {
						row.put(columnName, value);
					}
				}

				rows.add(row);
			}
		} catch (SQLException e) {
			System.err.println("[SQLException 예외]");
			System.err.println("msg : " + e.getMessage());
		} finally {
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					System.err.println("[SQLException 예외]");
					System.err.println("msg : " + e.getMessage());
				}
			}

			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					System.err.println("[SQLException 예외]");
					System.err.println("msg : " + e.getMessage());
				}
			}
		}

		return rows;
	}
	
	//단일 데이터 선택
	public static Map<String, Object> selectRow(Connection conn, String sql) {
		List<Map<String, Object>> rows = selectRows(conn, sql);

		if (rows.size() == 0) {
			return new HashMap<String, Object>();
		}

		return rows.get(0);
	}
	
	//데이터 안에 int 선택
	public static int selectRowIntValue(Connection conn, String sql) {
		Map<String, Object> row = selectRow(conn, sql);

		for (String key : row.keySet()) {
			return (int) row.get(key);
		}

		return -1;
	}
	
	//데이터 안에 String 선택
	public static String selectRowStringValue(Connection conn, String sql) {
		Map<String, Object> row = selectRow(conn, sql);

		for (String key : row.keySet()) {
			return (String) row.get(key);
		}

		return "";
	}

	public static Boolean selectRowBooleanValue(Connection conn, String sql) {
		Map<String, Object> row = selectRow(conn, sql);
		System.out.println(row);

		for (String key : row.keySet()) {
			if (row.get(key) instanceof String) {
				return ((String) row.get(key)).equals("1");
			} else if (row.get(key) instanceof Integer) {
				return ((int) row.get(key)) == 1;
			} else if (row.get(key) instanceof Boolean) {
				return ((boolean) row.get(key));
			}
		}

		return false;
	}

	//데이터 삭제
	public static int delete(Connection conn, String sql) {
		int affectedRows = 0;

		Statement stmt;
		try {
			stmt = conn.createStatement();
			affectedRows = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			System.err.printf("[SQL 예외, SQL : %s] : %s\n", sql, e.getMessage());
		}

		return affectedRows;
	}

	//데이터 수정
	public static int update(Connection conn, String sql) {
		int affectedRows = 0;

		Statement stmt;
		try {
			stmt = conn.createStatement();
			affectedRows = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			System.err.printf("[SQL 예외, SQL : %s] : %s\n", sql, e.getMessage());
		}

		return affectedRows;
	}

	//데이터 입력
	public static int insert(Connection conn, String sql) {
		int id = -1;

		try {
			Statement stmt = conn.createStatement();
			stmt.execute(sql, Statement.RETURN_GENERATED_KEYS);
			ResultSet rs = stmt.getGeneratedKeys();

			if (rs.next()) {
				id = rs.getInt(1);
			}

		} catch (SQLException e) {
			System.err.printf("[SQL 예외, SQL : %s] : %s\n", sql, e.getMessage());
		}

		return id;
	}
}