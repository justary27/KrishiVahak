package model

import (
	"github.com/google/uuid"
	"gorm.io/gorm"
)

const (
	vegetables = ""
	fruits     = ""
	flowers    = ""
)

type Service struct {
	gorm.Model
	ID          uuid.UUID `gorm:"type:uuid;primaryKey"`
	serviceType string
	description string
	quote       int
	vehicles    []Vehicle
}
