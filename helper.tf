locals {
  major_version   = join(".", slice(split(".", var.openshift_version), 0, 2))
  aws_azs         = (var.aws_azs != null) ? var.aws_azs : tolist([join("",[var.aws_region,"a"]),join("",[var.aws_region,"b"]),join("",[var.aws_region,"c"])])
  
  # (Marek Martofel, Red Hat) as of OCP 4.10 we have a change in location and format of rhcos.json file
  # thad needed to create new lookup to find correct image at the given region
  #
  # code for pre 4.10 was as follows:
  #
  # rhcos_image     = lookup(lookup(lookup(jsondecode(data.http.images.body), "aws"), "${var.aws_region}"),"hvm")

  rhcos_image = lookup(
  lookup(
    lookup(
      lookup(
        lookup(
          lookup(
            lookup(
              jsondecode(data.http.images.response_body),
              "architectures"
            ),
            "x86_64"
          ),
          "images"
        ),
        "aws"
      ),
    "regions"
    ),
  "${var.aws_region}"
  ),
  "image"
 )
}

data "http" "images" {
  url = "https://raw.githubusercontent.com/openshift/installer/release-${local.major_version}/data/data/coreos/rhcos.json"
  request_headers = {
    Accept = "application/json"
  }
}