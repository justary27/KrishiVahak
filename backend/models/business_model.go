package model

import (
	"github.com/google/uuid"
	"gorm.io/gorm"
)

type Business struct {
	gorm.Model
	ID             uuid.UUID `gorm:"type:uuid;primaryKey"`
	Name           string
	PhoneNumber    string
	Email          string
	Address        string
	Requests       []Request
	ActiveRequests []ActiveRequest
}
