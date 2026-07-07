flm = {
  db = {
    iname    = "db-server"
    ami_id   = "ami-06067086cf86c58e6"
    itype    = "t3.micro"
    key_pair = "MyKeyPair"
  }

  be = {
    iname    = "be-server"
    ami_id   = "ami-06067086cf86c58e6"
    itype    = "c7i-flex.large"
    key_pair = "MyKeyPair"
  }

  fe = {
    iname    = "fe-server"
    ami_id   = "ami-06067086cf86c58e6"
    itype    = "m7i-flex.large"
    key_pair = "MyKeyPair"
  }
}
