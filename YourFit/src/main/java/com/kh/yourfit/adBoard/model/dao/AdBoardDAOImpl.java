package com.kh.yourfit.adBoard.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.yourfit.adBoard.model.vo.AdBoard;
import com.kh.yourfit.board_comment.model.vo.board_comment;
import com.kh.yourfit.board_file.model.vo.board_file;

import com.kh.yourfit.dtboard.model.vo.DtBoard;

@Repository
public class AdBoardDAOImpl implements AdBoardDAO{

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertBoard(AdBoard adboard) {
		System.out.println(adboard);
		return sqlSession.insert("adBoardMapper.insertBoard", adboard);
	}

	@Override
	public int insertBoardFile(board_file bf) {
		return sqlSession.insert("adBoardMapper.insertBoardFile", bf);
	}

	@Override
	public AdBoard selectOneBoard(String ad_No) {
		return sqlSession.selectOne("adBoardMapper.selectOneBoard", ad_No);
	}

	@Override
	public int updateReadCount(String ad_No) {
		return sqlSession.update("adBoardMapper.updateReadCount", ad_No);
	}

	@Override
	public List<board_file> selectBoardFileList(String ad_No) {
		return sqlSession.selectList("adBoardMapper.selectBoardFileList", ad_No);
	}

	@Override
	public int deleteBoardFile(String ad_No) {
		return sqlSession.delete("adBoardMapper.deleteBoardFile", ad_No);
	}

	@Override
	public int updateBoardFile(board_file bf) {
		return sqlSession.insert("adBoardMapper.updateBoardFile", bf);
	}

	@Override
	public int updateBoard(AdBoard adboard) {
		return sqlSession.update("adBoardMapper.updateBoard", adboard);
	}

	@Override
	public int deleteBoard(String ad_No) {
		return sqlSession.delete("adBoardMapper.deleteBoard", ad_No);
	}

}
