const path = require("path");
const mysql = require('mysql2');
const express = require("express");
const app = express();
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "/views"));

app.use(express.static('public'));

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '9h4a4r1s2h8a',
  database: 'dbms_project',
});

const port = 3000;

connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL');
});

const q = "use dbms_project";

app.get("/",(req,res)=>{
    res.render("home.ejs");
})

app.get("/Organizer", (req, res) => {
  const q = "select * from Organizer";
  try {
    connection.query(q, (err, result) => {
      if (err) throw err;
      res.render("organizershow.ejs", { k: result });
      console.log(result);
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/Event", (req, res) => {
  const q = "select * from Event";
  try {
    connection.query(q, (err, result) => {
      if (err) throw err;
      res.render("eventshow.ejs",{k:result})
      console.log(result);
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/Event/:id",(req,res)=>{
  k=req.params.id;
  k = parseInt(k.substring(1));
  const q = `select * from Event where Event_ID=${k}`;
  try {
    connection.query(q, (err, result) => {
      if (err) throw err;
      res.send(result)
      console.log(result);
    });
  } catch (err) {
    console.log(err);
  }
})

app.get("/Participants", (req, res) => {
  const q = "select * from Participant";
  try {
    connection.query(q, (err, result) => {
      if (err) throw err;
      res.render("participantsshow.ejs",{k:result});
      console.log(result);
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/Registrations", (req, res) => {
  const q = "select * from Registration";
  try {
    connection.query(q, (err, result) => {
      if (err) throw err;
      // res.send(result);
      res.render("registrationshow.ejs",{k:result});
      console.log(result);
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/Registrations/Event/:id",(req,res)=>{
  k=req.params.id;
  console.log(k);
  k = parseInt(k.substring(1));
  const q = `select * from Event where Event_ID=${k}`;
  try {
    connection.query(q, (err, result) => {
      if (err) throw err;
      res.send(result)
      console.log(result);
    });
  } catch (err) {
    console.log(err);
  }
})

app.get("/ER-Diagram",(req,res)=>{
  res.render("er-diagram.ejs");
})

app.get("/Venues", (req, res) => {
  const q = "select * from Venue";
  try {
    connection.query(q, (err, result) => {
      if (err) throw err;
      res.render("venueshow.ejs",{k:result});
      console.log(result);
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/Speakers", (req, res) => {
  const q = "select * from Speaker";
  try {
    connection.query(q, (err, result) => {
      if (err) throw err;
      res.render("speakershow.ejs",{k:result});
      res.send(result);
      console.log(result);
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/Ticket", (req, res) => {
  const q = "SELECT * FROM Ticket";
  try {
    connection.query(q, (err, result) => {
      if (err) {
        console.log(err);
        res.status(500).send("Error retrieving tickets");
        return;
      }
      res.render("ticketshow.ejs", { k: result });
    });
  } catch (err) {
    console.log(err);
    res.status(500).send("Internal Server Error");
  }
});


app.get("/Booking", (req, res) => {
  const q = "SELECT * FROM Booking";
  try {
    connection.query(q, (err, result) => {
      if (err) throw err;
      res.render("bookingshow.ejs", { k: result });
      console.log(result);
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/Payment", (req, res) => {
  const q = "SELECT * FROM Payment";
  try {
    connection.query(q, (err, result) => {
      if (err) throw err;
      res.render("paymentshow.ejs", { k: result });
      console.log(result);
    });
  } catch (err) {
    console.log(err);
  }
});

app.get("/Feedback", (req, res) => {
  const q = "SELECT * FROM Feedback";
  try {
    connection.query(q, (err, result) => {
      if (err) throw err;
      res.render("feedbackshow.ejs", { k: result });
      console.log(result);
    });
  } catch (err) {
    console.log(err);
  }
});

app.listen(port, () => {
  console.log(`Listening on ${port}`);
});
