package model

import (
	"github.com/google/uuid"
)

type Business struct {
	ID          uuid.UUID `gorm:"type:uuid;primaryKey"`
	Name        string
	PhoneNumber string
	Email       string
	Address     string
}