resource "aws_db_subnet_group" "main" {
  name = "three-tier-db-subnet-group"

  subnet_ids = [
    aws_subnet.private_db_a.id,
    aws_subnet.private_db_b.id
  ]

  tags = {
    Name = "three-tier-db-subnet-group"
  }
}

resource "aws_db_instance" "main" {
  identifier = "three-tier-database"

  engine         = "mysql"
  engine_version = "8.0"

  instance_class    = var.db_instance_class
  allocated_storage = 20
  storage_type      = "gp3"

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  publicly_accessible = false
  multi_az            = true

  backup_retention_period = 0

  skip_final_snapshot = true
  deletion_protection = false

  tags = {
    Name = "three-tier-database"
    Role = "database"
  }
}