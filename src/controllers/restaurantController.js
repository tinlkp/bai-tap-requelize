import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";
import { responseData } from "../config/response.js";

let model = initModels(sequelize);

// lấy danh sách nhà hàng
export const getRestaurant = async (req, res) => {
  try {
    let data = await model.restaurant.findAll();
    responseData(res, "Success", data, 200);
  } catch (exception) {
    responseData(res, "Error", exception.message, 500);
  }
};

// lấy thông tin nhà hàng thông qua res_id
export const getResById = async (req, res) => {
  try {
    let { res_id } = req.params;
    let data = await model.restaurant.findOne({
      where: {
        res_id,
      },
    });
    responseData(res, "Success", data, 200);
  } catch (exception) {
    responseData(res, "Error", exception.message, 500);
  }
};

// like nhà hàng
export const likeRes = async (req, res) => {
  try {
    let { user_id } = req.headers;
    let { res_id } = req.body;

    // check like đã tồn tại hay chưa
    let checkLike = await model.like_res.findOne({
      where: {
        user_id,
        res_id,
      },
    });

    // nếu đã tồn tại thì sẽ set ngược lại giá trị của set_like để unlike
    if (checkLike) {
      await model.like_res.update(
        { set_like: !checkLike.set_like },
        {
          where: {
            user_id,
            res_id,
          },
        }
      );
      responseData(res, "Like đã được cập nhật", checkLike, 200);
    }

    // nếu chưa tồn tại sẽ tạo lượt like
    else {
      let newData = {
        user_id,
        res_id,
        date_like: new Date(),
        set_like: true,
      };
      await model.like_res.create(newData);

      responseData(res, "Success", newData, 200);
    }
  } catch (exception) {
    responseData(res, "Error", exception.message, 500);
  }
};

// lấy danh sách like theo nhà hàng và người dùng
export const getResLike = async (req, res) => {
  try {
    let { res_id } = req.params;
    let data = await model.like_res.findAll({
      where: {
        res_id,
      },
      include: ["user"],
    });
    responseData(res, "Success", data, 200);
  } catch (exception) {
    responseData(res, "Error", exception.message, 500);
  }
};

// đánh giá nhà hàng
export const rateRes = async (req, res) => {
  try {
    let { user_id } = req.headers;
    let { res_id, amount } = req.body;

    // kiểm tra đã đánh giá chưa
    let checkRate = await model.rate_res.findOne({
      where: {
        user_id,
        res_id,
      },
    });

    // nếu đã đánh giá
    if (checkRate) {
      responseData(res, "Đã đánh giá rồi", "", 200);
    }

    // nếu chưa đánh giá
    else {
      let newData = {
        user_id,
        res_id,
        amount,
        date_rate: new Date(),
      };
      await model.rate_res.create(newData);
      responseData(res, "Success", newData, 200);
    }
  } catch (exception) {
    responseData(res, "Error", exception.message, 500);
  }
};

// lấy danh sách đánh giá nhà hàng và người dùng
export const getResRate = async (req, res) => {
  try {
    let { res_id } = req.params;
    let data = await model.rate_res.findAll({
      where: {
        res_id,
      },
      include: ["user"],
    });
    responseData(res, "Success", data, 200);
  } catch (exception) {
    responseData(res, "Error", exception.message, 500);
  }
};
