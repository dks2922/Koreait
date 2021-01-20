package com.koreait.springMybatisSetting;

import java.io.File;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.dao.MybatisDAO;
import com.koreait.vo.ContentboardList;
import com.koreait.vo.ContentboardVO;
import com.koreait.vo.Param;

import oracle.net.aso.s;

@Controller
public class HomeController {
	@Autowired
	private SqlSession sqlSession;
	@RequestMapping("/")
	public String home(Locale locale, Model model) {
		return "redirect:main";
	}
	@RequestMapping("/main")
	public String main(HttpServletRequest request,Model model) {
		System.out.println("main()");
		return "main";
	}
	
	
	
	
	  @RequestMapping("/list") 
	  public String list(HttpServletRequest request,Model model) {
		  System.out.println("list()"); 
		  MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class); 
		  AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationCTX.xml"); 
		  ContentboardList contentboardList =  ctx.getBean("contentboardList",ContentboardList.class);
		  int pagesize=10; 
		  int currentPage=1; 
		  try { 
			  currentPage =Integer.parseInt(request.getParameter("currentPage")); 
			  }catch (Exception e){ } 
		  int totalCount=mapper.selectCount(); 
		  System.out.println(totalCount);
	  contentboardList.initContentboardList(pagesize, totalCount, currentPage);
	  HashMap<String, Integer>hmap = new HashMap<String, Integer>();
	  hmap.put("startNo",contentboardList.getStartNo());
	  hmap.put("endNo",contentboardList.getEndNo());
	  contentboardList.setList(mapper.selectList(hmap));
	  model.addAttribute("contentboardList", contentboardList); 
	  return "list"; 
	  }
	 
	@RequestMapping("/game")
	public String game(HttpServletRequest request,Model model) {
		System.out.println("game()");
		MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationCTX.xml");
			ContentboardList contentboardList =ctx.getBean("contentboardList",ContentboardList.class);
			String subject=request.getParameter("subject");
			int pagesize=10;
			int currentPage=1;
			try {
				currentPage =Integer.parseInt(request.getParameter("currentPage"));
			}catch (Exception e) {		}
			int totalCount=mapper.selectCounts(subject);
			System.out.println(totalCount);
			contentboardList.initContentboardList(pagesize, totalCount, currentPage);
			Param param = new Param();
			param.setStartNo(contentboardList.getStartNo());
			param.setEndNo(contentboardList.getEndNo());
			param.setSubject(subject);
			
			contentboardList.setList(mapper.selectLists(param));
			System.out.println(contentboardList);
			model.addAttribute("contentboardList", contentboardList);
		return "game";
	}
	@RequestMapping("/movie")
	public String movie(HttpServletRequest request,Model model) {
		System.out.println("movie()");
		MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationCTX.xml");
			ContentboardList contentboardList =ctx.getBean("contentboardList",ContentboardList.class);
			String subject=request.getParameter("subject");
			int pagesize=10;
			int currentPage=1;
			try {
				currentPage =Integer.parseInt(request.getParameter("currentPage"));
			}catch (Exception e) {		}
			int totalCount=mapper.selectCounts(subject);
			System.out.println(totalCount);
			contentboardList.initContentboardList(pagesize, totalCount, currentPage);
			Param param = new Param();
			param.setStartNo(contentboardList.getStartNo());
			param.setEndNo(contentboardList.getEndNo());
			param.setSubject(subject);
			
			contentboardList.setList(mapper.selectLists(param));
			System.out.println(contentboardList);
			model.addAttribute("contentboardList", contentboardList);
		return "movie";
	}
	@RequestMapping("/cartoon")
	public String cartoon(HttpServletRequest request,Model model) {
		System.out.println("cartoon()");
		MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationCTX.xml");
			ContentboardList contentboardList =ctx.getBean("contentboardList",ContentboardList.class);
			String subject=request.getParameter("subject");
			int pagesize=10;
			int currentPage=1;
			try {
				currentPage =Integer.parseInt(request.getParameter("currentPage"));
			}catch (Exception e) {		}
			int totalCount=mapper.selectCounts(subject);
			System.out.println(totalCount);
			contentboardList.initContentboardList(pagesize, totalCount, currentPage);
			Param param = new Param();
			param.setStartNo(contentboardList.getStartNo());
			param.setEndNo(contentboardList.getEndNo());
			param.setSubject(subject);
			
			contentboardList.setList(mapper.selectLists(param));
			System.out.println(contentboardList);
			model.addAttribute("contentboardList", contentboardList);
		return "cartoon";
	}
	@RequestMapping("/insert")
	public String insert(HttpServletRequest request,Model model) {
		System.out.println("insert()");
		return "insert";
	}
	@RequestMapping("/insertOK")
	public String insertOK(MultipartHttpServletRequest request,Model model) {
		System.out.println("insertOK()");
		MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationCTX.xml");
		ContentboardVO contentboardVO = ctx.getBean("contentboardVO",ContentboardVO.class);
		String rootUploadDir="C:"+File.separator+"Ent";
		File dir = new File(rootUploadDir+File.separator+"testfile");
		
		if(!dir.exists()) {dir.mkdirs();}
		Iterator<String> iterator=request.getFileNames();
		String uploadFileName="";
		MultipartFile multipartFile =null;
		String orgFileName="";		//원래
		ArrayList<String>list = new ArrayList<String>();
		
		while(iterator.hasNext()) {
			uploadFileName = iterator.next();
			multipartFile=request.getFile(uploadFileName);
			orgFileName =multipartFile.getOriginalFilename();
			System.out.println(orgFileName);
			
			if(orgFileName!=null&&orgFileName.length()!=0) {
				try {
					multipartFile.transferTo(new File(dir+File.separator+orgFileName));
					System.out.println(orgFileName);
					list.add(orgFileName);
				}catch (Exception e) {
						e.printStackTrace();
						list.add("에러발생");
				}
			}
		}model.addAttribute("list", list);
		
		String name= request.getParameter("name");
		String subject=request.getParameter("subject");
		String genre=request.getParameter("genre");
		String company =request.getParameter("company");
		String cls =request.getParameter("cls");
		int price = Integer.parseInt(request.getParameter("price"));
		String releaseDate = request.getParameter("releaseDate");
		String url =request.getParameter("url");
		String platform =request.getParameter("platform");
		
		contentboardVO.setPhoto(orgFileName);
		contentboardVO.setCls(cls);
		contentboardVO.setCompany(company);
		contentboardVO.setGenre(genre);
		contentboardVO.setName(name);
		contentboardVO.setPrice(price);
		contentboardVO.setReleaseDate(releaseDate);
		contentboardVO.setUrl(url);
		contentboardVO.setSubject(subject);
		contentboardVO.setPlatform(platform);
		System.out.println(contentboardVO);
		
		mapper.insertGA(contentboardVO);
		model.addAttribute("subject",subject);
		return "redirect:game";
	}
	@RequestMapping("/gameView")
	public String gameView(HttpServletRequest request,Model model) {
		System.out.println(" gameView()");
		MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationCTX.xml");
		ContentboardVO contentboardVO =ctx.getBean("contentboardVO",ContentboardVO.class);
		contentboardVO=mapper.selectByIdxGame(idx);
		System.out.println(contentboardVO);
		model.addAttribute("contentVO", contentboardVO);
		model.addAttribute("currentPage", Integer.parseInt(request.getParameter("currentPage")));
		model.addAttribute("enter", "\r\n");
		return "gameView";
	}
	@RequestMapping("/deleteCO")
	public String deleteCO(HttpServletRequest request,Model model,ContentboardVO contentboardVO) {
		System.out.println("deleteCO()");
		MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
		int idx = Integer.parseInt(request.getParameter("idx"));
		System.out.println(idx);
		mapper.deleteCO(idx);
		String subject = request.getParameter("subject");
		System.out.println(subject);
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		System.out.println(currentPage);
		String viewPage="";
		if(subject.equals("game")) {
			viewPage+= "game";
		}else if(subject.equals("movie")) {
			viewPage+= "movie";
		}else if(subject.equals("cartoon")) {
			viewPage+= "cartoon";
		}
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("subject", subject);
		return   "redirect:"+viewPage;
	}
	@RequestMapping("/updateCO")
	public String updateCO(HttpServletRequest request,Model model,ContentboardVO contentboardVO) {
		System.out.println("updateCO()");
		MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
		mapper.updateCO(contentboardVO);
		String subject = request.getParameter("subject");
		System.out.println(subject);
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		String viewPage="";
		if(subject.equals("game")) {
			viewPage+= "game";
		}else if(subject.equals("movie")) {
			viewPage+= "movie";
		}else if(subject.equals("cartoon")) {
			viewPage+= "cartoon";
		}
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("subject", subject);
		return   "redirect:"+viewPage;
	}
	
	
	
}
	

