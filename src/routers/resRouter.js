import express from "express";
import {
  getResById,
  getResLike,
  getResRate,
  getRestaurant,
  likeRes,
  rateRes,
} from "../controllers/restaurantController.js";

const resRouter = express.Router();

// lấy danh sách nhà hàng
resRouter.get("/get-res", getRestaurant);
// lấy 1 nhà hàng dựa trên res_id
resRouter.get("/get-res-id/:res_id", getResById);
// lấy danh sách lượt like của nhà hàng có res_id được truyền
resRouter.get("/get-res-like/:res_id", getResLike);
// like nhà hàng
resRouter.post("/post-like", likeRes);
// lấy danh sách dánh giá của nhà hàng có res_id được truyền
resRouter.get("/get-res-rate/:res_id", getResRate);
// đánh giá nhà hàng
resRouter.post("/post-rate", rateRes);
// lấy danh sách đặt món của khách


export default resRouter;
