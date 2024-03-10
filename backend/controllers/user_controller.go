package controllers

import (
	"backend/database"
	models "backend/models"
	"fmt"

	"github.com/gofiber/fiber/v2"
	"github.com/google/uuid"
	"gorm.io/gorm"
)

func ListUsers(ctx *fiber.Ctx) error {
	users := []models.User{}
	database.DB.Find(&users)

	return ctx.JSON(users)
}

func CreateUser(ctx *fiber.Ctx) error {
	// Define a struct to hold the request body
	type CreateUserRequest struct {
		Name        string `json:"name"`
		PhoneNumber string `json:"phoneNumber"`
	}

	// Parse the request body into the struct
	req := new(CreateUserRequest)

	if err := ctx.BodyParser(req); err != nil {
		return err
	}

	result := database.DB.Unscoped().Delete(&models.User{}, "deleted_at IS NOT NULL")
	if result.Error != nil {
		return result.Error
	}

	// Create a new User instance with the parsed data
	user := &models.User{
		Name:        req.Name,
		PhoneNumber: req.PhoneNumber,
	}

	if err := database.DB.Create(&user).Error; err != nil {
		return err
	}

	// Return the created user as JSON response
	return ctx.JSON(user)
}

func GetUser(ctx *fiber.Ctx) error {

	id := ctx.Params("userId")
	uuidFromString, err := uuid.Parse(id)
	if err != nil {
		fmt.Println("Error parsing UUID:", err)
		return ctx.SendString("")
	}

	var user models.User

	if err := database.DB.First(&user, uuidFromString).Error; err != nil {
		if err == gorm.ErrRecordNotFound {
			return ctx.Status(fiber.StatusNotFound).JSON(fiber.Map{"error": "User not found"})
		}
		return err
	}

	return ctx.JSON(user)
}

func UpdateUser(ctx *fiber.Ctx) error {
	type PutUserRequest struct {
		Name        string `json:"name"`
		PhoneNumber string `json:"phoneNumber"`
	}

	id := ctx.Params("userId")
	uuidFromString, err := uuid.Parse(id)
	if err != nil {
		fmt.Println("Error parsing UUID:", err)
		return ctx.SendString("")
	}
	var user models.User

	if err := database.DB.First(&user, uuidFromString).Error; err != nil {
		if err == gorm.ErrRecordNotFound {
			return ctx.Status(fiber.StatusNotFound).JSON(fiber.Map{"error": "User not found"})
		}
		return err
	}

	req := new(PutUserRequest)
	if err := ctx.BodyParser(req); err != nil {
		return err
	}

	user.Name = req.Name
	user.PhoneNumber = req.PhoneNumber

	database.DB.Save(&user)
	return ctx.SendString("User deleted successfully")
}

func DeleteUser(ctx *fiber.Ctx) error {
	id := ctx.Params("userId")
	uuidFromString, err := uuid.Parse(id)
	if err != nil {
		fmt.Println("Error parsing UUID:", err)
		return ctx.SendString("")
	}
	var user models.User

	if err := database.DB.First(&user, uuidFromString).Error; err != nil {
		if err == gorm.ErrRecordNotFound {
			return ctx.Status(fiber.StatusNotFound).JSON(fiber.Map{"error": "User not found"})
		}
		return err
	}

	database.DB.Delete(&user)
	return ctx.SendString("User deleted successfully")
}
