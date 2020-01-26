
var express = require("express");
var http = require("http");
var path = require("path");

var app = express();

app.set("port", process.env.PORT || 3000);
app.set("views", __dirname + "/views");
app.set("view engine", "pug");


app.use(function(req, res, next) {
  app.locals.pretty = true;
  next();
});

app.use(express.static(path.join(__dirname, "public")));

app.get("/", function(req, res) {
  res.render("default");
});

http.createServer(app).listen(app.get("port"), function() {
  console.log("Express server listening on port " + app.get("port"));
});
