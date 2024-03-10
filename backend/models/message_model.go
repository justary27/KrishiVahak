package model

import (
	"time"

	"github.com/google/uuid"
)

type Message struct {
	ID        uuid.UUID `gorm:"type:uuid;primaryKey"`
	Content   string
	Sender    string
	CreatedAt time.Time
}
