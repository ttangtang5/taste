package com.tang.taste.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.util.Enumeration;
import java.util.Map;
import java.util.Vector;

/**
 * FileName: JsRequest
 * @Author:   16
 * Date:     2018/5/3 13:24
 * Description:封装的请求处理特殊字符
 */
public class JsRequest  extends HttpServletRequestWrapper {

    private Map params;

    public JsRequest(HttpServletRequest request) {
        super(request);
        this.params = request.getParameterMap();
    }

    @Override
    public Map getParameterMap() {
        return params ;
    }
    @Override
    public Enumeration getParameterNames() {
        Vector l = new Vector( params.keySet());
        return l.elements();
    }
    @Override
    public String[] getParameterValues(String name) {
        Object v = params.get(name);
        if (v == null ) {
            return null ;
        } else if (v instanceof String[]) {
            String[] value = (String[]) v;
            for (int i = 0; i < value.length; i++) {
                value[i] = value[i].replaceAll( "<", "&#60;" );
                value[i] = value[i].replaceAll( ">", "&#62;" );
            }
            return (String[]) value;
        } else if (v instanceof String) {
            String value = (String) v;
            value = value.replaceAll( "<", "&#60;" );
            value = value.replaceAll( ">", "&#62;" );
            return new String[] { (String) value };
        } else {
            return new String[] { v.toString() };
        }
    }
    @Override
    public String getParameter(String name) {
        Object v = params.get(name);
        if (v == null ) {
            return null ;
        } else if (v instanceof String[]) {
            String[] strArr = (String[]) v;
            if (strArr.length > 0) {
                String value = strArr[0];
                value = value.replaceAll( "<", "&#60;" );
                value = value.replaceAll( ">", "&#62;" );
                return value;
            } else {
                return null ;
            }
        } else if (v instanceof String) {
            String value = (String) v;
            value = value.replaceAll( "<", "&#60;" );
            value = value.replaceAll( ">", "&#62;" );
            return (String) value;
        } else {
            return v.toString();
        }
    }
}
