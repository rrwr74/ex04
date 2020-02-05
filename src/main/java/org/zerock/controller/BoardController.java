package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board/*")
@Slf4j
public class BoardController {

	@Autowired
	private BoardService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list model: " + model );
		
		model.addAttribute("list", service.getList());
	}
	
	@GetMapping("/list2")
	public void listWithPage(Criteria cri, Model model) {
		log.info("list Criteria1: " + cri );
		String keyword = cri.getKeyword();
		String type = cri.getType();
		
		cri = new Criteria(cri.getPageNum(), cri.getAmount());
		cri.setKeyword(keyword);
		cri.setType(type);
		
		log.info("list Criteria2: " + cri );
		
		PageDTO pagedto = new PageDTO(cri, 123);
		log.info("list PageDTO: " + pagedto );
		
		
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total = service.getTotalCount(cri);
		
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register : " + board);
		
		service.register(board);
		
		log.info("register finish : " + board.getBno());
		rttr.addFlashAttribute("result", board.getBno());
		
		
		return "redirect:/board/list";
	}

	@GetMapping("/register")
	public void register() {
		log.info("get register : " );
	}

	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") int bno, Model model) {
		log.info("get or modify : " + bno);
		
		model.addAttribute("board", service.get(bno));
	}

	@PostMapping("/modify")
	public String modify(BoardVO board, Criteria cri, RedirectAttributes rttr) {
		log.info("modify board : " + board);
		log.info("modify cri : " + cri);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list" + cri.getListLink();
	}
	 
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") int bno, Criteria cri, RedirectAttributes rttr) {
		log.info("remove bno : " + bno);
		log.info("remove cri : " + cri);
		
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list" + cri.getListLink();
	}

}
