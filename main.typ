#import "template.typ": *

#show: apply-template.with(
  qrCode: "https://www.youtube.com/watch?v=xvFZjo5PgG0"
)
#question(
  question: [
    + Why should you use this?
    + Insert some random computer science question here
  ],
)[
  + Because Typst is better than Latex
  + Answers could go here

Answers could also go here:

I am going to use this paragraph to point out that you can easily change the name, email, venue (in the header and footer), etc. by changing the parameters of the template. The QR code at the bottom is important to set if you want to actually upload this to Kudos. You can change the margins too, if your supervisor is left-handed, though it is set to right-handed by default.
]
#question(
  year: "2006",
  paper: "2",
  questionNo: "1",
)[
You can use actual tripos questions like I have done here. Notice the QR code and the question number being displayed under the heading. 

Also, the questions are automatically numbered!
]
