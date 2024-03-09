package apis

import (
	"backend/controllers"
	"backend/database"
	model "backend/models"
	"fmt"

	"github.com/gofiber/fiber/v2"
	"gorm.io/gorm"
)

func GetUsers(group fiber.Router) {
	group.Get("/", func(ctx *fiber.Ctx) error {
		return controllers.ListUsers(ctx)
	})
}

func CreateUser(group fiber.Router) {
	group.Post("/", func(ctx *fiber.Ctx) error {
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

		// Create a new User instance with the parsed data
		user := &model.User{
			Name:        req.Name,
			PhoneNumber: req.PhoneNumber,
		}

		// Save the new user to the database
		if err := database.DB.Create(&user).Error; err != nil {
			return err
		}
		return ctx.JSON(user)
	})
}



func GetUser(group *fiber.Router)     {}
func UpdateUser(group fiber.Router) {
	group.Put("/:id", func(ctx *fiber.Ctx) error {
		// Read the user ID from the URL parameter
		id := ctx.Params("id")

		// Find the user by ID
		var user model.User
		if err := database.DB.First(&user, "id = ?", id).Error; err != nil {
			return ctx.Status(fiber.StatusNotFound).JSON(fiber.Map{"message": "User not found"})
		}

		// Define a struct to hold the request body
		type UpdateUserRequest struct {
			Name        string `json:"name"`
			PhoneNumber string `json:"phoneNumber"`
		}

		// Parse the request body into the struct
		req := new(UpdateUserRequest)
		if err := ctx.BodyParser(req); err != nil {
			return ctx.Status(fiber.StatusBadRequest).JSON(fiber.Map{"message": "Invalid request body"})
		}

		// Update the user fields
		user.Name = req.Name
		user.PhoneNumber = req.PhoneNumber

		// Save the updated user to the database
		if err := database.DB.Save(&user).Error; err != nil {
			fmt.Printf("Error updating user: %s\n", err.Error())
			return ctx.Status(fiber.StatusInternalServerError).JSON(fiber.Map{"message": "Failed to update user"})
		}

		// Return the updated user
		return ctx.JSON(user)
	})
}

func deleteUserByID(db *gorm.DB, userID uint) error {
	var user model.User 

	result := db.First(&user, userID)
	if result.Error != nil {
		return result.Error
	}

	// Delete the user
	result = db.Delete(&user)
	if result.Error != nil {
		return result.Error
	}

	fmt.Printf("User with ID %d deleted successfully\n", userID)
	return nil
}

func DeleteUser(group fiber.Router) {
    group.Delete("/:id", func(ctx *fiber.Ctx) error {
        // Read the user ID from the URL parameter
        id := ctx.Params("id")
		var user model.User
		fmt.Printf("ID: %s\n", id)
		database.DB.Find(&user, "id = ?", id)
		fmt.Printf("User: %v\n", user)

		// Delete the user and return error if encountered
		err := database.DB.Delete(&user, "id = ?", id).Error

		if err != nil {
			return ctx.Status(404).JSON(fiber.Map{"status": "error", "message": "Failed to delete user", "data": nil})
		}

		// Return success message
		return ctx.JSON(fiber.Map{"status": "success", "message": "Deleted Note"})
    })
}
