package com.sbs.java.blog.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomeController extends Controller {

	@Override
	public String doAction(String actionMethodName, HttpServletRequest req, HttpServletResponse resp) {
		switch (actionMethodName) {
		case "main":
			return showMainPage();
		case "aboutMe":
			return showAboutMe();
		}
		return "";
	}

	private String showAboutMe() {
		return "home/aboutMe";
	}

	private String showMainPage() {
		return "home/main";
	}
}
