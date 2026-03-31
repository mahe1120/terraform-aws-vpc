resource "aws_vpc_peering_connection" "foo" {
  vpc_id        = aws_vpc.main.id  # Requestor
  peer_vpc_id   = data.aws_vpc.default.id # Acceptor
  auto_accept   = true

  tags = merge(
    var.common_tags,
    var.vpc_peering_tags,
    {
        Name = "${local.resource_name}-default"
    }
  )
  }