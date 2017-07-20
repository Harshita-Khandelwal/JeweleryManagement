package com.Controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dao.AddStockDao;
import com.model.AddStockModel;

@Controller
public class DashboardController {

	@RequestMapping("loadDashboard")
	public ModelAndView loadDashboard()
	{
		ModelAndView modelAndView=new ModelAndView("dashboard");
		AddStockDao addStockDao=new AddStockDao();
		List<AddStockModel> addStockModels=addStockDao.showStockItems();
		modelAndView.addObject("addStockModels",addStockModels);
		return modelAndView;
	}
	
	@RequestMapping("viewGoldStock")
	public ModelAndView viewGoldStock()
	{
		ModelAndView modelAndView=new ModelAndView("viewGoldStock");
		AddStockDao addStockDao=new AddStockDao();
		List<AddStockModel> addStockModels=addStockDao.showStockItems();
		modelAndView.addObject("addStockModels",addStockModels);
		return modelAndView;
	}
	@RequestMapping("viewSilverStock")
	public ModelAndView viewSilverStock()
	{
		ModelAndView modelAndView=new ModelAndView("viewSilverStock");
		AddStockDao addStockDao=new AddStockDao();
		List<AddStockModel> addStockModels=addStockDao.showStockItems();
		modelAndView.addObject("addStockModels",addStockModels);
		return modelAndView;
	}
	@RequestMapping("viewArtificialStock")
	public ModelAndView viewArtificialStock()
	{
		ModelAndView modelAndView=new ModelAndView("viewArtificialStock");
		AddStockDao addStockDao=new AddStockDao();
		List<AddStockModel> addStockModels=addStockDao.showStockItems();
		modelAndView.addObject("addStockModels",addStockModels);
		return modelAndView;
	}
	@RequestMapping(value="deleteGoldStocks/{id}")
	public ModelAndView deleteGoldStocks(@PathVariable("id") Integer id)
	{
		ModelAndView modelAndView=new ModelAndView("viewGoldStock");
		AddStockDao addStockDao=new AddStockDao();
		String returnValue= addStockDao.deleteStocks(id);
		if(returnValue.equalsIgnoreCase("success"))
				modelAndView.addObject("deleteMessage","Entry Successfully Deleted");
		else
			modelAndView.addObject("deleteMessage","Entry Not Successfully Deleted");
		
		List<AddStockModel> addStockModels =addStockDao.showStockItems();
		modelAndView.addObject("addStockModels",addStockModels);
		return modelAndView;
	}
	@RequestMapping(value="deleteSilverStocks/{id}")
	public ModelAndView deleteSilverStocks(@PathVariable("id") Integer id)
	{
		ModelAndView modelAndView=new ModelAndView("viewSilverStock");
		AddStockDao addStockDao=new AddStockDao();
		String returnValue= addStockDao.deleteStocks(id);
		if(returnValue.equalsIgnoreCase("success"))
				modelAndView.addObject("deleteMessage","Entry Successfully Deleted");
		else
			modelAndView.addObject("deleteMessage","Entry Not Successfully Deleted");
		
		List<AddStockModel> addStockModels =addStockDao.showStockItems();
		modelAndView.addObject("addStockModels",addStockModels);
		return modelAndView;
	}
	@RequestMapping(value="deleteArtificialStocks/{id}")
	public ModelAndView deleteArtificialStocks(@PathVariable("id") Integer id)
	{
		ModelAndView modelAndView=new ModelAndView("viewArtificialStock");
		AddStockDao addStockDao=new AddStockDao();
		String returnValue= addStockDao.deleteStocks(id);
		if(returnValue.equalsIgnoreCase("success"))
				modelAndView.addObject("deleteMessage","Entry Successfully Deleted");
		else
			modelAndView.addObject("deleteMessage","Entry Not Successfully Deleted");
		
		List<AddStockModel> addStockModels =addStockDao.showStockItems();
		modelAndView.addObject("addStockModels",addStockModels);
		return modelAndView;
	}
}
