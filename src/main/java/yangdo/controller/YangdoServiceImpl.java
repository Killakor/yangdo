package yangdo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yangdo.bean.YangdoDTO;
import yangdo.dao.YangdoDAO;

@Service
public class YangdoServiceImpl implements YangdoService{
	
	@Autowired
	private YangdoDAO yangdoDAO;

	@Override
	public int yangdoWrite(YangdoDTO dto) {
		return yangdoDAO.yangdoWrite(dto);
	}

	@Override
	public List<YangdoDTO> yangdoList(int startNum, int endNum, String yangdo_kind) {
		return yangdoDAO.yangdoList(startNum, endNum, yangdo_kind);
	}
	
	@Override
	public YangdoDTO yangdoView(int seq) {
		return yangdoDAO.yangdoView(seq);
	}

	@Override
	public int getTotalA(String yangdo_kind) {
		return yangdoDAO.getTotalA(yangdo_kind); 
	}

	@Override
	public int yangdoDelete(int seq) {
		return yangdoDAO.yangdoDelete(seq);
	}

	@Override
	public int yangdoModify(YangdoDTO dto) {
		return yangdoDAO.yangdoModify(dto);
	}

	@Override
	public List<YangdoDTO> yangdoWriteView(String id, int seq) {
		return yangdoDAO.yangdoWriteView(id, seq);
	}

	@Override
	public int getMyTotalA(String id) {
		return yangdoDAO.getMyTotalA(id);
	}
	
	@Override
	public List<YangdoDTO> myYangdoList(int startNum, int endNum, String id) {
		return yangdoDAO.myYangdoList(startNum, endNum, id);
	}
	
	@Override
	public int yangdoPayGive(int seq) {
		return yangdoDAO.yangdoPayGive(seq);
	}

	@Override
	public int yangdoPayTake(YangdoDTO dto) {
		return yangdoDAO.yangdoPayTake(dto);
	}

	@Override
	public int ListRerrange() {
		return yangdoDAO.ListRearrange();
	}

}