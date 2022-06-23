package yangdo.controller;

import java.util.List;

import yangdo.bean.YangdoDTO;

public interface YangdoService {

	public int yangdoWrite(YangdoDTO dto);

	// 항목 5개씩 목록보기
	public List<YangdoDTO> yangdoList(int startNum, int endNum, String yangdo_kind);
	
	// 특정 id가 쓴 글의 데이터수 구하기
	public List<YangdoDTO> myYangdoList(int startNum, int endNum, String id);
	
	// seq, id로 게시물 확인하기
	public List<YangdoDTO> yangdoWriteView(String id, int seq);
	
	// 상세보기
	public YangdoDTO yangdoView(int seq);

	// 총 데이터수 구하기
	public int getTotalA(String yangdo_kind);

	// 특정 id가 쓴 글의 데이터수 구하기
	public int getMyTotalA(String id);
	
	// 게시글 삭제하기
	public int yangdoDelete(int seq);
	
	// 오늘날짜와 비교해서 양도 마감일 지난거 삭제하기
	public int ListRerrange();

	// 글수정
	public int yangdoModify(YangdoDTO dto);
	
	// 결제 후 양도상태 변경하기
	public int yangdoPayGive(int seq);
	
	// 결제 후 데이터 넘기기
	public int yangdoPayTake(YangdoDTO dto);

}