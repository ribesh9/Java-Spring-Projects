package com.esystem.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class esystemController {
	@RequestMapping("home")
	public String home() {
		return "/view/Home";
	}
}
