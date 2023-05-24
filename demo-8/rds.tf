resource "aws_db_subnet_group" "mariadb-subnet" {
  subnet_ids = [aws_subnet.main-private-1.id, aws_subnet.main-private-2.id]
  name = "mariadb-subnet"
  description = "RDS subnet group"
}

resource "aws_db_parameter_group" "mariadb-parameters" {
  family = "mariadb10.4"
  name = "mariadb-parameters"
  description = "MariaDB parameter group"

  parameter {
    name  = "max_allowed_packet"
    value = "16777216"
  }
}

resource "aws_db_instance" "mariadb" {
  instance_class = "db.t2.small"
  allocated_storage = 100 #GB
  engine = "mariadb"
  engine_version = "10.4"
  identifier = "mariadb"
  db_name = "mariadb"
  username = "root"
  password = var.RDS_PASSWORD
  db_subnet_group_name = aws_db_subnet_group.mariadb-subnet.name
  parameter_group_name = aws_db_parameter_group.mariadb-parameters.name
  multi_az = "false"
  vpc_security_group_ids = [aws_security_group.allow-mariadb.id]
  storage_type = "gp2"
  backup_retention_period = 1
  availability_zone = aws_subnet.main-private-1.availability_zone
  skip_final_snapshot = true
  tags = {
    Name = "mariadb-instance"
  }
}