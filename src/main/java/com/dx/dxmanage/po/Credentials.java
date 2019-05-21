package com.dx.dxmanage.po;

public class Credentials {
    private Integer id;

    private Integer salesid;

    private String url;

    private String str;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSalesid() {
        return salesid;
    }

    public void setSalesid(Integer salesid) {
        this.salesid = salesid;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getStr() {
        return str;
    }

    public void setStr(String str) {
        this.str = str == null ? null : str.trim();
    }
}