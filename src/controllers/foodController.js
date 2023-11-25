import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { Sequelize } from "sequelize";

import { responseData } from "../config/response.js";

let model = initModels(sequelize);
let Op = Sequelize.Op;

// lấy danh sách các món ăn
export const foodList = async (req, res) => {
  try {
    let data = await model.food.findAll();
    responseData(res, "Success", data, 200);
  } catch (exception) {
    responseData(res, "Error", exception.message, 500);
  }
};

// lấy chi tiết món ăn
export const foodDetail = async (req, res) => {
  try {
    let { food_id } = req.params;
    let data = await model.food.findOne({
      where: {
        food_id,
      },
    });
    responseData(res, "Success", data, 200);
  } catch (exception) {
    responseData(res, "Error", exception.message, 500);
  }
};

// đặt món
export const orderFood = async (req, res) => {
  try {
    let { user_id } = req.headers;
    let { food_id, amount, code, arr_sub_id } = req.body;
    let newData = {
      user_id,
      food_id,
      amount,
      code,
      arr_sub_id,
    };
    await model.orders.create(newData);
    responseData(res, "Đặt món thành công", newData, 200);
  } catch (exception) {
    responseData(res, "Error", exception.message, 500);
  }
};

// lấy danh sách đặt món
export const orderList = async (req, res) => {
  try {
    let data = await model.orders.findAll();
    responseData(res, "Success", data, 200);
  } catch (exception) {
    responseData(res, "Error", exception.message, 500);
  }
};
