#import "@preview/cades:0.3.0": qr-code

#let apply-template(
    body,
    name: "Aarav Bhatt",
    crsid: "crsid",
    course: "CST Part 1A",
    module: "Module",
    supoNo: "1",
    supervisor: "Supervisor",
    qrCode: "qrcode",
    rightHanded: true,
    venue: "Venue",
    date: datetime.today()
  ) = {

  // Sets the basic style of the document

  set line(
    length: 100%
  )

  set text(
    font: "New Computer Modern",
    size: 10pt
  )

  // Sets how the page is formatted so it works with Kudos
  set page(
    paper: "a4",
    margin: (
      left: if rightHanded {2cm} else {4cm},
      right: if rightHanded {4cm} else {2cm}, 
      y: 3cm
    ),
    header: [
      #columns(2)[
          // Name
          *#name*
          #linebreak()
          // Email
          #{crsid + "@cam.ac.uk"}
        #colbreak()
          #align(right)[
            // Supervision details
            *#{course + ": " + module + ", SV " + supoNo}*
            #linebreak()
            #date.display() , #venue
          ]
      ]
      #line()
    ],
    footer: [
      #line()
      #columns(3)[
          // Supervisor name
          For #supervisor
        #colbreak()
          #align(center)[
            // Submission QR code
            #qr-code(qrCode, height: 0.8cm)
          ]
        #colbreak()
          // Date
          #datetime.today().display("[month repr:long] [day], [year]")
          #h(1fr)
          // Page number
          #counter(page).display("1 / 1", both: true)
      ]
    ],
  )

  // Starts counting the question numbers
  let c = counter("question")

  // Returns the actual body of the document
  body
}

 // Creates a function to display a question/answer
#let question = (answer, ..args) => rect({
  
  set line(stroke: (paint: gray, thickness: 1pt, dash: "dashed"))

  counter("question").step()

  columns(2)[
      = Question #counter("question").display("1")
      #{
        if ("year" in args.named() and "paper" in args.named() and "questionNo" in args.named()) {
          [
          #args.named().at("year"), Paper #args.named().at("paper"), Question #args.named().at("questionNo")
          ]
        }
      }
    #colbreak()
      #{
        if ("year" in args.named() and "paper" in args.named() and "questionNo" in args.named()) {
          align(right)[
            #qr-code("https://www.cl.cam.ac.uk/teaching/exams/pastpapers/y" + args.named().at("year") + "p" + args.named().at("paper") + "q" + args.named().at("questionNo") + ".pdf", height: 1cm)

          ]
        }
      }
  ]
  line()

  if ("question" in args.named()) {
    [== Question:]
    v(0.5em)
    args.named().at("question")
    line()
  }
  
  [== Answer:]
  v(0.5em)
  answer
}, width: 100%, inset: 1.5em)

