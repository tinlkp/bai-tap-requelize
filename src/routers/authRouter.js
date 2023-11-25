import express from "express";
import { login, signUp } from "../controllers/authController.js";

const authRouter = express.Router();
// đăng nhập
authRouter.post("/login", login);
// đăng kí
authRouter.post("/signup", signUp);

export default authRouter;
