import express from "express";
import userRouter from "./userRouter.js";
import authRouter from "./authRouter.js";
import resRouter from "./resRouter.js";
import foodRouter from "./foodRouter.js";

const rootRouter = express.Router();
// User
rootRouter.use("/user", userRouter);

// Login
rootRouter.use("/auth", authRouter);

// Restaurant
rootRouter.use("/res", resRouter);

// Food
rootRouter.use("/food", foodRouter);

export default rootRouter;
