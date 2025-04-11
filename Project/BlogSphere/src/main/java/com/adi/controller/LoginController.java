package com.adi.controller;

import java.io.File;
import java.time.LocalDateTime;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.adi.dao.PostDao;
import com.adi.dao.UserInfoDao;
import com.adi.pojo.Category;
import com.adi.pojo.Message;
import com.adi.pojo.UserInfo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	
	@Autowired
	private UserInfoDao daoimpl;
	
	@Autowired 
	private PostDao daoimpl2;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@GetMapping("/")
	public String indexPage(Model m)
	{
		UserInfo user = new UserInfo();
		m.addAttribute("modelObj",user);
		return "index";
	}
	@GetMapping("/index")
	public String homePage(Model m)
	{
		UserInfo user = new UserInfo();
		m.addAttribute("modelObj",user);
		return "index";
	}
	
	@GetMapping("/login")
	public String loginPage() {
		
		return "login_page";
	}
	
	@GetMapping("/register")
	public String regPage(Model m)
	{
		UserInfo user = new UserInfo();
		m.addAttribute("modelObj",user);
		return "register_page";
	}
	
	
	
	@PostMapping("/register")
	@ResponseBody
	public String registerUser(@RequestBody UserInfo userInfo, HttpServletRequest request) {
		
		if(!userInfo.isAgreedTerms()) {
			return "Please agree to the terms and conditions.";
		}
		
		System.out.println(userInfo);
		userInfo.setDateTime(LocalDateTime.now());
		userInfo.setProfile("default_pic.jpeg");
		userInfo.setRole("user");
		userInfo.setBlocked(false);
		userInfo.setPassword(passwordEncoder.encode(userInfo.getPassword()));
		if(userInfo.getAbout() == "") {
			userInfo.setAbout("Hey! I am a user.");
		}
		System.out.println(userInfo);
		if(daoimpl.doesUserAlreadyExist(userInfo.getEmail())) {
			return "exists";
		}
		else if(daoimpl.addNewUser(userInfo)) {
			HttpSession session = request.getSession();
			Message msg = new Message("User Registered", "success", "alert-success");
			session.setAttribute("msg", msg);
			return "done";
		}else {
			return "error";
		}
		
	}
	
	@PostMapping("/login")
	public String loginUser(@RequestParam("email")String email, @RequestParam("password")String password, HttpServletRequest request) {
		
		UserInfo u = daoimpl.getUserByEmail(email);
		if(u == null || !passwordEncoder.matches(password, u.getPassword())) {
			Message msg = new Message("Invalid Details! try with another", "error", "alert-danger");
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
			return "login_page";
		} else if(u.isBlocked()) {
			Message msg = new Message("Sorry, you're not allowed to enter.", "error", "alert-danger");
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
			return "login_page";
		}
		else {
			// login success
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", u);
			List<Category> lst = daoimpl2.getAllCategories();
			session.setAttribute("categoryList", lst);
			Message msg = new Message("Welcome to BlogSphere!", "success", "alert-success");
			session.setAttribute("msg", msg);
			if(u.getRole().equals("admin"))
				return "redirect:/openprofile";
			else
				return "redirect:/profile";
		}
		
	}
	
	@GetMapping("/profile")
	public String profilePage(Model m) {
	    
	    return "profile";
	}
	
	@PostMapping("/updateuser")
	public String updateUser( @RequestParam("user_name")String userName,  @RequestParam("user_about")String userAbout, @RequestParam("image")MultipartFile file, HttpServletRequest request) {
		
		HttpSession s = request.getSession();
		
		UserInfo user = (UserInfo) s.getAttribute("currentUser");
		if (user == null) {
	        return "redirect:/errorpage"; // Redirect instead of throwing an error
	    }
		user.setName(userName);
		user.setAbout(userAbout);
		String imageName = file.getOriginalFilename();
		
			System.out.println("File empty or not......................");
			
			System.out.println("Image name = " + imageName);
			if(imageName != "") {
				user.setProfile(imageName);
			}
		
		
		
			
			try {
				
				
				// Update user
				if(daoimpl.updateUser(user)) {
					if(imageName != "") {
						// Save profile image
						String destPath = "D:/Hibernate/YoutubeLayerProject/src/main/resources/static/images/pics/";
						File serverFile = new File(destPath, imageName);
						file.transferTo(serverFile);
					}
					Message msg = new Message("Profile details updated...", "success", "alert-success");
					s.setAttribute("msg", msg);
				}else {
					Message msg = new Message("Something went wrong...", "error", "alert-danger");
					
					s.setAttribute("msg", msg);
					
				}
			} catch (Exception e) {
				e.printStackTrace();
				Message msg = new Message("Something went wrong...", "error", "alert-danger");
				s.setAttribute("msg", msg);
			}
			
			return "profile";
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		
		HttpSession s = request.getSession();
		s.removeAttribute("currentUser");
		Message msg = new Message("Logout Successfully", "success", "alert-success");
		s.setAttribute("msg", msg);
		
		return "redirect:/login";
	}
	
	@GetMapping("/deleteuser")
	public String deleteUser(@RequestParam("uid")String uid, HttpServletRequest request) {
		
		int id = Integer.parseInt(uid);
		HttpSession s = request.getSession();
		UserInfo user = (UserInfo) s.getAttribute("currentUser");
		if (user == null) {
	        return "redirect:/errorpage"; // Redirect instead of throwing an error
	    }
		s.removeAttribute("currentUser");
		Message m = null;
		if(daoimpl.deleteUserById(id)) {
			m = new Message("Account deleted", "success", "alert-success");
		} else {
			m = new Message("Something went wrong...", "error", "alert-danger");
		}
		s.setAttribute("msg", m);
		
		return "redirect:/login";
	}
	
	@GetMapping("/errorpage")
	public String error() {
		return "error_page";
	}
	
	
	@GetMapping("/openprofile")
	public String openProfile() {
		
		return "admin_dashboard";
	}
	
}
