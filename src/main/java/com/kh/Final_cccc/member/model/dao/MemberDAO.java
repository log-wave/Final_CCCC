package com.kh.Final_cccc.member.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.Final_cccc.Files.vo.Files;
import com.kh.Final_cccc.member.model.vo.MemberVO;
import com.kh.Final_cccc.member.model.vo.PageInfo;
import com.kh.Final_cccc.member.service.MemberServiceImpl;
import com.kh.Final_cccc.recipe.model.vo.Recipe;

@Repository("mDAO")
public class MemberDAO {

	
	private static Logger loggger = LoggerFactory.getLogger(MemberDAO.class);
	
	public MemberVO memberLogin(SqlSessionTemplate sqlSession, MemberVO m) {
		
		return sqlSession.selectOne("memberMapper.login", m);
	}

	public int idCheck(SqlSessionTemplate sqlSession,String user_id) {
		
		return sqlSession.selectOne("memberMapper.idCheck", user_id);
	}

	public int nickNameCheck(SqlSessionTemplate sqlSession, String nickName) {
		
		return sqlSession.selectOne("memberMapper.nickNameCheck",nickName);
	}

	public int insertMember(SqlSessionTemplate sqlSession, MemberVO m) {
		loggger.info("insertMember DAO 진입성공");
		
		return sqlSession.insert("memberMapper.insertMember", m);
	
	}

	public int emailCheck(SqlSessionTemplate sqlSession, String email) {
	
		loggger.info("이메일 중복검사 dao 진입 성공");
		System.out.println("이메일 종북체크" + email);
		
		return sqlSession.selectOne("memberMapper.emailCheck", email);
	}
	
	//파라미터가 여러 개 있으므로 map 형식으로 리턴 



	public int deleteMemberCheck(SqlSessionTemplate sqlSession, MemberVO m) {
		loggger.info("회원탈퇴체크 DAO 진입성공");
		
		return sqlSession.update("memberMapper.deleteMemberCheck", m);
	
	}

	public int count_pass_cnt(SqlSessionTemplate sqlSession, MemberVO m) {
		
		loggger.info("회원탈퇴체크 DAO 진입성공");
		
		return sqlSession.update("memberMapper.count_pass_cnt", m);
	}

	public int count_DeleteMemberCheck_Num(SqlSessionTemplate sqlSession, MemberVO m) {
		
		loggger.info("회원탈퇴 카운트 검사 dao 진입");
		
		return sqlSession.selectOne("memberMapper.count_DeleteMemberCheck_Num", m);
		
	
	}

	public MemberVO loginCheck(SqlSessionTemplate sqlSession, MemberVO m) {
		loggger.info("loginCheck dao 진입 성공");
		
		return sqlSession.selectOne("memberMapper.loginCheck", m);
		
	}

	public int reset_pass_cnt(SqlSessionTemplate sqlSession, String user_id) {
		loggger.info("reset_pass_cnt dao 진입 성공");
		return sqlSession.update("memberMapper.reset_pass_cnt", user_id);
		
	}

	public int member_yn_chk(SqlSessionTemplate sqlSession, int user_no) {
		loggger.info("member_yn_chk dao 진입 성공");
		return sqlSession.update("memberMapper.member_yn_chk", user_no);
	}


	public MemberVO findIdresult(SqlSessionTemplate sqlSession, String email) {
		loggger.info("findIdresult dao 진입 성공");
		System.out.println(email);
		return sqlSession.selectOne("memberMapper.find_id_result", email);
	}

	
	public int Edit_MyInform(SqlSessionTemplate sqlSession, MemberVO m) {
        loggger.info("Edit_MyInform dao 진입 성공");
        System.out.println(m);
        return sqlSession.update("memberMapper.edit_my_Inform", m);
    }

	

	public int user_profile_change(SqlSessionTemplate sqlSession, Files files) {
		 	
			loggger.info("user_profile_dao 진입");
	        
	        return sqlSession.insert("memberMapper.user_profile_change", files);
	}


	public String select_user_profile_changeName(SqlSessionTemplate sqlSession, Files files) {

		loggger.info("select_user_profile_changeName 진입");
        
		return sqlSession.selectOne("memberMapper.select_user_profile_changeName", files);
	}
	
	
	public String selectChangeName(SqlSessionTemplate sqlSession, int user_no) {

        return sqlSession.selectOne("filesMapper.selectChangeName", user_no);
    
	}

	public void delete_user_profile(SqlSessionTemplate sqlSession, int user_no) {
		
		sqlSession.delete("filesMapper.delete_user_profile", user_no);
	    
		
		
	}
	
	//승재씨 코드 
	public int userIdemailCheck(SqlSessionTemplate sqlSession, MemberVO m) {
	      loggger.info("userIdemailCheck dao 진입 성공");
	        System.out.println(m);
	        return sqlSession.selectOne("memberMapper.userIdemailCheck", m);
	   }

	   public int updatePwd(SqlSessionTemplate sqlSession, MemberVO m) {
	      loggger.info("updatePwd 진입 성공");
	        System.out.println(m);
	        return sqlSession.update("memberMapper.updatePwd", m);
	   }

	   public MemberVO findPwdresult(SqlSessionTemplate sqlSession, String user_id) {
	      loggger.info("findPwdresult dao 진입 성공");
	      System.out.println(user_id);
	      return sqlSession.selectOne("memberMapper.findPwdresult", user_id);
	   }

	public String select_userPw(SqlSessionTemplate sqlSession, MemberVO m) {
			loggger.info("select_userPw dao 진입 성공");
			return sqlSession.selectOne("memberMapper.select_userPw", m);
	}
	
	
	public int getListCount(SqlSessionTemplate sqlSession) {
	      // TODO Auto-generated method stub
	      return sqlSession.selectOne("memberMapper.getListCount");
	   }

	   public ArrayList<Recipe> selectmrList(int user_no, SqlSessionTemplate sqlSession, PageInfo pi) {
	      // TODO Auto-generated method stub
	      int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	      return (ArrayList)sqlSession.selectList("memberMapper.selectmrList", user_no, rowBounds);
	   }

	   public ArrayList<Files> selectmrfileList(SqlSessionTemplate sqlSession, int user_no, PageInfo pi) {
	      // TODO Auto-generated method stub
	      int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	      return (ArrayList)sqlSession.selectList("memberMapper.selectmrfileList", user_no, rowBounds);
	   }

	public int getListCountt(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.getListCountt");
	}

	public ArrayList<Recipe> selectmrListt(int user_no, SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		  int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	      return (ArrayList)sqlSession.selectList("memberMapper.selectmrListt", user_no, rowBounds);
	}

	public ArrayList<Files> selectmrfileListt(SqlSessionTemplate sqlSession, int user_no, PageInfo pi) {
		// TODO Auto-generated method stub
		  int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
	      RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	      return (ArrayList)sqlSession.selectList("memberMapper.selectmrfileListt", user_no, rowBounds);
	}

	public int selectScrapcount(SqlSessionTemplate sqlSession, int user_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectScrapcount", user_no);
	}

	public int selectMyRecipecount(SqlSessionTemplate sqlSession, int user_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectMyRecipecount", user_no);
	}
	
	

}
