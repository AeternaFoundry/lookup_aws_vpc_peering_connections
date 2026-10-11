data "aws_vpc_peering_connections" "vpc_peering_connections_lookup" {
  for_each = var.vpc_peering_connections_lookup

  region = each.value.region
  tags   = each.value.tags

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }
}

