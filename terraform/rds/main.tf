resource "aws_db_subnet_group" "main" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.db_name} DB subnet group"
  }
}

resource "aws_security_group" "rds" {
  name_prefix = "${var.db_name}-rds-"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.eks_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.db_name}-rds-sg"
  }
}

resource "aws_db_instance" "main" {
  identifier             = var.db_name
  allocated_storage      = var.allocated_storage
  storage_type          = "gp2"
  engine                = var.engine
  engine_version        = var.engine_version
  instance_class        = var.instance_class
  db_name               = var.database_name
  username              = var.username
  password              = var.password
  parameter_group_name  = "default.${var.engine}${var.engine_version}"
  db_subnet_group_name  = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  backup_retention_period = var.backup_retention_period
  backup_window         = "03:00-04:00"
  maintenance_window    = "sun:04:00-sun:05:00"
  skip_final_snapshot   = var.skip_final_snapshot
  publicly_accessible   = false
  storage_encrypted     = true

  tags = {
    Name = var.db_name
  }
}
