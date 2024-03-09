package controllers

import (
	"backend/database"
	models "backend/models"

	"github.com/google/uuid"

	"github.com/gofiber/fiber/v2"
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

	// Generate a new UUID for the user
	id := uuid.New()

	// Create a new User instance with the parsed data
	user := &models.User{
		ID:          id,
		Name:        req.Name,
		PhoneNumber: req.PhoneNumber,
		// Set other fields here
	}

	if err := database.DB.Create(&user).Error; err != nil {
		return err
	}

	// Return the created user as JSON response
	return ctx.JSON(user)
}

func GetUser(ctx *fiber.Ctx) error {
	id := ctx.Params("id")
	var user models.User
	if err := database.DB.First(&user, id).Error; err != nil {
		if err == gorm.ErrRecordNotFound {
			return ctx.Status(fiber.StatusNotFound).JSON(fiber.Map{"error": "User not found"})
		}
		return err
	}
	return ctx.JSON(user)
}

func UpdateUser(ctx *fiber.Ctx) error {
	id := ctx.Params("id")
	var user models.User
	if err := database.DB.First(&user, id).Error; err != nil {
		if err == gorm.ErrRecordNotFound {
			return ctx.Status(fiber.StatusNotFound).JSON(fiber.Map{"error": "User not found"})
		}
		return err
	}
	if err := ctx.BodyParser(&user); err != nil {
		return err
	}
	database.DB.Save(&user)
	return ctx.JSON(user)
}

func DeleteUser(ctx *fiber.Ctx) error {
	id := ctx.Params("id")
	var user models.User
	if err := database.DB.First(&user, id).Error; err != nil {
		if err == gorm.ErrRecordNotFound {
			return ctx.Status(fiber.StatusNotFound).JSON(fiber.Map{"error": "User not found"})
		}
		return err
	}
	database.DB.Delete(&user)
	return ctx.SendString("User deleted successfully")
}
