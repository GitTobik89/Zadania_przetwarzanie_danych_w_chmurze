resource "aws_glue_catalog_database" "datalake_raw_zone"{

name="datalake_raw_${var.account_number}_${var.student_initials}_${var.student_index_no}"
}


resource "aws_glue_catalog_database" "datalake_processed_zone"{

name="datalake_processed_${var.account_number}_${var.student_initials}_${var.student_index_no}"
}


resource "aws_glue_crawler" "glue_crawler_raw_zone"{

database_name= aws_glue_catalog_database.datalake_raw_zone.name

name = "gc-raw-${var.account_number}_${var.student_initials}_${var.student_index_no}"
role = var.lab_role_arn
table_prefix = "crawler_"

s3_target {
path = "s3://${aws_s3_bucket.raw_bucket.bucket}/raw-zone/stockdata/"
}

tags = merge(local.common_tags,)
}