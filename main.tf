resource "google_scc_mute_config" "scc_mute_configs" {
  for_each = var.scc_mute_configs

  filter          = each.value.filter
  mute_config_id  = each.value.mute_config_id
  parent          = each.value.parent
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  expiry_time     = each.value.expiry_time
  type            = each.value.type

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

