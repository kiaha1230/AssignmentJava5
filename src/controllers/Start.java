package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Start {
	@RequestMapping("start")
	public String start() {
		return "main/start";
	}

}
