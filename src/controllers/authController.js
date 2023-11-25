import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { responseData } from "../config/response.js";

let model = initModels(sequelize);

// đăng nhâp
export const login = async (req, res) => {
  try {
    let { email, password } = req.body;
    let checkUser = await model.users.findOne({
      where: {
        email: email,
      },
    });
    if (checkUser) {
      if (checkUser.password == password) {
        responseData(res, "Login thành công", checkUser, 200);
      } else {
        responseData(res, "Password không đúng", "", 400);
      }
    } else {
      responseData(res, "Email không đúng", "", 400);
    }
  } catch (exception) {
    responseData(res, "Error", exception.message, 500);
  }
};

// đăng kí
export const signUp = async (req, res) => {
  try {
    let { full_name, email, password } = req.body;
    let checkEmail = await model.users.findOne({
      where: {
        email,
      },
    });
    if (checkEmail) {
      responseData(res, "Email đã tồn tại", "", 400);
      return;
    } else {
      let newData = {
        full_name,
        email,
        password,
      };
      await model.users.create(newData);
      responseData(res, "Đăng kí thành công", newData, 200);
    }
  } catch (exception) {
    responseData(res, "Error", exception.message, 500);
  }
};
