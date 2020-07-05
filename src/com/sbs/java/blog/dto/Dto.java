package com.sbs.java.blog.dto;

import java.util.HashMap;
import java.util.Map;

public class Dto {
	private int id;
	private String regDate;
	private Map<String, Object> extra; //부가적인 정보 저장을 위한 

	public Dto(Map<String, Object> row) {
		this.id = (int)row.get("id");
		this.regDate = (String)row.get("regDate");
		this.extra = new HashMap<>();
		
		for (String key: row.keySet())/* HashMap 반복 */ {
			if (key.startsWith("extra__")) {
				Object value = row.get(key);
				String extraKey = key.substring(7);
				this.extra.put(key, value);
			}
		}
	}

	@Override
	public String toString() {
		return String.format("Dto [id=%s, regDate=%s, extra=%s]", id, regDate, extra);
	}

	public Map<String, Object> getExtra() {
		return extra;
	}

	public void setExtra(Map<String, Object> extra) {
		this.extra = extra;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	
}
