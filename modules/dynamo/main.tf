resource "aws_dynamodb_table" "aws_products_tbl" {
  name           = "${var.dynamodb_name}"
  billing_mode                = "PROVISIONED"
  deletion_protection_enabled = false
  hash_key                    = "id"
  range_key                   = "registry_number"
  read_capacity               = 1
  restore_date_time           = null
  restore_source_name         = null
  restore_to_latest_time      = null
  stream_enabled              = false
  stream_view_type            = null
  table_class                 = "STANDARD"
  tags                        = {}
  tags_all                    = {}
  write_capacity              = 1
  attribute {
    name = "id"
    type = "S"
  }
  attribute {
    name = "registry_number"
    type = "N"
  }
  attribute {
    name = "time"
    type = "S"
  }
  global_secondary_index {
    hash_key           = "registry_number"
    name               = "registry_number-time-index"
    non_key_attributes = []
    projection_type    = "ALL"
    range_key          = "time"
    read_capacity      = 1
    write_capacity     = 1
  }
  point_in_time_recovery {
    enabled = false
  }
  ttl {
    attribute_name = ""
    enabled        = false
  }
}