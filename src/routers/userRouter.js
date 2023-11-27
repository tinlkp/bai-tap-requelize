import express from "express";
import { getUser, userOrderList } from "../controllers/userController.js";

const userRouter = express.Router();

// lấy danh sách người dùng
userRouter.get("/get-user", getUser);

// lấy danh sách các món đã đặt dựa trên người dùng
userRouter.get("/user-order", userOrderList);

export default userRouter;
