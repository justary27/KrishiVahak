package model

import (
	"github.com/google/uuid"
	"gorm.io/gorm"
)

type Business struct {
	gorm.Model
	ID             uuid.UUID `gorm:"type:uuid;primaryKey"`
	name           string
	phoneNumber    string
	email          string
	address        string
	requests       []Request
	activeRequests []ActiveRequest
}
