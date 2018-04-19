package com.tang.taste.common.entity.pojo;

import java.util.ArrayList;
import java.util.List;

public class DishesExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public DishesExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andDishesNameIsNull() {
            addCriterion("dishes_name is null");
            return (Criteria) this;
        }

        public Criteria andDishesNameIsNotNull() {
            addCriterion("dishes_name is not null");
            return (Criteria) this;
        }

        public Criteria andDishesNameEqualTo(String value) {
            addCriterion("dishes_name =", value, "dishesName");
            return (Criteria) this;
        }

        public Criteria andDishesNameNotEqualTo(String value) {
            addCriterion("dishes_name <>", value, "dishesName");
            return (Criteria) this;
        }

        public Criteria andDishesNameGreaterThan(String value) {
            addCriterion("dishes_name >", value, "dishesName");
            return (Criteria) this;
        }

        public Criteria andDishesNameGreaterThanOrEqualTo(String value) {
            addCriterion("dishes_name >=", value, "dishesName");
            return (Criteria) this;
        }

        public Criteria andDishesNameLessThan(String value) {
            addCriterion("dishes_name <", value, "dishesName");
            return (Criteria) this;
        }

        public Criteria andDishesNameLessThanOrEqualTo(String value) {
            addCriterion("dishes_name <=", value, "dishesName");
            return (Criteria) this;
        }

        public Criteria andDishesNameLike(String value) {
            addCriterion("dishes_name like", value, "dishesName");
            return (Criteria) this;
        }

        public Criteria andDishesNameNotLike(String value) {
            addCriterion("dishes_name not like", value, "dishesName");
            return (Criteria) this;
        }

        public Criteria andDishesNameIn(List<String> values) {
            addCriterion("dishes_name in", values, "dishesName");
            return (Criteria) this;
        }

        public Criteria andDishesNameNotIn(List<String> values) {
            addCriterion("dishes_name not in", values, "dishesName");
            return (Criteria) this;
        }

        public Criteria andDishesNameBetween(String value1, String value2) {
            addCriterion("dishes_name between", value1, value2, "dishesName");
            return (Criteria) this;
        }

        public Criteria andDishesNameNotBetween(String value1, String value2) {
            addCriterion("dishes_name not between", value1, value2, "dishesName");
            return (Criteria) this;
        }

        public Criteria andDishesPriceIsNull() {
            addCriterion("dishes_price is null");
            return (Criteria) this;
        }

        public Criteria andDishesPriceIsNotNull() {
            addCriterion("dishes_price is not null");
            return (Criteria) this;
        }

        public Criteria andDishesPriceEqualTo(Double value) {
            addCriterion("dishes_price =", value, "dishesPrice");
            return (Criteria) this;
        }

        public Criteria andDishesPriceNotEqualTo(Double value) {
            addCriterion("dishes_price <>", value, "dishesPrice");
            return (Criteria) this;
        }

        public Criteria andDishesPriceGreaterThan(Double value) {
            addCriterion("dishes_price >", value, "dishesPrice");
            return (Criteria) this;
        }

        public Criteria andDishesPriceGreaterThanOrEqualTo(Double value) {
            addCriterion("dishes_price >=", value, "dishesPrice");
            return (Criteria) this;
        }

        public Criteria andDishesPriceLessThan(Double value) {
            addCriterion("dishes_price <", value, "dishesPrice");
            return (Criteria) this;
        }

        public Criteria andDishesPriceLessThanOrEqualTo(Double value) {
            addCriterion("dishes_price <=", value, "dishesPrice");
            return (Criteria) this;
        }

        public Criteria andDishesPriceIn(List<Double> values) {
            addCriterion("dishes_price in", values, "dishesPrice");
            return (Criteria) this;
        }

        public Criteria andDishesPriceNotIn(List<Double> values) {
            addCriterion("dishes_price not in", values, "dishesPrice");
            return (Criteria) this;
        }

        public Criteria andDishesPriceBetween(Double value1, Double value2) {
            addCriterion("dishes_price between", value1, value2, "dishesPrice");
            return (Criteria) this;
        }

        public Criteria andDishesPriceNotBetween(Double value1, Double value2) {
            addCriterion("dishes_price not between", value1, value2, "dishesPrice");
            return (Criteria) this;
        }

        public Criteria andDishesTypeIsNull() {
            addCriterion("dishes_type is null");
            return (Criteria) this;
        }

        public Criteria andDishesTypeIsNotNull() {
            addCriterion("dishes_type is not null");
            return (Criteria) this;
        }

        public Criteria andDishesTypeEqualTo(Integer value) {
            addCriterion("dishes_type =", value, "dishesType");
            return (Criteria) this;
        }

        public Criteria andDishesTypeNotEqualTo(Integer value) {
            addCriterion("dishes_type <>", value, "dishesType");
            return (Criteria) this;
        }

        public Criteria andDishesTypeGreaterThan(Integer value) {
            addCriterion("dishes_type >", value, "dishesType");
            return (Criteria) this;
        }

        public Criteria andDishesTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("dishes_type >=", value, "dishesType");
            return (Criteria) this;
        }

        public Criteria andDishesTypeLessThan(Integer value) {
            addCriterion("dishes_type <", value, "dishesType");
            return (Criteria) this;
        }

        public Criteria andDishesTypeLessThanOrEqualTo(Integer value) {
            addCriterion("dishes_type <=", value, "dishesType");
            return (Criteria) this;
        }

        public Criteria andDishesTypeIn(List<Integer> values) {
            addCriterion("dishes_type in", values, "dishesType");
            return (Criteria) this;
        }

        public Criteria andDishesTypeNotIn(List<Integer> values) {
            addCriterion("dishes_type not in", values, "dishesType");
            return (Criteria) this;
        }

        public Criteria andDishesTypeBetween(Integer value1, Integer value2) {
            addCriterion("dishes_type between", value1, value2, "dishesType");
            return (Criteria) this;
        }

        public Criteria andDishesTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("dishes_type not between", value1, value2, "dishesType");
            return (Criteria) this;
        }

        public Criteria andSupplyTimeIsNull() {
            addCriterion("supply_time is null");
            return (Criteria) this;
        }

        public Criteria andSupplyTimeIsNotNull() {
            addCriterion("supply_time is not null");
            return (Criteria) this;
        }

        public Criteria andSupplyTimeEqualTo(String value) {
            addCriterion("supply_time =", value, "supplyTime");
            return (Criteria) this;
        }

        public Criteria andSupplyTimeNotEqualTo(String value) {
            addCriterion("supply_time <>", value, "supplyTime");
            return (Criteria) this;
        }

        public Criteria andSupplyTimeGreaterThan(String value) {
            addCriterion("supply_time >", value, "supplyTime");
            return (Criteria) this;
        }

        public Criteria andSupplyTimeGreaterThanOrEqualTo(String value) {
            addCriterion("supply_time >=", value, "supplyTime");
            return (Criteria) this;
        }

        public Criteria andSupplyTimeLessThan(String value) {
            addCriterion("supply_time <", value, "supplyTime");
            return (Criteria) this;
        }

        public Criteria andSupplyTimeLessThanOrEqualTo(String value) {
            addCriterion("supply_time <=", value, "supplyTime");
            return (Criteria) this;
        }

        public Criteria andSupplyTimeLike(String value) {
            addCriterion("supply_time like", value, "supplyTime");
            return (Criteria) this;
        }

        public Criteria andSupplyTimeNotLike(String value) {
            addCriterion("supply_time not like", value, "supplyTime");
            return (Criteria) this;
        }

        public Criteria andSupplyTimeIn(List<String> values) {
            addCriterion("supply_time in", values, "supplyTime");
            return (Criteria) this;
        }

        public Criteria andSupplyTimeNotIn(List<String> values) {
            addCriterion("supply_time not in", values, "supplyTime");
            return (Criteria) this;
        }

        public Criteria andSupplyTimeBetween(String value1, String value2) {
            addCriterion("supply_time between", value1, value2, "supplyTime");
            return (Criteria) this;
        }

        public Criteria andSupplyTimeNotBetween(String value1, String value2) {
            addCriterion("supply_time not between", value1, value2, "supplyTime");
            return (Criteria) this;
        }

        public Criteria andPictureIsNull() {
            addCriterion("picture is null");
            return (Criteria) this;
        }

        public Criteria andPictureIsNotNull() {
            addCriterion("picture is not null");
            return (Criteria) this;
        }

        public Criteria andPictureEqualTo(String value) {
            addCriterion("picture =", value, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureNotEqualTo(String value) {
            addCriterion("picture <>", value, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureGreaterThan(String value) {
            addCriterion("picture >", value, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureGreaterThanOrEqualTo(String value) {
            addCriterion("picture >=", value, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureLessThan(String value) {
            addCriterion("picture <", value, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureLessThanOrEqualTo(String value) {
            addCriterion("picture <=", value, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureLike(String value) {
            addCriterion("picture like", value, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureNotLike(String value) {
            addCriterion("picture not like", value, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureIn(List<String> values) {
            addCriterion("picture in", values, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureNotIn(List<String> values) {
            addCriterion("picture not in", values, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureBetween(String value1, String value2) {
            addCriterion("picture between", value1, value2, "picture");
            return (Criteria) this;
        }

        public Criteria andPictureNotBetween(String value1, String value2) {
            addCriterion("picture not between", value1, value2, "picture");
            return (Criteria) this;
        }

        public Criteria andDescIsNull() {
            addCriterion("`desc` is null");
            return (Criteria) this;
        }

        public Criteria andDescIsNotNull() {
            addCriterion("`desc` is not null");
            return (Criteria) this;
        }

        public Criteria andDescEqualTo(String value) {
            addCriterion("`desc` =", value, "desc");
            return (Criteria) this;
        }

        public Criteria andDescNotEqualTo(String value) {
            addCriterion("`desc` <>", value, "desc");
            return (Criteria) this;
        }

        public Criteria andDescGreaterThan(String value) {
            addCriterion("`desc` >", value, "desc");
            return (Criteria) this;
        }

        public Criteria andDescGreaterThanOrEqualTo(String value) {
            addCriterion("`desc` >=", value, "desc");
            return (Criteria) this;
        }

        public Criteria andDescLessThan(String value) {
            addCriterion("`desc` <", value, "desc");
            return (Criteria) this;
        }

        public Criteria andDescLessThanOrEqualTo(String value) {
            addCriterion("`desc` <=", value, "desc");
            return (Criteria) this;
        }

        public Criteria andDescLike(String value) {
            addCriterion("`desc` like", value, "desc");
            return (Criteria) this;
        }

        public Criteria andDescNotLike(String value) {
            addCriterion("`desc` not like", value, "desc");
            return (Criteria) this;
        }

        public Criteria andDescIn(List<String> values) {
            addCriterion("`desc` in", values, "desc");
            return (Criteria) this;
        }

        public Criteria andDescNotIn(List<String> values) {
            addCriterion("`desc` not in", values, "desc");
            return (Criteria) this;
        }

        public Criteria andDescBetween(String value1, String value2) {
            addCriterion("`desc` between", value1, value2, "desc");
            return (Criteria) this;
        }

        public Criteria andDescNotBetween(String value1, String value2) {
            addCriterion("`desc` not between", value1, value2, "desc");
            return (Criteria) this;
        }

        public Criteria andDelFlagIsNull() {
            addCriterion("del_flag is null");
            return (Criteria) this;
        }

        public Criteria andDelFlagIsNotNull() {
            addCriterion("del_flag is not null");
            return (Criteria) this;
        }

        public Criteria andDelFlagEqualTo(Integer value) {
            addCriterion("del_flag =", value, "delFlag");
            return (Criteria) this;
        }

        public Criteria andDelFlagNotEqualTo(Integer value) {
            addCriterion("del_flag <>", value, "delFlag");
            return (Criteria) this;
        }

        public Criteria andDelFlagGreaterThan(Integer value) {
            addCriterion("del_flag >", value, "delFlag");
            return (Criteria) this;
        }

        public Criteria andDelFlagGreaterThanOrEqualTo(Integer value) {
            addCriterion("del_flag >=", value, "delFlag");
            return (Criteria) this;
        }

        public Criteria andDelFlagLessThan(Integer value) {
            addCriterion("del_flag <", value, "delFlag");
            return (Criteria) this;
        }

        public Criteria andDelFlagLessThanOrEqualTo(Integer value) {
            addCriterion("del_flag <=", value, "delFlag");
            return (Criteria) this;
        }

        public Criteria andDelFlagIn(List<Integer> values) {
            addCriterion("del_flag in", values, "delFlag");
            return (Criteria) this;
        }

        public Criteria andDelFlagNotIn(List<Integer> values) {
            addCriterion("del_flag not in", values, "delFlag");
            return (Criteria) this;
        }

        public Criteria andDelFlagBetween(Integer value1, Integer value2) {
            addCriterion("del_flag between", value1, value2, "delFlag");
            return (Criteria) this;
        }

        public Criteria andDelFlagNotBetween(Integer value1, Integer value2) {
            addCriterion("del_flag not between", value1, value2, "delFlag");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}