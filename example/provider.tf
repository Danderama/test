provider "aws" {
   //login crenditials
   access_key = "${var.AWS_ACCESS_KEY}"
   secret_key = "${var.AWS_SECRET_KEY}"
   
   //LOCATION
   
   region = "${var.AWS_REGION}"

}

