resource "aws_dynamodb_table" "aws_products_tbl" {
  name           = "${var.dynamodb_name}"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "id"
  
  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "registry_number"
    type = "N"
  }

  ttl {
    attribute_name = "ttl"
    enabled        = true
  }

  global_secondary_index {
    name               = "index"
    hash_key           = "id"
    projection_type    = "ALL"
    read_capacity      = 5
    write_capacity     = 5
  }
  global_secondary_index {
    name               = "index_type"
    hash_key           = "registry_number"
    projection_type    = "ALL"
    read_capacity      = 5
    write_capacity     = 5
  }
}