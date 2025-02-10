package com.summerproject.Controller;

import java.util.List;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.summerproject.entity.Employee;
import com.summerproject.entity.Printed;
import com.summerproject.entity.PrintingPending;
import com.summerproject.entity.Printingshop;
import com.summerproject.service.CustomerRepository;
import com.summerproject.service.PrintedRepository;
import com.summerproject.service.PrintingPendingRepository;
import com.summerproject.service.PrintingShopRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class PrintingShopController {
	@Autowired
	PrintingShopRepository psr;
	
	@Autowired
	CustomerRepository cr;
	
	@Autowired
	PrintedRepository pr;
	
	@Autowired
	PrintingPendingRepository ppr;
	
	@RequestMapping("pending")
	public String list(Model model) {
		List<PrintingPending> p = ppr.findAll();
		 model.addAttribute("customers",p);
		return "list";
	}
	
	@RequestMapping("pendingviewadmin")
	public String listpending(Model model) {
		List<PrintingPending> p = ppr.findAll();
		 model.addAttribute("customers",p);
		return "pendingviewadmin";
	}
	
	@RequestMapping("printingdash")
	public String dash(HttpSession session, Model m) {
		Object p = session.getAttribute("username");
		if(p!=null) {
		return "printingdash";
		}
		else {
			m.addAttribute("msg","Login to access");
			return "login";
		}
	}
	
	
	@RequestMapping("searchlist")
	public String searchlist () {
		return "searchlist";
	}
	
	@RequestMapping(value="saveprint", method=RequestMethod.POST)
	public String addemp(@Valid @ModelAttribute("printingshop") Printingshop printingshop, BindingResult result,
			@RequestParam("email") String email, Model model) 
	{
		if(result.hasFieldErrors()) {
			model.addAttribute("msg", "Error in fields"+result.getErrorCount());
			return "addemp";
		}
		else {
		Printingshop ps = psr.findByEmail(email);
		if(ps!=null) {
			if(ps.getEmail().equals(email)) {
				model.addAttribute("msg","The employee already exist or the email is duplicate");
				return "editemp";
			}
		}
			else {
				BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
				String pass=bpe.encode(printingshop.getPassword());
				printingshop.setPassword(pass);
				psr.save(printingshop);
				System.out.println(email);
			}
		}
		return"redirect:/dashboardadmin";
		
	}
	
	@RequestMapping("search")
	public String search(@RequestParam("id") long id, Model model) {
		Printed p = pr.findById(id);
		PrintingPending pp = ppr.findById(id);
		if(p!=null) {
				 	
		            model.addAttribute("msg","Printed");
		            model.addAttribute("customers",p);
		            return"searchlist";
		        }
		        
		        if(pp!=null) {
		        	 model.addAttribute("msg","Pending");
			            model.addAttribute("customers",pp);
			            return"searchlist";
			        
		        }
		       model.addAttribute("msg2","No results can be found");
		        return "searchlist";
	}
	
	
	@RequestMapping("done")
	public String done(@ModelAttribute("printed")Printed printed,@RequestParam("id") long id,
			@RequestParam("name") String name,@RequestParam("area_no") long area_no,Model map) {
		
		pr.save(printed);
		ppr.deleteById(id);
		return "list";
		
	}
	
	@RequestMapping("printed")
	public String printed(Model model) {
		List<Printed> printed = pr.findAll();
		model.addAttribute("printed", printed);
		return "printed";
	}
	
	@RequestMapping("printedviewemp")
	public String printedemp(Model model) {
		List<Printed> printed = pr.findAll();
		model.addAttribute("printed", printed);
		return "printedviewemp";
	}
	
	@RequestMapping("printedviewprint")
	public String printedprint(Model model) {
		List<Printed> printed = pr.findAll();
		model.addAttribute("printed", printed);
		return "printedviewprint";
	}
	
	@RequestMapping("addprint")
	public String print() {
		return"addprint";
	}
	
	@RequestMapping(value="savepasswordprint", method=RequestMethod.POST)
	public String savepassword(@ModelAttribute("printingshop")Printingshop printingshop,Model m) {
		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
		String pass=bpe.encode(printingshop.getPassword());
		printingshop.setPassword(pass);
		psr.save(printingshop);
		m.addAttribute("msg", "Successfull");
		return "login";
	}
}
