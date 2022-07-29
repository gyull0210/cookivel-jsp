package com.gyull.cookivel.controller.storyroom;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gyull.cookivel.security.domain.CustomUser;
import com.gyull.cookivel.service.storyroom.StoryRoomService;
import com.gyull.cookivel.domain.book.BookVO;
import com.gyull.cookivel.domain.pagination.StoryCriteria;
import com.gyull.cookivel.domain.pagination.StoryPagingDTO;
import com.gyull.cookivel.domain.member.MemberVO;
import com.gyull.cookivel.service.member.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@AllArgsConstructor
public class StoryRoomController {
	
	private StoryRoomService service;

	@RequestMapping(value = "/storyRoom/storyList", method = RequestMethod.GET)
	public String storyList(Model model, StoryCriteria scri, Authentication authentication, ServletResponse response) {

		CustomUser user = (CustomUser)authentication.getPrincipal();

		Integer member_idx = user.getMember().getMember_idx();
		   
		scri.setMember_idx(member_idx);

		model.addAttribute("list", service.pagination(scri));
		Integer total = service.totalCount(member_idx);
		model.addAttribute("pageMaker", new StoryPagingDTO(scri, total));		
		
		return "/storyRoom/storyList";
	}
	
	@RequestMapping(value="/storyRoom/storyCreate", method = RequestMethod.GET)
	public String storyCreate(Model model, HttpSession session, ServletResponse response) {
		
		return "/storyRoom/storyCreate";
	}
	
	//폴더
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	@RequestMapping(value="/storyRoom/storyCreate", method = RequestMethod.POST)
	public String storyCreate(Model model, HttpSession session, Authentication authentication, ServletResponse response, BookVO book, MultipartFile file) {		


		if(file != null) {
		  //폴더경로 
		  
		  String uploadFolder = "C:\\upload"; 
		  String uploadFolderPath = getFolder(); 
		  File uploadPath = new File(uploadFolder, uploadFolderPath);
		  log.info("uploadPath:"+uploadPath);
		  
		  if(uploadPath.exists() == false) { uploadPath.mkdirs(); }
		  
		  //날짜 폴더 생성		 
		  
		  String uploadFileName = file.getOriginalFilename();
		  
		  //ie
		  uploadFileName =
		  uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
		  log.info("only file Name:"+uploadFileName);
		  
		  UUID uuid = UUID.randomUUID();
		  
		  uploadFileName = uuid.toString()+"_"+uploadFileName;
		  
		  try {
  		  CustomUser user = (CustomUser)authentication.getPrincipal();
		  Integer member_idx = user.getMember().getMember_idx();
		  String mem_nickName = user.getMember().getMem_nickName();
		  //String mem_nickName = "admin";
		  File saveFile = new File(uploadPath, uploadFileName);
		  file.transferTo(saveFile);
		  
		  book.setMember_idx(member_idx);
		  book.setBook_writer(mem_nickName);
		  book.setBook_imgName(uploadFileName);
		  book.setBook_imgUrl(uploadFolderPath); 
		  book.setBook_imgUuid(uuid.toString());
		  
		  service.create(book);
		  System.out.println(book);
		  
		  } catch (Exception e) { log.error(e.getMessage()); }
		} else if(file == null) {
			CustomUser user = (CustomUser)authentication.getPrincipal();
			Integer member_idx = user.getMember().getMember_idx();
			String mem_nickName = user.getMember().getMem_nickName();
			
			log.info(book);
			book.setMember_idx(member_idx);
			book.setBook_writer(mem_nickName);
			service.create(book);
		}
		return "/storyRoom/storyList";
	}
	
	@RequestMapping(value="/storyRoom/storyModify", method = RequestMethod.GET)
	public String storyModify(Model model, HttpSession session, Authentication authentication, ServletResponse response, Integer book_idx) {
		CustomUser user = (CustomUser)authentication.getPrincipal();
		Integer member_idx = user.getMember().getMember_idx();

		BookVO book = new BookVO();
		book.setMember_idx(member_idx);
		book.setBook_idx(book_idx);
		model.addAttribute("book", service.read(book));
		return "/storyRoom/storyModify";
	}
	
	@RequestMapping(value="/storyRoom/storyModify", method = RequestMethod.POST)
	public String storyModify(Model model, HttpSession session, ServletResponse response, Authentication authentication, MultipartFile file, BookVO book, Integer book_idx) {
	System.out.println("[book_idx:"+book_idx);
	if(file != null) {	

		  //폴더경로 
		  
		  String uploadFolder = "C:\\upload"; 
		  String uploadFolderPath = getFolder(); 
		  File uploadPath = new File(uploadFolder, uploadFolderPath);
		  log.info("uploadPath:"+uploadPath);
		  
		  if(uploadPath.exists() == false) { uploadPath.mkdirs(); }
		  
		  //날짜 폴더 생성		 
		  
		  String uploadFileName = file.getOriginalFilename();
		  
		  //ie
		  uploadFileName =
		  uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
		  log.info("only file Name:"+uploadFileName);
		  
		  UUID uuid = UUID.randomUUID();
		  
		  uploadFileName = uuid.toString()+"_"+uploadFileName;
		  
		  try {
		  
		  CustomUser user = (CustomUser)authentication.getPrincipal();
		  Integer member_idx = user.getMember().getMember_idx();
		  String mem_nickName = user.getMember().getMem_nickName();
		  
		  File saveFile = new File(uploadPath, uploadFileName);
		  file.transferTo(saveFile);
		  book.setBook_idx(book_idx);
		  book.setMember_idx(member_idx);
          book.setBook_writer(mem_nickName);
		  book.setBook_imgName(uploadFileName);
		  book.setBook_imgUrl(uploadFolderPath); 
		  book.setBook_imgUuid(uuid.toString());
		  
		  service.modifyCover(book);
		  service.modify(book);
		  System.out.println(book);
		  
		  } catch (Exception e) { log.error(e.getMessage()); }
	} else if(file == null) {
		  
		  try {
		  
		  CustomUser user = (CustomUser)authentication.getPrincipal();
		  Integer member_idx = user.getMember().getMember_idx();
		  String mem_nickName = user.getMember().getMem_nickName();
		  book.setMember_idx(member_idx);
          book.setBook_writer(mem_nickName);
		  service.modify(book);
		  System.out.println(book);
		  
		  } catch (Exception e) { log.error(e.getMessage()); }
	}
		return "/storyRoom/storyModify";
	}
	
	@RequestMapping(value="/storyRoom/storyRemove", method = RequestMethod.POST)
	public String storyRemove(Model model, HttpSession session, ServletResponse response, Integer book_idx) {
		service.delete(book_idx);
		return "redirect:/storyRoom/storyList";
	}
}
