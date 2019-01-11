package com.property.bean;

public class Car {
    private Integer carId;

    private Integer userId;

    private String carBrand;

    private String carNumber;

    private String carColor;

    public Integer getCarId() {
        return carId;
    }

    public void setCarId(Integer carId) {
        this.carId = carId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getCarBrand() {
        return carBrand;
    }

    public void setCarBrand(String carBrand) {
        this.carBrand = carBrand == null ? null : carBrand.trim();
    }

    public String getCarNumber() {
        return carNumber;
    }

    public void setCarNumber(String carNumber) {
        this.carNumber = carNumber == null ? null : carNumber.trim();
    }

    public String getCarColor() {
        return carColor;
    }

    public void setCarColor(String carColor) {
        this.carColor = carColor == null ? null : carColor.trim();
    }

	@Override
	public String toString() {
		return "Car [carId=" + carId + ", userId=" + userId + ", carBrand=" + carBrand + ", carNumber=" + carNumber
				+ ", carColor=" + carColor + "]";
	}
    
    
}