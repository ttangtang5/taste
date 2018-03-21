package com.tang.taste.common.dao;

import com.tang.taste.common.entity.pojo.Booking;
import com.tang.taste.common.entity.pojo.BookingExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BookingMapper {
    long countByExample(BookingExample example);

    int deleteByExample(BookingExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Booking record);

    int insertSelective(Booking record);

    List<Booking> selectByExample(BookingExample example);

    Booking selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Booking record, @Param("example") BookingExample example);

    int updateByExample(@Param("record") Booking record, @Param("example") BookingExample example);

    int updateByPrimaryKeySelective(Booking record);

    int updateByPrimaryKey(Booking record);
}