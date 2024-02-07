provider"aws"{
  
  access_key = "AKIAX2ZR6ZL7HKIQ6MFY"
  secret_key = "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"
 region = "us-west-2"
}

resource "aws_s3_bucket""name1"{

bucket = "mybucket-apurva"
  
}
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = "${aws_s3_bucket.name1.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": [ "s3:PutObject" ],
      "Resource": [
        "arn:aws:s3:::mybucket-apurva/*.txt"
      ]
    },
     {
      "Sid": "Stmt1464968483619",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:PutObject",
      "Resource": [
        "arn:aws:s3:::mybucket-apurva/*.zip"
      ]
    }

  ]
}
EOF
}