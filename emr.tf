resource "aws_emr_cluster" "cluster" {
	name = "Spark-Application"
	subnet_id = "subnet-32456a6d"
	vpc_id = "vpc-f087f88d"
	release_label = "emr-4.6.o"
	applications = ["spark"]
	
	additional_info  =<<EOF
	{
	  "instanceAwsClientConfiguration" : {
	  "proxyPort" : 8099,
	  "proxyHost": "myproxy.example.com"
	  }
	}
	
	termincation_protection   = false
	keep_job_flow_alive_when_no_steps  = true
	
	ec2_attributes {
	subnet_id   = aws_subnet.main.id
	emr_managed_master_security_group = aws_security_group.sg.id
	emr_manages_slave_security_group = aws_security_group.sg.id
	instance_profile  = aws_iam_instance_profile.emr_profile.arn
	}
	
	master_instance_group{
	  instance_type = "m4.large"
	}
	
	core_instance_group {
	   instance_type = "c4.large"
	   instacne_count = 1
	   
	   ebs_config {
	   size  = "40"
	   type = "gp2"
	   Volumes_per_instance  = 1
	   }
	}
	}