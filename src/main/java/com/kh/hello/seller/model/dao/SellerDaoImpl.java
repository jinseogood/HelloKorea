package com.kh.hello.seller.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.seller.model.vo.Attachment;
import com.kh.hello.seller.model.vo.Company;
import com.kh.hello.seller.model.vo.PageInfo;
import com.kh.hello.seller.model.vo.RegistrationHistory;
import com.kh.hello.seller.model.vo.Room;
import com.kh.hello.seller.model.vo.SearchProduct;

@Repository
public class SellerDaoImpl implements SellerDao{

	@Override
	public int insertCompany(Company c, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Company.insertCompany", c);
	}

	@Override
	public int insertRoom1(Room rm, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Room.insertRoom", rm);
	}
	
	@Override
	public int insertRoom2(Room rm, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Room.insertRoom", rm);
	}
	
	@Override
	public int insertRoom3(Room rm, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Room.insertRoom", rm);
	}

	@Override
	public int insertRH(RegistrationHistory rh, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("RH.insertRH", rh);
	}

	@Override
	public int insertPerFile(Attachment perFileDB, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("SellerAT.insertPerFile", perFileDB);
	}

	@Override
	public int insertComFile(Attachment comFileDB, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("SellerAT.insertComFile", comFileDB);
	}

	@Override
	public int getProductListCount(int mId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Product.getProductListCount", mId);
	}

	@Override
	public ArrayList<SearchProduct> selectProductList(int mId, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<SearchProduct> list=(ArrayList)sqlSession.selectList("Product.selectProductList", mId, rowBounds);
		return list;
	}

}
