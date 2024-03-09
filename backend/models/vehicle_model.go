package model

import "gorm.io/gorm"

type Vehicle struct {
	gorm.Model
	vehicleNumber string
	// vehicleName     string
	vehicleCapacity int
	driverName      string
}
