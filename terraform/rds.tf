# rds/main.tf
resource "aws_db_instance" "db" {
  allocated_storage    = 30
  storage_type         = "gp2"
  engine               = "mysql"
#   engine_version       = "5.7.41"
  instance_class       = "db.t3.micro"
  username             = "wordpress"
  password             = "12345678"
#   parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  publicly_accessible  = false
  vpc_security_group_ids = [aws_security_group.first_security_group.id]  # Changed '.name' to '.id'
}

resource "aws_db_subnet_group" "main" {
  name       = "mydb-subnet-group"
  subnet_ids = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]
}

