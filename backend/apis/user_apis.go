package apis

import (
	"backend/controllers"
	"backend/database"
	model "backend/models"

	"github.com/gofiber/fiber/v2"
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
func UpdateUser(group *fiber.Router)  {}
func DeleteUsers(group *fiber.Router) {}
