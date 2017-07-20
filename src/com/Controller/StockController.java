package com.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.servlet.ModelAndView;

import com.dao.AddItemDao;
import com.dao.AddStockDao;
import com.model.AddItemModel;
import com.model.AddStockModel;

@Controller
public class StockController {

	@RequestMapping(value="loadStockPage",method=RequestMethod.GET)
	public ModelAndView loadStockPage(){
	
		ModelAndView modelAndView=new ModelAndView("addItemInStock");
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
	
	@RequestMapping(value="saveAddNewStock",method=RequestMethod.POST)
	public ModelAndView saveAddNewStock(@ModelAttribute("addStockModel") AddStockModel addStockModel)
	{

		ModelAndView modelAndView =new ModelAndView("addItemInStock");
		
		AddItemModel addItemModel=new AddItemModel();
		addStockModel.setAddItemModel(addItemModel);
		addStockModel.getAddItemModel().setId(addStockModel.getItemId());
		
		AddStockDao addStockDao=new AddStockDao();
		String returnValue=addStockDao.save(addStockModel);
		
		if(returnValue.equalsIgnoreCase("success"))
			modelAndView.addObject("message","Entry Successfully Saved");
		else 
			modelAndView.addObject("message","Entry Not Successfully Saved");
		
		return modelAndView;
	}
	
	@RequestMapping("/getItemListOnTheBasisOfItemType/{itemType}")
	public ModelAndView getItemListOnTheBasisOfItemType(@PathVariable("itemType")String itemType){

		ModelAndView modelAndView =new ModelAndView("itemNameListBox");
		AddStockDao addStockDao=new AddStockDao();
		List<AddItemModel> addItemModels = addStockDao.getItemListOnTheBasisOfItemType(itemType);
		modelAndView.addObject("addItemModels",addItemModels);
		return modelAndView;
	}
	
	
	
	@RequestMapping(value="showStockItems")
	public ModelAndView showStockItems()
	{
		ModelAndView modelAndView=new ModelAndView("showStockCategory");
		AddStockDao addStockDao=new AddStockDao();
		List<AddStockModel> addStockModels=addStockDao.showStockItems();
		modelAndView.addObject("addStockModels",addStockModels);
		return modelAndView;
		
	}
	
	@RequestMapping(value="deleteStocks/{id}")
	public ModelAndView deleteStocks(@PathVariable("id") Integer id)
	{
		ModelAndView modelAndView=new ModelAndView("showStockCategory");
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
	
	@RequestMapping("getStock/{id}")
	public ModelAndView getStock(@PathVariable("id") Integer id)
	{
		ModelAndView modelAndView=new ModelAndView("editItemInStock");
		AddStockDao addStockDao=new AddStockDao();
		AddStockModel addStockModel=addStockDao.getStock(id);
		modelAndView.addObject("addStockModel",addStockModel);
		return modelAndView;
	}
	
	@RequestMapping("updateStocks/{id}")
	public ModelAndView updateStocks(@PathVariable("id") Integer id,
									@ModelAttribute("addStockModel") AddStockModel addStockModel)
	{
		ModelAndView modelAndView=new ModelAndView("addItemInStock");
		addStockModel.setId(id);
		AddStockDao addStockDao=new AddStockDao();
		String returnValue=addStockDao.updateStocks(addStockModel);
		modelAndView.addObject("addStockModel",addStockModel);
		
		List<AddStockModel> addStockModels =addStockDao.showStockItems();
		modelAndView.addObject("addStockModels",addStockModels);
		if(returnValue.equalsIgnoreCase("success"))
			modelAndView.addObject("updateMessage","Entry Successfully Updated");
		else
		modelAndView.addObject("updateMessage","Entry Not Successfully Updated");
		return modelAndView;
	}
}
