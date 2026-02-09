	package com.cdgn.controller;
	
	
	
	import java.lang.annotation.Retention;
import java.util.List;
	
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Controller;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.servlet.ModelAndView;
	import com.cdgn.EmployeManagementSystemApplication;
	import com.cdgn.model.Employee;
	import com.cdgn.service.EmployeeService;
	
	import jakarta.servlet.http.HttpServletRequest;
	import jakarta.servlet.http.HttpSession;
	
	@Controller
	public class EmployeeController {
	
	    private final EmployeManagementSystemApplication employeManagementSystemApplication;
			@Autowired
			private EmployeeService service;
	
	    EmployeeController(EmployeManagementSystemApplication employeManagementSystemApplication) {
	        this.employeManagementSystemApplication = employeManagementSystemApplication;
	    }
			
			@RequestMapping("/")
			public String mainPage() {
				return "index";
			}
			
			@RequestMapping("/register")
			public String registerPage() {
				return "register";
			}
			
			@RequestMapping("/loginreq")
			public String loginPage() {
				return "login";
			}
			
			@RequestMapping("/aboutus")
			public String aboutUsPage() {
				return "aboutus";
			}
			
			@RequestMapping("/contactus")
			public String contactUsPage() {
				return "contactus";
			}
			
			@RequestMapping("/edit")
			public String editRequest() {
				return "editemp";
			}
			
			@RequestMapping("/saveuser")
			public ModelAndView SaveEmployee(Employee employee) {
				Employee emp = service.SaveEmployee(employee);
				if(emp != null) {
					ModelAndView mav = new ModelAndView("register");
					mav.addObject("status", "Registration Succesfull...");
					return mav;
				}
				else {
					ModelAndView mav = new ModelAndView("register");
					mav.addObject("status", "Registration Faild...");
					return mav;
				}
			}
			
			
			@RequestMapping("/validatelogin")
			public ModelAndView login(String email, String password,HttpServletRequest request) {
				HttpSession session = request.getSession();
				if(email.equals("admin@cdgn.com")&&password.equals("admin")) {
					session.setAttribute("email", email);
					ModelAndView mav = new ModelAndView("admin");
					mav.addObject("status","Welcome to AdminPage");
					return mav;
				}
				else {
					Employee employee = service.findByEmailAndPassword( email, password);
					if(employee != null) {
						session.setAttribute("email", email);
						
						ModelAndView mav = new ModelAndView("userprofile");
						mav.addObject("employee",employee);
						return mav;
					}
					else {
						ModelAndView mav = new ModelAndView("login");
						mav.addObject("status","Invalid Credentials.... Try Again");
						return mav;
					}	
				}
			}
			
			@RequestMapping("/findAll")
			public ModelAndView viewAllEmployees() {
				List<Employee> employees = service.findAll();
				ModelAndView mav = new ModelAndView("viewemps");
				mav.addObject("emplist",employees);
				return mav;
			}
			
			@RequestMapping("/delete")
			public ModelAndView deleteById(int id) {
				service.deleteById(id);
				ModelAndView mav = new ModelAndView("redirect:/findAll");
				return mav;
			}
			
			@RequestMapping("/edituser")
			public ModelAndView editUser(Employee employee) {
				Employee emp = service.SaveEmployee(employee);
				ModelAndView mav = new ModelAndView("redirect:/findAll");
				mav.addObject("emp",emp);
				return mav;
			}
			
			@RequestMapping("/logoutreq")
			public ModelAndView logout(HttpSession session) {
				session.invalidate();
				ModelAndView mav = new ModelAndView("redirect:/loginreq");
				return mav;
			}
			
			@RequestMapping("search")
			public String searchPage() {
				return "search";
			}
			
			@RequestMapping("/searchbyid")
			public ModelAndView searchById(int id) {
				Employee employee = service.findById(id);
				if(employee != null) {
					ModelAndView mav = new ModelAndView("viewemp");
					mav.addObject("employee", employee);
					return mav;
				}
				else {
					ModelAndView mav = new ModelAndView("search");
					mav.addObject("status", "Invalid ID...");
					return mav;
				}
			}
			
	}
