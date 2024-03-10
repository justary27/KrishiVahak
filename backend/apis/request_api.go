package apis

import (
	"backend/controllers"
	model "backend/models"

	"github.com/gofiber/fiber/v2"
)

func GetRequests(requestGroup fiber.Router) {
	requestGroup.Get("/", func(ctx *fiber.Ctx) error {
		return controllers.ListRequests(ctx)
	})
}

func CreateRequest(requestGroup fiber.Router) {
	requestGroup.Post("/", func(ctx *fiber.Ctx) error {
		request := &model.Request{}
		return controllers.CreateRequest(request)
	})
}

func GetRequest(requestGroup fiber.Router)    {}
func UpdateRequest(requestGroup fiber.Router) {}
func DeleteRequest(requestGroup fiber.Router) {}
