package com.Controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dao.AddItemDao;
import com.model.AddItemModel;

@Controller
public class AddItemController {

	@RequestMapping(value="saveAddNewItem",method=RequestMethod.POST)
	public ModelAndView saveAddNewItem(@ModelAttribute("addItemModel") AddItemModel addItemModel)
	{

		ModelAndView modelAndView =new ModelAndView("addNewItemCategory");
		modelAndView.addObject("addItemModel",addItemModel);
		
		AddItemDao addItemdao=new AddItemDao();
		String result=addItemdao.save(addItemModel);
		
		if(result.equalsIgnoreCase("error"))
			modelAndView.addObject("result","Error in saving");
		else if(result.equalsIgnoreCase("success"))
			modelAndView.addObject("result","Saved Successfully");
		
		return modelAndView;
	}
	
	@RequestMapping(value="showItems")
	public ModelAndView showItems()
	{
		ModelAndView modelAndView=new ModelAndView("showItemCategory");
		AddItemDao addItemDao=new AddItemDao();
		List<AddItemModel> addItemModels=addItemDao.showItems();
		modelAndView.addObject("addItemModels",addItemModels);
		return modelAndView;
		
	}
	
	@RequestMapping(value="deleteItems/{id}")
	public ModelAndView deleteItems(@PathVariable("id") Integer id)
	{
		ModelAndView modelAndView=new ModelAndView("showItemCategory");
		AddItemDao addItemDao=new AddItemDao();
		String returnValue= addItemDao.deleteItems(id);
		if(returnValue.equalsIgnoreCase("success"))
				modelAndView.addObject("deleteMessage","Entry Successfully Deleted");
		else
			modelAndView.addObject("deleteMessage","Entry Not Successfully Deleted");
		
		List<AddItemModel> addItemModels =addItemDao.showItems();
		modelAndView.addObject("addItemModels",addItemModels);
		return modelAndView;
		
	}
	
	@RequestMapping("getItem/{id}")
	public ModelAndView getItem(@PathVariable("id") Integer id)
	{
		ModelAndView modelAndView=new ModelAndView("editItemCategory");
		AddItemDao addItemDao=new AddItemDao();
		AddItemModel addItemModel=addItemDao.getItem(id);
		modelAndView.addObject("addItemModel",addItemModel);
		return modelAndView;
	}
	
	@RequestMapping("updateItems/{id}")
	public ModelAndView updateItems(@PathVariable("id") Integer id,
									@ModelAttribute("addItemModel") AddItemModel addItemModel)
	{
		ModelAndView modelAndView=new ModelAndView("showItemCategory");
		addItemModel.setId(id);
		AddItemDao addItemDao=new AddItemDao();
		String returnValue=addItemDao.updateItems(addItemModel);
		modelAndView.addObject("addItemModel",addItemModel);
		
		List<AddItemModel> addItemModels =addItemDao.showItems();
		modelAndView.addObject("addItemModels",addItemModels);
		if(returnValue.equalsIgnoreCase("success"))
			modelAndView.addObject("updateMessage","Entry Successfully Updated");
		else
		modelAndView.addObject("updateMessage","Entry Not Successfully Updated");
		return modelAndView;
	}
}
