package com.kh.hello.good.model.service;

import com.kh.hello.good.model.vo.Good;

public interface GoodService {

	int selectOneDibs(Good gg);

	int insertDibsHotel(Good gg);

	int deleteDibsHotel(Good gg);

}
