package com.chunyin.bean;

public class SheetWithBLOBs extends Sheet {
    private String sheetList;

    public String getSheetList() {
        return sheetList;
    }

    public void setSheetList(String sheetList) {
        this.sheetList = sheetList == null ? null : sheetList.trim();
    }
}