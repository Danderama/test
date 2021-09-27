resource "aws_s3_bucket" "sample-bucket" {
      bucket = "rama0807"
	  acl = "private"
	  
	  versioning {
	    enabled = true
	  }
	  
    }