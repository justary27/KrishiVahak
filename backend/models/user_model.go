package model

import (
	"github.com/google/uuid"
	"gorm.io/gorm"
)

type User struct {
	gorm.Model
	ID             uuid.UUID `gorm:"type:uuid"`
	Name           string
	PhoneNumber    string
	Requests       []Request       `gorm:"foreignKey:ID"`
	ActiveRequests []ActiveRequest `gorm:"foreignKey:ID"`
}
