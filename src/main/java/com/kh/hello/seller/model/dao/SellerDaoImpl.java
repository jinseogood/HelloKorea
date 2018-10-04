package com.kh.hello.seller.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hello.common.Attachment;
import com.kh.hello.common.PageInfo;
import com.kh.hello.seller.model.vo.Company;
import com.kh.hello.seller.model.vo.OneProduct;
import com.kh.hello.seller.model.vo.Registration;
import com.kh.hello.seller.model.vo.RegistrationHistory;
import com.kh.hello.seller.model.vo.Room;
import com.kh.hello.seller.model.vo.SearchProduct;

@Repository
public class SellerDaoImpl implements SellerDao{

	//업체 등록
	@Override
	public int insertCompany(Company c, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Company.insertCompany", c);
	}

	//객실1 등록
	@Override
	public int insertRoom1(Room rm, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Room.insertRoom", rm);
	}
	
	//객실2 등록
	@Override
	public int insertRoom2(Room rm, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Room.insertRoom", rm);
	}
	
	//객실3 등록
	@Override
	public int insertRoom3(Room rm, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Room.insertRoom", rm);
	}

	//등록이력 추가
	@Override
	public int insertRH(RegistrationHistory rh, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("RH.insertRH", rh);
	}

	//사업자등록증 파일 추가
	@Override
	public int insertPerFile(Attachment perFileDB, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Attachment.insertPerFile", perFileDB);
	}

	//법인등록증 파일 추가
	@Override
	public int insertComFile(Attachment comFileDB, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("Attachment.insertComFile", comFileDB);
	}

	//전체 상품 조회 리스트 카운트
	@Override
	public int getProductListCount(int mId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Product.getProductListCount", mId);
	}

	//전체 상품 조회 리스트
	@Override
	public ArrayList<SearchProduct> selectProductList(int mId, PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<SearchProduct> list=(ArrayList)sqlSession.selectList("Product.selectProductList", mId, rowBounds);
		return list;
	}

	//등록 기간 검색 상품 조회 리스트 카운트
	@Override
	public int getSearchDateProductListCount(int mId, String toDate, String fromDate, SqlSessionTemplate sqlSession) {
		ArrayList<Object> list=new ArrayList<Object>();
		list.add(mId);
		list.add(fromDate);
		list.add(toDate);
		return sqlSession.selectOne("Product.getSearchDateProductListCount", list);
	}

	//등록 기간 검색 상품 조회 리스트
	@Override
	public ArrayList<SearchProduct> selectSearchDateProductList(int mId, String toDate, String fromDate, PageInfo pi,
			SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<Object> list=new ArrayList<Object>();
		list.add(mId);
		list.add(fromDate);
		list.add(toDate);
		ArrayList<SearchProduct> rlist=(ArrayList)sqlSession.selectList("Product.selectSearchDateProductList", list, rowBounds);
		return rlist;
	}

	//검색 상품 조회 리스트 카운트
	@Override
	public int getSearchWordProductListCount(int mId, SearchProduct spd, SqlSessionTemplate sqlSession) {
		ArrayList<Object> list=new ArrayList<Object>();
		list.add(mId);
		list.add(spd);
		return sqlSession.selectOne("Product.getSearchWordProductListCount", list);
	}
	
	//검색 상품 조회 리스트
	@Override
	public ArrayList<SearchProduct> selectSearchWordProductListCount(int mId, SearchProduct spd, PageInfo pi,
			SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<Object> list=new ArrayList<Object>();
		list.add(mId);
		list.add(spd);
		ArrayList<SearchProduct> rlist=(ArrayList)sqlSession.selectList("Product.selectSearchWordProductList", list, rowBounds);
		return rlist;
	}

	//선택 상품 조회
	@Override
	public ArrayList<OneProduct> selectOneProduct(int cId, SqlSessionTemplate sqlSession) {
		System.out.println("dao cId : " + cId);
		ArrayList<OneProduct> opList=(ArrayList)sqlSession.selectList("OneProduct.selectOneProduct", cId);
		return opList;
	}

}
