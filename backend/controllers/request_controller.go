package controllers

import (
	"backend/database"

	"github.com/gofiber/fiber/v2"
	"github.com/google/uuid"

	model "backend/models"
)

func ListRequests(c *fiber.Ctx) error {
	requests := []model.Request{}
	database.DB.Find(&requests)

	return c.JSON(requests)
}

func CreateRequest(request *model.Request) error {
	return database.DB.Create(request).Error
}

func GetRequestByID(id uuid.UUID) (*model.Request, error) {
	var request model.Request
	if err := database.DB.First(&request, "id = ?", id).Error; err != nil {
		return nil, err
	}
	return &request, nil
}

func UpdateRequest(request *model.Request) error {
	return database.DB.Save(request).Error
}

func DeleteRequestByID(id uuid.UUID) error {
	return database.DB.Delete(&model.Request{}, "id = ?", id).Error
}
