package com.eksad.expro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
<<<<<<< HEAD

	@RequestMapping("/login.html")
	public String loginForm() {
		return "login";
	}

	@RequestMapping("/home.html")
	public String home() {
		return "home";
	}

	@RequestMapping("/403.html")
	public String accessDenied() {
		return "403";
	}
}
=======
		
		@RequestMapping("/login.html")
		public String loginForm() {
			return "login";
		}

		@RequestMapping("/home.html")
		public String home() {
			return "home";
		}

		@RequestMapping("/403.html")
		public String accessDenied() {
			return "403";
	}
}
>>>>>>> 5e83bb6987841d0c55042b25685aa919f13a3a9c
