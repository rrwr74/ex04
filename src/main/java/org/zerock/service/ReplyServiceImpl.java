package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

/*@Log4j*/
@Slf4j
@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_= {@Autowired})
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO reply) {
		// TODO Auto-generated method stub
		log.info("register....." + reply);
		return mapper.insert(reply);
	}

	@Override
	public ReplyVO get(int rno) {
		// TODO Auto-generated method stub
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO reply) {
		// TODO Auto-generated method stub
		return mapper.update(reply);
	}

	@Override
	public int remove(int rno) {
		// TODO Auto-generated method stub
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, int rno) {
		// TODO Auto-generated method stub
		log.info("get list with criteria : " + cri);
		log.info("get list with rno : " + rno);
		
		return mapper.getListWithPaging(cri, rno);
	}
	
}
