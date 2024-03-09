package apis

import (
	"backend/controllers"
	model "backend/models"

	"github.com/gofiber/fiber/v2"
)

func GetRequests(group fiber.Router) {
	group.Get("/", func(ctx *fiber.Ctx) error {
		return controllers.ListRequests(ctx)
	})
}

func CreateRequest(group fiber.Router) {
	group.Post("/", func(ctx *fiber.Ctx) error {
		request := &model.Request{}
		return controllers.CreateRequest(request)
	})
}

func GetRequest(group fiber.Router)    {}
func UpdateRequest(group fiber.Router) {}
func DeleteRequest(group fiber.Router) {}
