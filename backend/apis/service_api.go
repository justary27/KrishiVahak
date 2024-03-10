package apis

import (
	"backend/controllers"

	"github.com/gofiber/fiber/v2"
)

func CreateService(serviceGroup fiber.Router) {
	serviceGroup.Post("/", func(ctx *fiber.Ctx) error {
		return controllers.CreateService(ctx)
	})
}

func GetServices(serviceGroup fiber.Router) {
	serviceGroup.Get("/", func(ctx *fiber.Ctx) error {
		return controllers.ListServices(ctx)
	})
}

func GetService(serviceGroup fiber.Router) {
	serviceGroup.Get("/", func(ctx *fiber.Ctx) error {
		return controllers.GetService(ctx)
	})
}

func UpdateService(serviceGroup fiber.Router) {
	serviceGroup.Put("/", func(ctx *fiber.Ctx) error {
		return controllers.UpdateService(ctx)
	})
}

func DeleteService(serviceGroup fiber.Router) {
	serviceGroup.Delete("/", func(ctx *fiber.Ctx) error {
		return controllers.DeleteService(ctx)
	})
}
