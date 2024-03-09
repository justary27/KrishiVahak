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

    return c.Render("index", fiber.Map{
        "Requests":    requests,
    })
}

// func RequestView(c *fiber.Ctx) error {
// 	return c.Render("new", fiber.Map{
// 		"Title":    "New Request",
// 		"Subtitle": "Add a cool fact!",
// 	})
// }

// func CreateFact(c *fiber.Ctx) error {
// 	request := new(model.Request)
// 	if err := c.BodyParser(request); err != nil {
// 		return RequestView(c)
// 	}

// 	result := database.DB.Create(&request)
// 	if result.Error != nil {
// 		return RequestView(c)
// 	}

// 	return ListRequests(c)
// }

// func ShowRequest(c *fiber.Ctx) error {
// 	request := model.Request{}
// 	id := c.Params("id")

// 	result := database.DB.Where("id = ?", id).First(&request)
// 	if result.Error != nil {
// 		return NotFound(c)
// 	}

// 	return c.Status(fiber.StatusOK).Render("show", fiber.Map{
// 		"Title": "Single Request",
// 		"Request":  request,
// 	})
// }

// func EditRequest(c *fiber.Ctx) error {
// 	request := model.Request{}
// 	id := c.Params("id")

// 	result := database.DB.Where("id = ?", id).First(&request)
// 	if result.Error != nil {
// 		return NotFound(c)
// 	}

// 	return c.Render("edit", fiber.Map{
// 		"Title":    "Edit Request",
// 		"Subtitle": "Edit your interesting request",
// 		"Request":     request,
// 	})
// }

// func UpdateFact(c *fiber.Ctx) error {
// 	fact := new(model.Request)
// 	id := c.Params("id")

// 	if err := c.BodyParser(fact); err != nil {
// 		return c.Status(fiber.StatusServiceUnavailable).SendString(err.Error())
// 	}

// 	result := database.DB.Model(&fact).Where("id = ?", id).Updates(fact)
// 	if result.Error != nil {
// 		return EditFact(c)
// 	}

// 	return ShowFact(c)
// }

// func DeleteFact(c *fiber.Ctx) error {
// 	fact := model.Request{}
// 	id := c.Params("id")

// 	result := database.DB.Where("id = ?", id).Delete(&fact)
// 	if result.Error != nil {
// 		return NotFound(c)
// 	}

// 	return ListFacts(c)
// }

// func NotFound(c *fiber.Ctx) error {
// 	return c.Status(fiber.StatusNotFound).SendFile("./public/404.html")
// }

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

// func ListRequests() ([]model.Request, error) {
//     var requests []model.Request
//     if err := database.DB.Find(&requests).Error; err != nil {
//         return nil, err
//     }
//     return requests, nil
// }