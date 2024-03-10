package apis

import (
	"backend/controllers"

	"github.com/gofiber/fiber/v2"
)

func CreateRequest(requestGroup fiber.Router) {
	requestGroup.Post("/", func(ctx *fiber.Ctx) error {
		return controllers.CreateRequest(ctx)
	})
}

func GetRequests(requestGroup fiber.Router) {
	requestGroup.Get("/", func(ctx *fiber.Ctx) error {
		return controllers.ListRequests(ctx)
	})
}

func GetRequest(requestGroup fiber.Router) {
	requestGroup.Get("/:requestId", func(ctx *fiber.Ctx) error {
		return controllers.GetRequest(ctx)
	})
}
func UpdateRequest(requestGroup fiber.Router) {
	requestGroup.Put("/:requestId", func(ctx *fiber.Ctx) error {
		return controllers.UpdateRequest(ctx)
	})
}
func DeleteRequest(requestGroup fiber.Router) {
	requestGroup.Delete("/:requestId", func(ctx *fiber.Ctx) error {
		return controllers.DeleteRequest(ctx)
	})
}
