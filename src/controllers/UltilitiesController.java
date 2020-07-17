package controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.jsp.PageContext;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.DepartEntity;
import entity.StaffEntity;

@Controller
@Transactional
@RequestMapping("/lmao/")
public class UltilitiesController {
	@Autowired
	SessionFactory sessionFactory;

	@RequestMapping("forgotAccount")
	public String forgotPassword() {
		return "lmao/forgetAccount";
	}

	@RequestMapping("test")
	public String test(ModelMap model) {
		
		return "depart/sure";
	}
}
