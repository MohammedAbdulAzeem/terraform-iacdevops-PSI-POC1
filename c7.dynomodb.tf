# A DynamoDB table (called Cricket_Match_List_<env_name>) with 2 fields defined in the table (Match_ID (int) and Match_Location (string) – Match_ID can be a primary key)
# Declare the DynamoDB table
resource "aws_dynamodb_table" "psi_table" {
  name = "Cricket_Match_List-${var.deployment_stage}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "Match_ID"
  range_key = "Match Location"
  attribute {
    name = "Match_ID"
    type = "N"
  }
  attribute {
    name = "Match Location"
    type = "S"
  }
}