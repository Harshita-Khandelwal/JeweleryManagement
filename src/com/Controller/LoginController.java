package com.Controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.servlet.ModelAndView;

import com.dao.AddStockDao;
import com.dao.UserRegistrationDao;
import com.model.AddStockModel;
import com.model.AddUserModel;

@Controller
public class LoginController {

	@RequestMapping("/login")
	public ModelAndView login(@RequestParam Map<String,String> map,HttpSession session){
		ModelAndView modelAndView = null;
		String userName = map.get("userName");
		String password = map.get("password");
		if(userName.trim().equalsIgnoreCase("")){
			modelAndView = new ModelAndView("login");
			modelAndView.addObject("message", "Please Enter User Name");
		}
		else if(password.trim().equalsIgnoreCase("")){
			modelAndView = new ModelAndView("login");
			modelAndView.addObject("message", "Please Enter Password");
		}
		else
		{
			UserRegistrationDao userRegistrationDao =new UserRegistrationDao();
			List<AddUserModel> addUserModels = userRegistrationDao.verifyUser(userName, password);
			if(addUserModels!=null && addUserModels.size()>0)
			{
				modelAndView=new ModelAndView("dashboard");
				AddStockDao addStockDao=new AddStockDao();
				List<AddStockModel> addStockModels=addStockDao.showStockItems();
				modelAndView.addObject("addStockModels",addStockModels);
				session.setAttribute("userName", addUserModels.get(0).getUserName());
				session.setAttribute("emailId", addUserModels.get(0).getEmailId());
			}
			else
			{
				modelAndView=new ModelAndView("login");
				modelAndView.addObject("message","Either userName or password is Wrong,Please check");
			}
		}
		return modelAndView;
	}
	
	@RequestMapping("/userRegistration")
	public ModelAndView userRegistration()
	{
		ModelAndView modelAndView=new ModelAndView("userRegistration");
		return modelAndView;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder)
	{
		dataBinder.setDisallowedFields(new String[]{"id"});
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		dateFormat.setLenient(false);
		dataBinder.registerCustomEditor(Date.class , new CustomDateEditor(dateFormat,true));
		dataBinder.registerCustomEditor(byte[].class,new ByteArrayMultipartFileEditor());
		
	}
	
	@RequestMapping(value="/signUp",method=RequestMethod.POST)
	public ModelAndView signUp(@ModelAttribute("addUserModel") AddUserModel addUserModel,BindingResult bindingResult,@RequestParam("photo") MultipartFile file)
	{
		InputStream inputStream=null;
		byte[] bytes=null;
		try
		{
			bytes=file.getBytes();
			inputStream=new ByteArrayInputStream(bytes);
			inputStream.read();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally{
			if(inputStream!=null)try{inputStream.close();}catch(Exception e){}
		}
		ModelAndView modelAndView=new ModelAndView("login");
		UserRegistrationDao userRegistrationDao =new UserRegistrationDao();
		userRegistrationDao.save(addUserModel,inputStream,file);
		modelAndView.addObject("registrationSuccess","Your Registration Successfully Done!!");
		return modelAndView;
	}

	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session)
	{
		session.removeAttribute("userName");
		session.removeAttribute("emailId");
		ModelAndView modelAndView=new ModelAndView("login");
		return modelAndView;
	}
}
