package controllers;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import entity.UserEntity;

@Transactional
@Controller
@RequestMapping("/users/")
public class UserController {
	@Autowired
	SessionFactory sessionFactory;

	@RequestMapping("login")
	public String login() {
		return "users/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(ModelMap model, @RequestParam("username") String username,
			@RequestParam("password") String password, HttpSession httpSession) {
		Session session = sessionFactory.getCurrentSession();
		try {
			UserEntity user = (UserEntity) session.get(UserEntity.class, username);
			if (!user.getPassword().equals(password)) {
				model.addAttribute("message", "Mật khẩu không chính xác !");
			} else {
				httpSession.setAttribute("user", user);
				return "redirect:/staffs/top10.htm";
			}
		} catch (Exception e) {
			model.addAttribute("message", "Tên đăng nhập không chính xác !");
		}

		return "users/login";
	}

}
