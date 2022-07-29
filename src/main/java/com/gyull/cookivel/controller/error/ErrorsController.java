package com.gyull.cookivel.controller.error;

import java.util.Map;
import java.util.Objects;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@AllArgsConstructor
@Log4j2
public class ErrorsController implements ErrorController {
	@RequestMapping(value = "/error/error")
    public String handleNoHandlerFoundException(HttpServletResponse response, HttpServletRequest request, Model model) {
        int status = response.getStatus();
		
        System.out.println(status);  //오류 상태
        System.out.println(request.getRequestURI());  //요청 주소
    	
		String errorMsg = "";

        switch (status) {
            case 400: {
                errorMsg = "잘못된 요청입니다.";
                break;
            }
            case 401: {
                errorMsg = "인증에 실패하였습니다.";
                break;
            }
            case 403: {
                errorMsg = "접근 권한이 없습니다.";
                break;
            }
            case 404: {
                errorMsg = "요청하신 페이지를 찾을 수 없습니다.";
                break;
            }
            case 500: {
                errorMsg = "서버 오류입니다.";
                break;
            }
        }
        
        model.addAttribute("error", status);
        model.addAttribute("msg", errorMsg);
        
        return "/error/error";
    }
}

