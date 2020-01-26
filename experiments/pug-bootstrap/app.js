
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
  var locals = {
      type: 'nav-default',
      items: [
          { href: '#', text: "NavOne" },
          { href: '#', text: "NavTwo" },
          { href: '#', text: "NavThree" },
          { href: '#', text: "NavFour" },
          { href: '#', text: "NavFive" },
          { href: '#', text: "NavSix" }
      ]
  }
  res.render("default", locals);
});

http.createServer(app).listen(app.get("port"), function() {
  console.log("Express server listening on port " + app.get("port"));
});
