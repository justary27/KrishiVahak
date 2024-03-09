package model

import (
	"time"

	"github.com/google/uuid"
	"gorm.io/gorm"
)

const (
	InNegotiation = "Negotiation"
	InPickup      = "Pickup"
	InRoute       = "Enroute"
	Delivered     = "Delivered"
	Cancelled     = "Cancelled"
)

type Request struct {
	gorm.Model
	ID          uuid.UUID `gorm:"type:uuid;primaryKey"`
	quote       int
	requester   User
	requestTime time.Time
	description string
	src         string
	dest        string
	status      string
}

func (request *Request) BeforeCreate(tx *gorm.DB) (err error) {
	request.ID = uuid.New()

	return nil
}

type ActiveRequest struct {
	Request

	vehicle     Vehicle
	completedOn time.Time
}
