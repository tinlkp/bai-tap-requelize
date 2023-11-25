import express from "express";
import {
  foodDetail,
  foodList,
  orderFood,
} from "../controllers/foodController.js";

const foodRouter = express.Router();

// lấy danh sách  món ăn
foodRouter.get("/food-list", foodList);

// lấy chi tiết món ăn
foodRouter.get("/food-detail/:food_id", foodDetail);

// đặt món ăn
foodRouter.post("/order-food", orderFood);

export default foodRouter;
