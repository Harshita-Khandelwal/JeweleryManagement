package com.Controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;

import com.dao.UserRegistrationDao;
import com.model.AddItemModel;
import com.model.AddUserModel;


@Controller
public class ChangePasswordController {

	@RequestMapping(value="loadPage",method=RequestMethod.GET)
	public ModelAndView loadPage(){
	
		ModelAndView modelAndView=new ModelAndView("changePassword");
		return modelAndView;
		
	}
	@RequestMapping("/change/{userName}/{oldPassword}/{newPassword}")
	public ModelAndView change(@PathVariable("userName") String userName,
									@PathVariable("oldPassword") String oldPassword,
									@PathVariable("newPassword") String newPassword,HttpSession session){
		ModelAndView modelAndView = null;
			UserRegistrationDao userRegistrationDao =new UserRegistrationDao();
			List<AddUserModel> addUserModels = userRegistrationDao.verifyUser(userName, oldPassword);
			if(addUserModels!=null && addUserModels.size()>0)
			{
				modelAndView=new ModelAndView("changePassword");
				String emailId=(String)session.getAttribute("emailId");
				String message=userRegistrationDao.changePassword(oldPassword,newPassword,emailId);
				modelAndView.addObject("message",message);
			}
			else
			{
				modelAndView=new ModelAndView("changePassword");
				modelAndView.addObject("message","Either userName or password is Wrong,Please check");
			}
		return modelAndView;
	}
	
}
