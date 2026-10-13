const request = require("supertest");
const express = require("express");

test("GET /health renvoie 200", async () => {
  const app = require("../server");
  const res = await request(app).get("/health");
  expect(res.statusCode).toBe(200);
});