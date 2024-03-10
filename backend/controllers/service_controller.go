package controllers

import (
	"backend/database"
	models "backend/models"
	"fmt"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/google/uuid"
	"gorm.io/gorm"
)

func ListServices(ctx *fiber.Ctx) error {
	requests := []models.Request{}
	database.DB.Find(&requests)

	return ctx.JSON(requests)
}

func CreateService(ctx *fiber.Ctx) error {
	type CreateRequestRequest struct {
		Quote       int       `json:"quote"`
		Requester   string    `json:"requester"`
		RequestTime time.Time `json:"requestTime"`
		Description string    `json:"description"`
		Src         string    `json:"src"`
		Dest        string    `json:"dest"`
		Status      string    `json:"status"`
	}

	req := new(CreateRequestRequest)

	if err := ctx.BodyParser(req); err != nil {
		return err
	}

	result := database.DB.Unscoped().Delete(&models.Request{}, "deleted_at IS NOT NULL")
	if result.Error != nil {
		return result.Error
	}

	uuidFromString, err := uuid.Parse(req.Requester)
	if err != nil {
		fmt.Println("Error parsing UUID:", err)
		return ctx.SendString("")
	}

	request := &models.Request{
		Quote:       req.Quote,
		Requester:   uuidFromString,
		RequestTime: req.RequestTime,
		Description: req.Description,
		Src:         req.Src,
		Dest:        req.Dest,
		Status:      req.Status,
	}

	if err := database.DB.Create(&request).Error; err != nil {
		return err
	}

	return ctx.JSON(request)
}

func GetService(ctx *fiber.Ctx) error {
	id := ctx.Params("requestId")
	uuidFromString, err := uuid.Parse(id)
	if err != nil {
		fmt.Println("Error parsing UUID:", err)
		return ctx.SendString("")
	}

	var request models.Request

	if err := database.DB.First(&request, uuidFromString).Error; err != nil {
		if err == gorm.ErrRecordNotFound {
			return ctx.Status(fiber.StatusNotFound).JSON(fiber.Map{"error": "Request not found"})
		}
		return err
	}

	return ctx.JSON(request)
}

func UpdateService(ctx *fiber.Ctx) error {
	type PutRequestRequest struct {
		Quote       int       `json:"quote"`
		Requester   string    `json:"requester"`
		RequestTime time.Time `json:"requestTime"`
		Description string    `json:"description"`
		Src         string    `json:"src"`
		Dest        string    `json:"dest"`
		Status      string    `json:"status"`
	}

	id := ctx.Params("userId")
	uuidFromString, err := uuid.Parse(id)
	if err != nil {
		fmt.Println("Error parsing UUID:", err)
		return ctx.SendString("")
	}
	var request models.Request

	if err := database.DB.First(&request, uuidFromString).Error; err != nil {
		if err == gorm.ErrRecordNotFound {
			return ctx.Status(fiber.StatusNotFound).JSON(fiber.Map{"error": "Request not found"})
		}
		return err
	}

	req := new(PutRequestRequest)
	if err := ctx.BodyParser(req); err != nil {
		return err
	}

	request.Quote = req.Quote
	request.Requester = uuidFromString
	// request.RequestTime
	request.Description = req.Description
	request.Src = req.Src
	request.Dest = req.Dest
	request.Status = req.Status

	database.DB.Save(&request)

	return ctx.SendString("Request deleted successfully!")
}

func DeleteService(ctx *fiber.Ctx) error {
	id := ctx.Params("serviceId")
	uuidFromString, err := uuid.Parse(id)
	if err != nil {
		fmt.Println("Error parsing UUID:", err)
		return ctx.SendString("")
	}

	var request models.Request

	if err := database.DB.First(&request, uuidFromString).Error; err != nil {
		if err == gorm.ErrRecordNotFound {
			return ctx.Status(fiber.StatusNotFound).JSON(fiber.Map{"error": "Request not found"})
		}
		return err
	}

	database.DB.Delete(&request)

	return ctx.SendString("Request deleted successuly!")
}
