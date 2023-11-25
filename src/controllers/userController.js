import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { Sequelize } from "sequelize";

import { responseData } from "../config/response.js";

let model = initModels(sequelize);
let Op = Sequelize.Op;

// danh sách người dùng
export const getUser = async (req, res) => {
  try {
    let data = await model.users.findAll();
    responseData(res, "Success", data, 200);
  } catch (exception) {
    responseData(res, "Error", exception.message, 500);
  }
};


