package com.tang.taste.common.entity.pojo;

import java.util.ArrayList;
import java.util.List;

public class TableOrderDetailExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TableOrderDetailExample() {
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

        public Criteria andTableIdIsNull() {
            addCriterion("table_id is null");
            return (Criteria) this;
        }

        public Criteria andTableIdIsNotNull() {
            addCriterion("table_id is not null");
            return (Criteria) this;
        }

        public Criteria andTableIdEqualTo(Integer value) {
            addCriterion("table_id =", value, "tableId");
            return (Criteria) this;
        }

        public Criteria andTableIdNotEqualTo(Integer value) {
            addCriterion("table_id <>", value, "tableId");
            return (Criteria) this;
        }

        public Criteria andTableIdGreaterThan(Integer value) {
            addCriterion("table_id >", value, "tableId");
            return (Criteria) this;
        }

        public Criteria andTableIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("table_id >=", value, "tableId");
            return (Criteria) this;
        }

        public Criteria andTableIdLessThan(Integer value) {
            addCriterion("table_id <", value, "tableId");
            return (Criteria) this;
        }

        public Criteria andTableIdLessThanOrEqualTo(Integer value) {
            addCriterion("table_id <=", value, "tableId");
            return (Criteria) this;
        }

        public Criteria andTableIdIn(List<Integer> values) {
            addCriterion("table_id in", values, "tableId");
            return (Criteria) this;
        }

        public Criteria andTableIdNotIn(List<Integer> values) {
            addCriterion("table_id not in", values, "tableId");
            return (Criteria) this;
        }

        public Criteria andTableIdBetween(Integer value1, Integer value2) {
            addCriterion("table_id between", value1, value2, "tableId");
            return (Criteria) this;
        }

        public Criteria andTableIdNotBetween(Integer value1, Integer value2) {
            addCriterion("table_id not between", value1, value2, "tableId");
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

        public Criteria andSumNumIsNull() {
            addCriterion("sum_num is null");
            return (Criteria) this;
        }

        public Criteria andSumNumIsNotNull() {
            addCriterion("sum_num is not null");
            return (Criteria) this;
        }

        public Criteria andSumNumEqualTo(Integer value) {
            addCriterion("sum_num =", value, "sumNum");
            return (Criteria) this;
        }

        public Criteria andSumNumNotEqualTo(Integer value) {
            addCriterion("sum_num <>", value, "sumNum");
            return (Criteria) this;
        }

        public Criteria andSumNumGreaterThan(Integer value) {
            addCriterion("sum_num >", value, "sumNum");
            return (Criteria) this;
        }

        public Criteria andSumNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("sum_num >=", value, "sumNum");
            return (Criteria) this;
        }

        public Criteria andSumNumLessThan(Integer value) {
            addCriterion("sum_num <", value, "sumNum");
            return (Criteria) this;
        }

        public Criteria andSumNumLessThanOrEqualTo(Integer value) {
            addCriterion("sum_num <=", value, "sumNum");
            return (Criteria) this;
        }

        public Criteria andSumNumIn(List<Integer> values) {
            addCriterion("sum_num in", values, "sumNum");
            return (Criteria) this;
        }

        public Criteria andSumNumNotIn(List<Integer> values) {
            addCriterion("sum_num not in", values, "sumNum");
            return (Criteria) this;
        }

        public Criteria andSumNumBetween(Integer value1, Integer value2) {
            addCriterion("sum_num between", value1, value2, "sumNum");
            return (Criteria) this;
        }

        public Criteria andSumNumNotBetween(Integer value1, Integer value2) {
            addCriterion("sum_num not between", value1, value2, "sumNum");
            return (Criteria) this;
        }

        public Criteria andSumMoneyIsNull() {
            addCriterion("sum_money is null");
            return (Criteria) this;
        }

        public Criteria andSumMoneyIsNotNull() {
            addCriterion("sum_money is not null");
            return (Criteria) this;
        }

        public Criteria andSumMoneyEqualTo(Double value) {
            addCriterion("sum_money =", value, "sumMoney");
            return (Criteria) this;
        }

        public Criteria andSumMoneyNotEqualTo(Double value) {
            addCriterion("sum_money <>", value, "sumMoney");
            return (Criteria) this;
        }

        public Criteria andSumMoneyGreaterThan(Double value) {
            addCriterion("sum_money >", value, "sumMoney");
            return (Criteria) this;
        }

        public Criteria andSumMoneyGreaterThanOrEqualTo(Double value) {
            addCriterion("sum_money >=", value, "sumMoney");
            return (Criteria) this;
        }

        public Criteria andSumMoneyLessThan(Double value) {
            addCriterion("sum_money <", value, "sumMoney");
            return (Criteria) this;
        }

        public Criteria andSumMoneyLessThanOrEqualTo(Double value) {
            addCriterion("sum_money <=", value, "sumMoney");
            return (Criteria) this;
        }

        public Criteria andSumMoneyIn(List<Double> values) {
            addCriterion("sum_money in", values, "sumMoney");
            return (Criteria) this;
        }

        public Criteria andSumMoneyNotIn(List<Double> values) {
            addCriterion("sum_money not in", values, "sumMoney");
            return (Criteria) this;
        }

        public Criteria andSumMoneyBetween(Double value1, Double value2) {
            addCriterion("sum_money between", value1, value2, "sumMoney");
            return (Criteria) this;
        }

        public Criteria andSumMoneyNotBetween(Double value1, Double value2) {
            addCriterion("sum_money not between", value1, value2, "sumMoney");
            return (Criteria) this;
        }

        public Criteria andPayPriceIsNull() {
            addCriterion("pay_price is null");
            return (Criteria) this;
        }

        public Criteria andPayPriceIsNotNull() {
            addCriterion("pay_price is not null");
            return (Criteria) this;
        }

        public Criteria andPayPriceEqualTo(Double value) {
            addCriterion("pay_price =", value, "payPrice");
            return (Criteria) this;
        }

        public Criteria andPayPriceNotEqualTo(Double value) {
            addCriterion("pay_price <>", value, "payPrice");
            return (Criteria) this;
        }

        public Criteria andPayPriceGreaterThan(Double value) {
            addCriterion("pay_price >", value, "payPrice");
            return (Criteria) this;
        }

        public Criteria andPayPriceGreaterThanOrEqualTo(Double value) {
            addCriterion("pay_price >=", value, "payPrice");
            return (Criteria) this;
        }

        public Criteria andPayPriceLessThan(Double value) {
            addCriterion("pay_price <", value, "payPrice");
            return (Criteria) this;
        }

        public Criteria andPayPriceLessThanOrEqualTo(Double value) {
            addCriterion("pay_price <=", value, "payPrice");
            return (Criteria) this;
        }

        public Criteria andPayPriceIn(List<Double> values) {
            addCriterion("pay_price in", values, "payPrice");
            return (Criteria) this;
        }

        public Criteria andPayPriceNotIn(List<Double> values) {
            addCriterion("pay_price not in", values, "payPrice");
            return (Criteria) this;
        }

        public Criteria andPayPriceBetween(Double value1, Double value2) {
            addCriterion("pay_price between", value1, value2, "payPrice");
            return (Criteria) this;
        }

        public Criteria andPayPriceNotBetween(Double value1, Double value2) {
            addCriterion("pay_price not between", value1, value2, "payPrice");
            return (Criteria) this;
        }

        public Criteria andSpecialDiscountIsNull() {
            addCriterion("special_discount is null");
            return (Criteria) this;
        }

        public Criteria andSpecialDiscountIsNotNull() {
            addCriterion("special_discount is not null");
            return (Criteria) this;
        }

        public Criteria andSpecialDiscountEqualTo(Double value) {
            addCriterion("special_discount =", value, "specialDiscount");
            return (Criteria) this;
        }

        public Criteria andSpecialDiscountNotEqualTo(Double value) {
            addCriterion("special_discount <>", value, "specialDiscount");
            return (Criteria) this;
        }

        public Criteria andSpecialDiscountGreaterThan(Double value) {
            addCriterion("special_discount >", value, "specialDiscount");
            return (Criteria) this;
        }

        public Criteria andSpecialDiscountGreaterThanOrEqualTo(Double value) {
            addCriterion("special_discount >=", value, "specialDiscount");
            return (Criteria) this;
        }

        public Criteria andSpecialDiscountLessThan(Double value) {
            addCriterion("special_discount <", value, "specialDiscount");
            return (Criteria) this;
        }

        public Criteria andSpecialDiscountLessThanOrEqualTo(Double value) {
            addCriterion("special_discount <=", value, "specialDiscount");
            return (Criteria) this;
        }

        public Criteria andSpecialDiscountIn(List<Double> values) {
            addCriterion("special_discount in", values, "specialDiscount");
            return (Criteria) this;
        }

        public Criteria andSpecialDiscountNotIn(List<Double> values) {
            addCriterion("special_discount not in", values, "specialDiscount");
            return (Criteria) this;
        }

        public Criteria andSpecialDiscountBetween(Double value1, Double value2) {
            addCriterion("special_discount between", value1, value2, "specialDiscount");
            return (Criteria) this;
        }

        public Criteria andSpecialDiscountNotBetween(Double value1, Double value2) {
            addCriterion("special_discount not between", value1, value2, "specialDiscount");
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